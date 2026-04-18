# frozen_string_literal: true

require "dotenv/load"
require "tty-prompt"
require_relative "version"
require_relative "splash"
require_relative "spinner"
require_relative "signs"
require_relative "horoscope"
require_relative "renderer"
require_relative "exporter"

module Aurastral
  class CLI
    def initialize(args = ARGV)
      @args = args
      @prompt = TTY::Prompt.new(interrupt: :exit)
    end

    def run
      Splash.run
      show_main_menu
    rescue TTY::Reader::InputInterrupt
      puts "\n👋 Goodbye!"
      exit 0
    rescue => e
      error("❌ #{e.message}")
      puts "\nDetalles del error:"
      puts e.backtrace.first(5)
      exit 1
    end

    private

    def show_main_menu
      choice = @prompt.select("✦ ¿Qué deseas hacer?") do |menu|
        menu.choice "Leer mi horóscopo", 1
        menu.choice "Acerca de Aurastral", 2
        menu.choice "Salir", 3
      end

      case choice
      when 1
        read_horoscope_flow
      when 2
        show_about
        show_main_menu
      when 3
        puts "\n👋 ¡Que las estrellas te guíen!\n"
        exit 0
      end
    end

    def read_horoscope_flow
      puts "\n"

      # Step 1: Select sign
      sign = select_sign
      puts "✓ Signo seleccionado: #{sign.inspect}"

      # Step 2: Select period
      period = select_period
      puts "✓ Período seleccionado: #{period.inspect}"

      # Step 3: Ask for mood
      mood = ask_mood
      puts "✓ Humor: #{mood.inspect}"

      # Step 4: Select language
      lang = select_language
      puts "✓ Idioma: #{lang.inspect}"

      # Step 5: Select theme
      theme = select_theme
      puts "✓ Tema: #{theme.inspect}"

      # Step 6: Export option
      should_export = select_export
      puts "✓ Exportar: #{should_export.inspect}"

      puts "\n"

      # Generate horoscope with spinner
      generate_and_display(
        sign: sign,
        period: period,
        mood: mood,
        lang: lang,
        theme: theme,
        export: should_export
      )

      puts "\n"
      choice = @prompt.select("¿Qué sigue?") do |menu|
        menu.choice "Leer otro horóscopo", 1
        menu.choice "Volver al menú", 2
        menu.choice "Salir", 3
      end

      case choice
      when 1
        read_horoscope_flow
      when 2
        show_main_menu
      when 3
        puts "\n👋 ¡Que las estrellas te guíen!\n"
        exit 0
      end
    end

    def select_sign
      signs = Signs.all
      sign_choices = signs.map { |key, data| "#{data[:symbol]}  #{data[:name]}" }

      selected_text = @prompt.select("Selecciona tu signo:", sign_choices, per_page: 6, cycle: true)

      # Encontrar la clave del signo basado en el nombre seleccionado
      signs.each do |key, data|
        if "#{data[:symbol]}  #{data[:name]}" == selected_text
          return key
        end
      end

      raise "Signo no encontrado: #{selected_text.inspect}"
    end

    def select_period
      opciones = { "Día" => "day", "Semana" => "week", "Mes" => "month" }
      seleccion = @prompt.select("Selecciona período:", opciones.keys, cycle: true)
      opciones[seleccion]
    end

    def ask_mood
      @prompt.ask("¿Cómo te sientes hoy? (opcional, presiona Enter para omitir)", default: "neutral")
    end

    def select_language
      choice = @prompt.select("Selecciona idioma:", ["English", "Español"], cycle: true)
      choice == "English" ? "en" : "es"
    end

    def select_theme
      @prompt.select("Selecciona tema:", ["Cosmic", "Minimal"], cycle: true).downcase
    end

    def select_export
      choice = @prompt.select("¿Exportar lectura a Markdown?", ["Sí", "No"], cycle: true)
      choice == "Sí"
    end

    def generate_and_display(sign:, period:, mood:, lang:, theme:, export:)
      spinner = Spinner.run("Consultando las estrellas...")

      begin
        horoscope = Horoscope.new(sign: sign, mood: mood, period: period, lang: lang)
        content = horoscope.generate

        Spinner.success(spinner)

        sign_data = Signs.get(sign.downcase)
        renderer = Renderer.new(theme: theme, use_color: true)
        rendered = renderer.render(content, sign_symbol: sign_data[:symbol], sign_name: sign_data[:name])

        puts rendered

        if export
          exporter = Exporter.new
          filepath = exporter.export(
            content,
            sign: sign,
            metadata: {
              mood: mood,
              period: period,
              lang: lang,
              theme: theme
            }
          )
          success("✓ Lectura guardada en: #{filepath}")
        end
      rescue => e
        Spinner.error(spinner, "✗ Error: #{e.message}")
        raise e
      end
    end

    def show_about
      about_text = <<~TEXT

        ✦ AURASTRAL — Tu Motor de Horóscopo en Terminal ✦

        Versión: #{Aurastral::VERSION}

        Aurastral genera horóscopos personalizados potenciados por la API de Groq
        y el modelo de lenguaje llama-3.3-70b-versatile.

        Características:
        • Lecturas personalizadas según tu signo zodiacal
        • Período y humor personalizables
        • Soporte en inglés y español
        • Temas hermosos para terminal (Cosmic & Minimal)
        • Exportar lecturas a Markdown

        Las estrellas aguardan tu curiosidad...

      TEXT

      puts about_text
    end

    def success(message)
      pastel = Pastel.new
      puts pastel.green(message)
    end

    def error(message)
      pastel = Pastel.new
      $stderr.puts pastel.red(message)
    end
  end
end

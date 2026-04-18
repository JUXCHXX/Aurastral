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
      exit 1
    end

    private

    def show_main_menu
      choice = @prompt.select("✦ What would you like to do?") do |menu|
        menu.choice "Read my horoscope", 1
        menu.choice "About Aurastral", 2
        menu.choice "Exit", 3
      end

      case choice
      when 1
        read_horoscope_flow
      when 2
        show_about
        show_main_menu
      when 3
        puts "\n👋 May the stars guide you!\n"
        exit 0
      end
    end

    def read_horoscope_flow
      puts "\n"

      # Step 1: Select sign
      sign = select_sign

      # Step 2: Select period
      period = select_period

      # Step 3: Ask for mood
      mood = ask_mood

      # Step 4: Select language
      lang = select_language

      # Step 5: Select theme
      theme = select_theme

      # Step 6: Export option
      should_export = select_export

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
      choice = @prompt.select("What next?") do |menu|
        menu.choice "Read another horoscope", 1
        menu.choice "Return to menu", 2
        menu.choice "Exit", 3
      end

      case choice
      when 1
        read_horoscope_flow
      when 2
        show_main_menu
      when 3
        puts "\n👋 May the stars guide you!\n"
        exit 0
      end
    end

    def select_sign
      signs = Signs.all
      sign_choices = signs.map { |key, data| "#{data[:symbol]}  #{data[:name]}" }

      choice_index = @prompt.select("Select your sign:", sign_choices, per_page: 6, cycle: true)
      Signs.all.keys[choice_index]
    end

    def select_period
      @prompt.select("Select period:", ["Day", "Week", "Month"], cycle: true).downcase
    end

    def ask_mood
      @prompt.ask("How are you feeling today? (optional, press Enter to skip)", default: "neutral")
    end

    def select_language
      choice = @prompt.select("Select language:", ["English", "Español"], cycle: true)
      choice == "English" ? "en" : "es"
    end

    def select_theme
      @prompt.select("Select theme:", ["Cosmic", "Minimal"], cycle: true).downcase
    end

    def select_export
      choice = @prompt.select("Export reading to Markdown?", ["Yes", "No"], cycle: true)
      choice == "Yes"
    end

    def generate_and_display(sign:, period:, mood:, lang:, theme:, export:)
      spinner = Spinner.run("Consulting the stars...")

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
          success("✓ Reading saved to: #{filepath}")
        end
      rescue => e
        Spinner.error(spinner, "✗ Failed: #{e.message}")
        raise e
      end
    end

    def show_about
      about_text = <<~TEXT

        ✦ AURASTRAL — Your Terminal Horoscope Engine ✦

        Version: #{Aurastral::VERSION}

        Aurastral generates personalized horoscopes powered by the Groq API
        and the llama-3.3-70b-versatile language model.

        Features:
        • Personalized readings based on your zodiac sign
        • Customizable mood and time period
        • Support for English and Spanish
        • Beautiful terminal themes (Cosmic & Minimal)
        • Export readings to Markdown

        The stars await your curiosity...

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

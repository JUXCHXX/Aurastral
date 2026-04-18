# frozen_string_literal: true

require "optparse"
require "dotenv/load"
require_relative "signs"
require_relative "horoscope"
require_relative "renderer"
require_relative "exporter"

module Aurastral
  class CLI
    def initialize(args = ARGV)
      @args = args
      @options = {}
    end

    def run
      parse_options
      execute
    rescue SystemExit
      # Allow OptionParser to exit cleanly
      raise
    rescue => e
      error("❌ #{e.message}")
      exit 1
    end

    private

    def parse_options
      OptionParser.new do |opts|
        opts.banner = "Usage: aurastral [options]"
        opts.separator ""
        opts.separator "Options:"

        opts.on("--sign SIGN", "Zodiac sign (e.g., aries, taurus)") do |sign|
          @options[:sign] = sign
        end

        opts.on("--mood MOOD", "Your current mood (default: neutral)", "Examples: happy, anxious, curious, melancholic") do |mood|
          @options[:mood] = mood
        end

        opts.on("--period PERIOD", "Time period for horoscope", "Options: day (default), week, month") do |period|
          @options[:period] = period
        end

        opts.on("--lang LANG", "Language for horoscope (default: en)", "Options: en, es") do |lang|
          @options[:lang] = lang
        end

        opts.on("--theme THEME", "Display theme (default: cosmic)", "Options: cosmic, minimal") do |theme|
          @options[:theme] = theme
        end

        opts.on("--export", "Export horoscope to readings/ directory") do
          @options[:export] = true
        end

        opts.on("--no-color", "Disable colored output") do
          @options[:no_color] = true
        end

        opts.on("--list-signs", "List all available zodiac signs") do
          @options[:list_signs] = true
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit 0
        end

        opts.on_tail("-v", "--version", "Show version") do
          puts "Aurastral v0.1.0"
          exit 0
        end
      end.parse!(@args)
    end

    def execute
      if @options[:list_signs]
        list_signs
        return
      end

      sign = @options[:sign] || prompt_for_sign
      mood = @options[:mood] || "neutral"
      period = @options[:period] || "day"
      lang = @options[:lang] || "en"
      theme = @options[:theme] || "cosmic"
      use_color = !@options[:no_color]

      horoscope = Horoscope.new(sign: sign, mood: mood, period: period, lang: lang)
      content = horoscope.generate

      sign_data = Signs.get(sign.downcase)
      renderer = Renderer.new(theme: theme, use_color: use_color)
      rendered = renderer.render(content, sign_symbol: sign_data[:symbol], sign_name: sign_data[:name])

      puts rendered

      if @options[:export]
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
        success("✓ Horoscope exported to: #{filepath}")
      end
    end

    def prompt_for_sign
      require "tty-prompt"

      prompt = TTY::Prompt.new
      signs = Signs.list

      prompt.select("Which zodiac sign are you?", signs, cycle: true, filter: true)
    end

    def list_signs
      signs = Signs.all
      puts "\n🌟 Available Zodiac Signs:\n\n"

      signs.each do |key, data|
        puts "  #{data[:symbol]}  #{data[:name].ljust(15)} (#{data[:dates]})"
      end

      puts "\n"
    end

    def success(message)
      require "pastel"
      pastel = Pastel.new
      puts pastel.green(message)
    end

    def error(message)
      require "pastel"
      pastel = Pastel.new
      $stderr.puts pastel.red(message)
    end
  end
end

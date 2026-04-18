# frozen_string_literal: true

require "pastel"
require_relative "version"

module Aurastral
  class Splash
    LOGO_LINES = [
      "     ✦  ·  ★  ·  ✦  ·  ✧",
      "    ╔═══════════════════════════╗",
      "    ║  A U R A S T R A L        ║",
      "    ║  Horoscope Engine v0.0.2  ║",
      "    ╚═══════════════════════════╝",
      "     ·  ✧  ·  ★  ·  ✦  ·"
    ].freeze

    SUBTITLE = "Your terminal horoscope engine — v0.0.2"

    def self.run
      new.render
    end

    def render
      clear_terminal
      animate_logo
      show_subtitle
      sleep 0.6
    end

    private

    def clear_terminal
      system("clear") || system("cls")
    end

    def animate_logo
      pastel = Pastel.new
      terminal_width = `tput cols`.to_i rescue 80

      LOGO_LINES.each do |line|
        padded_line = center_line(line, terminal_width)
        colored_line = pastel.red(padded_line)
        print colored_line
        sleep 0.15
        puts
      end
    end

    def show_subtitle
      pastel = Pastel.new
      terminal_width = `tput cols`.to_i rescue 80

      puts
      padded_subtitle = center_line(SUBTITLE, terminal_width)
      colored_subtitle = pastel.bright_black(padded_subtitle)
      puts colored_subtitle
      puts
    end

    def center_line(line, width)
      padding = [(width - line.length) / 2, 0].max
      " " * padding + line
    end
  end
end

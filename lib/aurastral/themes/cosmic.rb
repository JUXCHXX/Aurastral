# frozen_string_literal: true

require "tty-box"
require "pastel"

module Aurastral
  module Themes
    class Cosmic
      def initialize(use_color: true)
        @pastel = Pastel.new(enabled: use_color)
      end

      def render(content, sign_symbol:, sign_name:)
        colored_title = @pastel.cyan("✦ #{sign_symbol} #{sign_name.upcase} #{sign_symbol} ✦")
        colored_footer = @pastel.magenta("━━━━━━━━━━━━━━━━━━━━━━")

        box_content = "#{colored_title}\n\n#{content}\n\n#{colored_footer}"

        TTY::Box.frame(
          box_content,
          width: 80,
          height: :auto,
          padding: [1, 2],
          border: :thick,
          style: {
            fg: :cyan,
            bg: :black
          }
        )
      end

      def format_section(title:, content:)
        formatted_title = @pastel.bright_yellow("✧ #{title}")
        "#{formatted_title}\n#{content}"
      end
    end
  end
end

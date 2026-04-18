# frozen_string_literal: true

module Aurastral
  module Themes
    class Minimal
      def initialize(use_color: true)
        @use_color = use_color
      end

      def render(content, sign_symbol:, sign_name:)
        header = "--- #{sign_symbol} #{sign_name.upcase} ---"
        footer = "---"

        "\n#{header}\n\n#{content}\n\n#{footer}\n"
      end

      def format_section(title:, content:)
        "[#{title}]\n#{content}"
      end
    end
  end
end

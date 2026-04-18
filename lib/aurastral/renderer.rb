# frozen_string_literal: true

require_relative "themes/cosmic"
require_relative "themes/minimal"

module Aurastral
  class Renderer
    def initialize(theme: "cosmic", use_color: true)
      @theme_name = theme.downcase
      @use_color = use_color
      @theme = load_theme
    end

    def render(horoscope_content, sign_symbol:, sign_name:)
      @theme.render(horoscope_content, sign_symbol: sign_symbol, sign_name: sign_name)
    end

    private

    def load_theme
      case @theme_name
      when "cosmic"
        Themes::Cosmic.new(use_color: @use_color)
      when "minimal"
        Themes::Minimal.new(use_color: @use_color)
      else
        raise "Unknown theme: #{@theme_name}. Available themes: cosmic, minimal"
      end
    end
  end
end

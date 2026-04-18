# frozen_string_literal: true

require_relative "signs"
require_relative "groq_client"

module Aurastral
  class Horoscope
    def initialize(sign:, mood: "neutral", period: "day", lang: "en")
      raise "Invalid zodiac sign: #{sign}" unless Signs.valid?(sign)
      raise "Invalid period: #{period}. Must be day, week, or month" unless %w[day week month].include?(period)
      raise "Invalid language: #{lang}. Must be en or es" unless %w[en es].include?(lang)

      @sign = sign.downcase
      @mood = mood
      @period = period
      @lang = lang
      @sign_data = Signs.get(@sign)
    end

    def generate
      client = GroqClient.new
      content = client.generate(build_prompt)
      content.strip
    rescue => e
      raise "Failed to generate horoscope: #{e.message}"
    end

    def build_prompt
      case @lang
      when "en"
        build_prompt_en
      when "es"
        build_prompt_es
      end
    end

    private

    def build_prompt_en
      <<~PROMPT
        You are a mystical astrologer. Generate a personalized horoscope reading for someone born under the sign of #{@sign_data[:name]} (#{@sign_data[:symbol]}).

        Sign Details:
        - Zodiac: #{@sign_data[:name]} (#{@sign_data[:dates]})
        - Symbol: #{@sign_data[:symbol]}

        Horoscope Details:
        - Time Period: #{@period.capitalize}
        - User's Current Mood: #{@mood.capitalize}
        - Language: English

        Please provide:
        1. A brief overview for this #{@period}
        2. Love and relationships insight
        3. Career and finances guidance
        4. Health and wellness advice
        5. A lucky number and color for this #{@period}

        Make the horoscope poetic, mystical, and personalized to their mood. Keep it between 200-300 words.
      PROMPT
    end

    def build_prompt_es
      <<~PROMPT
        Eres un astrólogo místico. Genera una lectura de horóscopo personalizada para alguien nacido bajo el signo de #{@sign_data[:name]} (#{@sign_data[:symbol]}).

        Detalles del Signo:
        - Zodiaco: #{@sign_data[:name]} (#{@sign_data[:dates]})
        - Símbolo: #{@sign_data[:symbol]}

        Detalles del Horóscopo:
        - Período: #{@period.capitalize}
        - Humor Actual: #{@mood.capitalize}
        - Idioma: Español

        Por favor, proporciona:
        1. Una descripción general para este #{@period}
        2. Perspectiva sobre amor y relaciones
        3. Orientación en carrera y finanzas
        4. Consejos de salud y bienestar
        5. Un número y color de suerte para este #{@period}

        Haz el horóscopo poético, místico y personalizado a su humor. Mantén entre 200-300 palabras.
      PROMPT
    end
  end
end

# frozen_string_literal: true

require "faraday"
require "json"

module Aurastral
  class GroqClient
    BASE_URL = "https://api.groq.com/openai/v1/chat/completions"
    MODEL = "llama-3.3-70b-versatile"

    def initialize(api_key = nil)
      @api_key = api_key || ENV["GROQ_API_KEY"]
      raise "GROQ_API_KEY not found. Please set it in your .env file or environment." if @api_key.nil? || @api_key.empty?
    end

    def generate(prompt)
      response = client.post(BASE_URL) do |req|
        req.headers["Authorization"] = "Bearer #{@api_key}"
        req.headers["Content-Type"] = "application/json"
        req.body = JSON.generate({
          model: MODEL,
          messages: [
            { role: "user", content: prompt }
          ],
          temperature: 0.7,
          max_tokens: 1024
        })
      end

      handle_response(response)
    rescue Faraday::Error => e
      raise "Failed to connect to Groq API: #{e.message}"
    end

    private

    def client
      @client ||= Faraday.new do |conn|
        conn.adapter Faraday.default_adapter
      end
    end

    def handle_response(response)
      case response.status
      when 200
        body = JSON.parse(response.body)

        # Validar que body es un Hash
        raise "Formato de respuesta inesperado: #{body.class}" unless body.is_a?(Hash)

        # Obtener el contenido
        content = body.dig("choices", 0, "message", "content")
        raise "Formato de respuesta inesperado de la API: no se encontró contenido" if content.nil?

        content
      when 401
        raise "API key de GROQ inválida. Por favor verifica tus credenciales."
      when 429
        raise "Límite de solicitudes excedido. Intenta más tarde."
      else
        raise "Error de la API de Groq (#{response.status}): #{response.body}"
      end
    end
  end
end

# frozen_string_literal: true

require "spec_helper"
require_relative "../lib/aurastral/groq_client"

describe Aurastral::GroqClient do
  describe "#generate" do
    context "with valid API key" do
      it "sends a request to Groq API and returns content" do
        api_key = "test_api_key_12345"
        client = Aurastral::GroqClient.new(api_key)

        stub_request(:post, "https://api.groq.com/openai/v1/chat/completions")
          .with(
            headers: {
              "Authorization" => "Bearer #{api_key}",
              "Content-Type" => "application/json"
            }
          )
          .to_return(
            status: 200,
            body: {
              choices: [
                {
                  message: {
                    content: "You will have a great day!"
                  }
                }
              ]
            }.to_json,
            headers: { "Content-Type" => "application/json" }
          )

        result = client.generate("Tell me a horoscope")

        expect(result).to eq("You will have a great day!")
      end
    end

    context "with invalid API key" do
      it "raises error on 401 response" do
        client = Aurastral::GroqClient.new("invalid_key")

        stub_request(:post, "https://api.groq.com/openai/v1/chat/completions")
          .to_return(status: 401, body: { error: "Unauthorized" }.to_json)

        expect {
          client.generate("Tell me a horoscope")
        }.to raise_error(/Invalid GROQ_API_KEY/)
      end
    end

    context "when rate limited" do
      it "raises error on 429 response" do
        client = Aurastral::GroqClient.new("valid_key")

        stub_request(:post, "https://api.groq.com/openai/v1/chat/completions")
          .to_return(status: 429, body: { error: "Rate limited" }.to_json)

        expect {
          client.generate("Tell me a horoscope")
        }.to raise_error(/Rate limit exceeded/)
      end
    end

    context "with network error" do
      it "raises error when connection fails" do
        client = Aurastral::GroqClient.new("valid_key")

        stub_request(:post, "https://api.groq.com/openai/v1/chat/completions")
          .to_raise(Faraday::ConnectionFailed, "Connection refused")

        expect {
          client.generate("Tell me a horoscope")
        }.to raise_error(/Failed to connect to Groq API/)
      end
    end
  end

  describe "initialization" do
    context "without API key" do
      it "raises error when GROQ_API_KEY is not set" do
        allow(ENV).to receive(:[]).with("GROQ_API_KEY").and_return(nil)

        expect {
          Aurastral::GroqClient.new
        }.to raise_error(/GROQ_API_KEY not found/)
      end
    end

    context "with API key from parameter" do
      it "uses the provided API key" do
        client = Aurastral::GroqClient.new("custom_key_value")

        stub_request(:post, "https://api.groq.com/openai/v1/chat/completions")
          .with(headers: { "Authorization" => "Bearer custom_key_value" })
          .to_return(
            status: 200,
            body: { choices: [{ message: { content: "test" } }] }.to_json
          )

        expect(client.generate("test")).to eq("test")
      end
    end
  end
end

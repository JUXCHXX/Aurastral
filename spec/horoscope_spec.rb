# frozen_string_literal: true

require "spec_helper"
require_relative "../lib/aurastral/horoscope"

describe Aurastral::Horoscope do
  describe "#build_prompt" do
    context "when language is English" do
      it "builds a prompt in English with zodiac details" do
        horoscope = Aurastral::Horoscope.new(
          sign: "leo",
          mood: "excited",
          period: "day",
          lang: "en"
        )

        prompt = horoscope.build_prompt

        expect(prompt).to include("Leo")
        expect(prompt).to include("♌")
        expect(prompt).to include("day")
        expect(prompt).to include("Excited")
        expect(prompt).to include("English")
        expect(prompt).to include("July 23 - August 22")
      end
    end

    context "when language is Spanish" do
      it "builds a prompt in Spanish with zodiac details" do
        horoscope = Aurastral::Horoscope.new(
          sign: "pisces",
          mood: "melancholic",
          period: "week",
          lang: "es"
        )

        prompt = horoscope.build_prompt

        expect(prompt).to include("Piscis")
        expect(prompt).to include("♓")
        expect(prompt).to include("semana")
        expect(prompt).to include("Melancholic")
        expect(prompt).to include("Español")
      end
    end

    context "with different periods" do
      it "includes the period in the prompt" do
        %w[day week month].each do |period|
          horoscope = Aurastral::Horoscope.new(
            sign: "aries",
            period: period,
            lang: "en"
          )

          prompt = horoscope.build_prompt

          expect(prompt).to include(period.capitalize)
        end
      end
    end
  end

  describe "initialization" do
    it "raises error for invalid zodiac sign" do
      expect {
        Aurastral::Horoscope.new(sign: "invalid_sign", lang: "en")
      }.to raise_error("Invalid zodiac sign: invalid_sign")
    end

    it "raises error for invalid period" do
      expect {
        Aurastral::Horoscope.new(sign: "leo", period: "year", lang: "en")
      }.to raise_error(/Invalid period/)
    end

    it "raises error for invalid language" do
      expect {
        Aurastral::Horoscope.new(sign: "leo", lang: "fr")
      }.to raise_error(/Invalid language/)
    end

    it "succeeds with valid parameters" do
      horoscope = Aurastral::Horoscope.new(sign: "gemini", mood: "calm", period: "month", lang: "es")
      expect(horoscope).to be_a(Aurastral::Horoscope)
    end
  end
end

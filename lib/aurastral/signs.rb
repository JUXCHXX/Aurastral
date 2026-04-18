# frozen_string_literal: true

module Aurastral
  class Signs
    ZODIAC_SIGNS = {
      "aries" => {
        symbol: "♈",
        dates: "March 21 - April 19",
        name: "Aries"
      },
      "taurus" => {
        symbol: "♉",
        dates: "April 20 - May 20",
        name: "Taurus"
      },
      "gemini" => {
        symbol: "♊",
        dates: "May 21 - June 20",
        name: "Gemini"
      },
      "cancer" => {
        symbol: "♋",
        dates: "June 21 - July 22",
        name: "Cancer"
      },
      "leo" => {
        symbol: "♌",
        dates: "July 23 - August 22",
        name: "Leo"
      },
      "virgo" => {
        symbol: "♍",
        dates: "August 23 - September 22",
        name: "Virgo"
      },
      "libra" => {
        symbol: "♎",
        dates: "September 23 - October 22",
        name: "Libra"
      },
      "scorpio" => {
        symbol: "♏",
        dates: "October 23 - November 21",
        name: "Scorpio"
      },
      "sagittarius" => {
        symbol: "♐",
        dates: "November 22 - December 21",
        name: "Sagittarius"
      },
      "capricorn" => {
        symbol: "♑",
        dates: "December 22 - January 19",
        name: "Capricorn"
      },
      "aquarius" => {
        symbol: "♒",
        dates: "January 20 - February 18",
        name: "Aquarius"
      },
      "pisces" => {
        symbol: "♓",
        dates: "February 19 - March 20",
        name: "Pisces"
      }
    }.freeze

    def self.valid?(sign)
      ZODIAC_SIGNS.key?(sign.downcase)
    end

    def self.get(sign)
      ZODIAC_SIGNS[sign.downcase]
    end

    def self.all
      ZODIAC_SIGNS
    end

    def self.list
      ZODIAC_SIGNS.keys.map(&:capitalize).sort
    end
  end
end

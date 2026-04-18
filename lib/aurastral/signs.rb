# frozen_string_literal: true

module Aurastral
  class Signs
    ZODIAC_SIGNS = {
      "aries" => {
        symbol: "♈",
        dates: "21 de marzo - 19 de abril",
        name: "Aries"
      },
      "taurus" => {
        symbol: "♉",
        dates: "20 de abril - 20 de mayo",
        name: "Tauro"
      },
      "gemini" => {
        symbol: "♊",
        dates: "21 de mayo - 20 de junio",
        name: "Géminis"
      },
      "cancer" => {
        symbol: "♋",
        dates: "21 de junio - 22 de julio",
        name: "Cáncer"
      },
      "leo" => {
        symbol: "♌",
        dates: "23 de julio - 22 de agosto",
        name: "Leo"
      },
      "virgo" => {
        symbol: "♍",
        dates: "23 de agosto - 22 de septiembre",
        name: "Virgo"
      },
      "libra" => {
        symbol: "♎",
        dates: "23 de septiembre - 22 de octubre",
        name: "Libra"
      },
      "scorpio" => {
        symbol: "♏",
        dates: "23 de octubre - 21 de noviembre",
        name: "Escorpio"
      },
      "sagittarius" => {
        symbol: "♐",
        dates: "22 de noviembre - 21 de diciembre",
        name: "Sagitario"
      },
      "capricorn" => {
        symbol: "♑",
        dates: "22 de diciembre - 19 de enero",
        name: "Capricornio"
      },
      "aquarius" => {
        symbol: "♒",
        dates: "20 de enero - 18 de febrero",
        name: "Acuario"
      },
      "pisces" => {
        symbol: "♓",
        dates: "19 de febrero - 20 de marzo",
        name: "Piscis"
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

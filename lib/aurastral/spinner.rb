# frozen_string_literal: true

require "tty-spinner"
require "pastel"

module Aurastral
  class Spinner
    def self.run(message = "Consultando las estrellas...")
      spinner = TTY::Spinner.new(
        ":spinner #{message}",
        format: :dots,
        output: $stdout
      )

      spinner.auto_spin
      yield spinner if block_given?
      spinner
    end

    def self.success(spinner, message = "✦ Las estrellas han hablado.")
      spinner.success(message)
    end

    def self.error(spinner, message = "✗ La conexión con el cosmos falló.")
      spinner.error(message)
    end
  end
end

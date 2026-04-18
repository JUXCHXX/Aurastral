# frozen_string_literal: true

require "tty-spinner"
require "pastel"

module Aurastral
  class Spinner
    def self.run(message = "Consulting the stars...")
      spinner = TTY::Spinner.new(
        ":spinner #{message}",
        format: :dots,
        output: $stdout
      )

      # Apply color using pastel
      pastel = Pastel.new
      spinner.update(":spinner #{pastel.yellow(message)}")

      spinner.auto_spin
      yield spinner if block_given?
      spinner
    end

    def self.success(spinner, message = "✦ The stars have spoken.")
      spinner.success(message)
    end

    def self.error(spinner, message = "✗ Connection to the cosmos failed.")
      spinner.error(message)
    end
  end
end

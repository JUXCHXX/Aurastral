# frozen_string_literal: true

require "fileutils"
require "time"

module Aurastral
  class Exporter
    def initialize(output_dir: "readings")
      @output_dir = output_dir
      FileUtils.mkdir_p(@output_dir)
    end

    def export(horoscope_content, sign:, metadata: {})
      filename = generate_filename(sign)
      filepath = File.join(@output_dir, filename)

      content = generate_markdown(horoscope_content, sign, metadata)

      File.write(filepath, content)
      filepath
    rescue => e
      raise "Failed to export horoscope: #{e.message}"
    end

    private

    def generate_filename(sign)
      date = Time.now.strftime("%Y-%m-%d")
      "#{date}-#{sign.downcase}.md"
    end

    def generate_markdown(content, sign, metadata)
      timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")

      markdown = "# Horoscope: #{sign.capitalize}\n\n"
      markdown += "**Generated:** #{timestamp}\n"

      if metadata.any?
        markdown += "\n## Metadata\n"
        markdown += "- **Mood:** #{metadata[:mood]}\n" if metadata[:mood]
        markdown += "- **Period:** #{metadata[:period]}\n" if metadata[:period]
        markdown += "- **Language:** #{metadata[:lang]}\n" if metadata[:lang]
        markdown += "- **Theme:** #{metadata[:theme]}\n" if metadata[:theme]
      end

      markdown += "\n## Reading\n\n"
      markdown += content

      markdown
    end
  end
end

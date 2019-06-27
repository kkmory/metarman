require "metarman/version"
require "metarman/weather"
require "metarman/data"
require "metarman/metar_parser"

module Metarman
  class Error < StandardError;
  end

  class GettingMetarError < StandardError
    def initialize(error_code, message)
      @code = error_code
      super("[ERROR] #{error_code} : #{message}")
    end

    def self.exception(error_code, message)
      self.new(error_code, message)
    end

    def self.throw(error_code)
      self.new(error_code, error_message(error_code))
    end

    def self.error_message(error_code)
      case error_code
      when 1001
        "Airport not found. Can not find the airport ICAO ID. Please confirm your input."
      when 1002
        "ICAO ID should be 4 characters. Please confirm your input."
      else
        "Internal error. Please submit issue to GitHub repository."
      end
    end
  end

  def self.get_raw(icao)
    Weather.new(icao).get_raw
  end

  def self.get_with_info(icao)
    Weather.new(icao).get_with_info
  end
end

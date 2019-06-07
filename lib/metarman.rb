require "metarman/version"
require "metarman/weather"
require "metarman/data"
require "metarman/metar_parser"


module Metarman
  class Error < StandardError;
  end

  def self.get_raw(icao)
    Weather.new(icao).get_raw
  end

  def self.get_with_info(icao)
    Weather.new(icao).get_with_info
  end
end

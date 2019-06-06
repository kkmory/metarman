require 'metarman/data'
require 'net/https'

module Metarman
  class Weather
    def initialize(icao)
      @icao = icao.upcase
      @result = {time: nil, airport: nil, metar_raw: nil, weather: nil}
    end

    def get
      uri = URI.parse("https://tgftp.nws.noaa.gov/data/observations/metar/stations/#{@icao}.TXT")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      req = Net::HTTP::Get.new(uri.request_uri)
      res = http.request(req).body.chomp.split("\n")

      @result[:time] = res[0]
      @result[:metar_raw] = res[1]
    end

    def get_raw
      self.get
      @result
    end

    def get_with_info
      self.get
      ap = Data.new(@icao).get
      @result[:airport] = ap
      @result[:weather] = "parsed_metar" #WIP
      @result
    end
  end
end

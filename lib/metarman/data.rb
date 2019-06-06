require 'csv'

module Metarman
  class Data
    def initialize(icao)
      @icao = icao.upcase
      @data = Hash.new{|h,k| h[k]=[]}
      @airport = nil
    end

    # return airport inforomation :Hash like this {"id"=>"2313", "name"=>"Nagasaki Airport", "icao"=>"RJFU", "iata"=>"NGS", "country"=>"Japan", "city_name"=>"Nagasaki", "lat"=>"32.916900634799994", "lon"=>"129.914001465", "elev"=>"15", "utc"=>"9", "dst"=>"U", "timezone"=>"Asia/Tokyo"}
    def get
      # This airport information data is from https://openflights.org/ and edited by author.
      CSV.foreach("./lib/metarman/airports.csv", headers: true) do |row|
        @data[row["icao"]] << row
      end
      @airport = @data[@icao].first.to_h
    end
  end
end

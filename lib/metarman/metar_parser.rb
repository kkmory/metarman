module Metarman
  class MetarParser
    def initialize(wx)
      @raw = wx
      @result = {}
    end

    # ToDo::Rainy or Snow condition
    # ToDo::After QNH
    # ToDo::Refactor This logic is so slowy
    def execute
      orig = @raw.split(" ")
      orig.each do |e|
        if /\d{5}[KT]/ === e
          @result[:wind_dir] = e[0..2]
          @result[:wind_spd] = e[3..4]
        elsif /\d{3}[V]\d{3}/ === e
          @result[:wind_valuable_min] = e[0..2]
          @result[:wind_valuable_max] = e[4..6]
        elsif /^\d{4}$/ === e
          @result[:visibility] = e
        elsif /(CAVOK)/ === e
          @result[:cavok] = true
        elsif /(SKC)/ === e
          @result[:skc] = true
        elsif /(FEW)\d{3}/ === e
          @result[:few] = e[3..5]
        elsif /(SCT)\d{3}/ === e
          @result[:sct] = e[3..5]
        elsif /(BKN)\d{3}/ === e
          @result[:bkn] = e[3..5]
        elsif /(OVC)\d{3}/ === e
          @result[:ovc] = e[3..5]
        elsif /(VV)\d{3}/ === e
          @result[:vv] = e[3..4]
        elsif /^\d{2}[\/]d{2}$/ === e
          @result[:temperture] = e[0..1]
          @result[:dewpoint] = e[3..4]
        elsif /^[Q]\d{4}$/ === e
          @result[:qnh] = e[1..4]
        end
      end
      @result
    end
  end
end

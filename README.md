# Metarman

This gem helps you to get weather of airport.

## Introduction
What's METAR??  
> METAR is a format for reporting weather information. A METAR weather report is predominantly used by pilots in fulfillment of a part of a pre-flight weather briefing, and by meteorologists, who use aggregated METAR information to assist in weather forecasting.
> (Wikipedia: https://en.wikipedia.org/wiki/METAR)

What's source of airport information??
> OpenFlights: https://openflights.org/  
> Thank you for great data sets!!!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'metarman'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metarman

## Usage

#### Get METAR
```ruby
require 'Metarman'
Metarman.get_raw("RJFF") #=> RJFF is ICAO code. NOT IATA code.
#=> {
 # :time=>"2019/06/07 08:00",
 # :metar_raw=>"RJFF 070800Z 19015G26KT 9999 FEW020 SCT030 BKN040 25/18 Q1001 NOSIG RMK 1CU020 4CU030 6CU040 A2957"
 # }
```

#### Get METAR, Airport Information and Human-readable weather
```ruby
require 'Metarman'
Metarman.get_with_info("RJFF") #=> RJFF is ICAO code. NOT IATA code.
#=> {     
 # :time=>"2019/06/07 08:00", 
 # :metar_raw=>"RJFF 070800Z 19015G26KT 9999 FEW020 SCT030 BKN040 25/18 Q1001 NOSIG RMK 1CU020 4CU030 6CU040 A2957", 
 # :airport=>{"id"=>"2305", "name"=>"Fukuoka Airport", "icao"=>"RJFF", "iata"=>"FUK", "country"=>"Japan", "city_name"=>"Fukuoka", "lat"=>"33.585899353027344", "lon"=>"130.4510040283203", "elev"=>"32", "utc"=>"9", "dst"=>"U", "timezone"=>"Asia/Tokyo"}, 
 # :weather=>{:visibility=>"9999", :few=>"020", :sct=>"030", :bkn=>"040", :qnh=>"1001"}
 # }
```

#### NOTE
This METAR-parser ignore after "QNH".

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/moririn772/metarman.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

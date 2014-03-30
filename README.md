# Gpx

gem to read a gpx file

**ATTENTION**: this version works but is still under (slow) development

## Installation

Add this line to your application's Gemfile:

    gem 'gpx_reader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gpx_reader

## Usage

  gpx accept a file as argument or a string.

  To read a gpx file just call @gpx = GPXReader::Gpx.new(file) or @gpx = GPXReader::Gpx.new(string)

  Then use it as follow:

  - @gpx.creator => creator of the file
  - @gpx.time   => Time of creation
  - @gpx.tracks   => array of track
  - for the track inside @gpx.tracks
    - track.name
    - track.desc
  - ...

## Notes
The distance is calculated based on the haversine method ( http://en.wikipedia.org/wiki/Haversine_formula) and implementation of the algorithm is based on the following source: http://www.movable-type.co.uk/scripts/latlong.html

This gem has been written for my own needs, if you feel something is missing don't hesitate to ask


## TODO
  - list all the points directly from the track
  - calcucate boundaries of the tracks/segments unless in the metadata
  - calculate elapsed time
  - write more tests
  - improve performance (currently very long to read a file with 5400 points, approx 16km, takes 25")

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

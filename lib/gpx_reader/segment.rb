#--
# Copyright (c) 2014 Nicolas Aguttes
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++
module GPXReader
  class Segment
    attr_accessor :points, :distance, :elapsed_time

    def initialize(segment)
      @distance = 0
      @elapsed_time = 0
      @points = []
      previous_pt = nil
      segment.css("trkpt").each do |pt|
        point = Point.new(pt)
        @points << point
        # calculate distance
        @distance += haversine_distance(previous_pt, point) unless previous_pt.nil?
        # calculate elapsed tiem
        @elapsed_time += (previous_pt.nil? ? 0  : (point.time.nil? ? 0 : (point.time - previous_pt.time)))
        previous_pt = point
        # puts @points.size if @points.size.modulo(100).zero?
      end
    end

    # caluclate the distance between 2 points
    # http://en.wikipedia.org/wiki/Haversine_formula
    # http://www.movable-type.co.uk/scripts/latlong.html
    # the "Earth radius" R varies from 6356.752 km at the poles to 6378.137 km
    # we calculate  with the average radius (in km)
    RADIUS = 6371
    # Calculate the Haversine distance between two points
    def haversine_distance(pt1, pt2)
      # lat/lon are in degrees, need to convert in radiant
      # formula ==> Degrees * PI / 180
      d_lat = (pt2.lat - pt1.lat) * Math::PI / 180
      d_lon = (pt2.lon - pt1.lon) * Math::PI / 180
      lat1_r = pt1.lat * Math::PI / 180
      lat2_r = pt2.lat * Math::PI / 180
      a = Math.sin(d_lat/2) * Math.sin(d_lat/2) + Math.cos(lat1_r) * Math.cos(lat2_r) * Math.sin(d_lon/2) * Math.sin(d_lon/2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
      d = RADIUS * c
      return d
    end
  end
end

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
  class Gpx
    attr_accessor :creator, :tracks, :boundaries, :lowest_point, :highest_point, :duration, :version, :time, :name
      # read the file containing the tracks
      # get the different information of the file
      # get the tracks
      def initialize(file)
        if file.is_a?(File)
          @gpx=Nokogiri::XML(File.open(file))
        else
          @gpx=Nokogiri::XML(file)
        end
        @creator = @gpx.at_css("gpx")["creator"]
        @time = Time.parse(@gpx.at_css("metadata time").text) rescue nil
        @tracks = []
        @gpx.css("trk").each do |trk|
           trk = Track.new(trk)
           @tracks << trk
        end
      end
  end
end
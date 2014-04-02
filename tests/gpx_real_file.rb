require 'test/unit'
require File.expand_path('../.') + '/gpx_reader/lib/gpx_reader'

class GPXRealFile < Test::Unit::TestCase

  # takes some time to run (approx 25s)
  REAL_FILE = File.join(File.dirname(__FILE__), "gpx_files/tranquiliste_2014_03_02.gpx")

  def test_real_file
    gpx = GPXReader::Gpx.new(File.open(REAL_FILE))
    assert_equal(1, gpx.tracks.size)
    assert_equal(1, gpx.tracks.first.segments.size)
    assert_equal(5424, gpx.tracks.first.segments.first.points.size)
    assert_equal(116, gpx.tracks.first.segments.first.points.first.hr)
    assert_equal("15.76", sprintf('%.2f', gpx.tracks.first.distance))
    assert_equal(5424, gpx.tracks.first.elapsed_time)
  end

end
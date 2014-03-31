require 'test/unit'
require File.expand_path('../.') + '/gpx_reader/lib/gpx_reader'

class GPXFileTest < Test::Unit::TestCase

  ONE_TRACK_FILE = File.join(File.dirname(__FILE__), "gpx_files/1track_4points.gpx")

  def test_load_data_from_file
    gpx = GPXReader::Gpx.new(File.open(ONE_TRACK_FILE))
    assert_equal(1, gpx.tracks.size)
    assert_equal(1, gpx.tracks.first.segments.size)
    assert_equal(4, gpx.tracks.first.segments.first.points.size)
    assert_equal("Track One", gpx.tracks.first.name)
    assert_equal("Track One, one segment, 4 points", gpx.tracks.first.desc)
    assert_equal(Time.parse("2014-02-20 08:42:59 UTC"), gpx.time)
    assert_equal(1349, gpx.tracks.first.segments.first.points[0].elevation)
    assert_equal(1350, gpx.tracks.first.segments.first.points[1].elevation)
    assert_equal(1351, gpx.tracks.first.segments.first.points[2].elevation)
    assert_equal(1352, gpx.tracks.first.segments.first.points[3].elevation)
    assert_equal(91, gpx.tracks.first.segments.first.points[0].hr)
    assert_equal(92, gpx.tracks.first.segments.first.points[1].hr)
    assert_equal(93, gpx.tracks.first.segments.first.points[2].hr)
    assert_equal(94, gpx.tracks.first.segments.first.points[3].hr)
    assert_equal(6.934360396116972, gpx.tracks.first.segments.first.points.first.lon)
    assert_equal(46.03442206978798, gpx.tracks.first.segments.first.points.first.lat)
  end


end
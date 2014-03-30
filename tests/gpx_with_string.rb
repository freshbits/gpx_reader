require 'test/unit'
require File.expand_path('../.') + '/gpx_reader/lib/gpx_reader'

class GPXRealFile < Test::Unit::TestCase

  # 
  TEXT_GPX = '<?xml version="1.0" encoding="UTF-8"?>
<gpx version="1.1" creator="Garmin Connect"
  xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd http://www.garmin.com/xmlschemas/GpxExtensions/v3 http://www.garmin.com/xmlschemas/GpxExtensionsv3.xsd http://www.garmin.com/xmlschemas/TrackPointExtension/v1 http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd"
  xmlns="http://www.topografix.com/GPX/1/1"
  xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1"
  xmlns:gpxx="http://www.garmin.com/xmlschemas/GpxExtensions/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <metadata>
    <link href="connect.garmin.com">
      <text>Garmin Connect</text>
    </link>
    <time>2014-02-20T08:42:59.000Z</time>
  </metadata>
  <trk>
    <name>Track One</name>
    <desc>Track One, one segment, 4 points</desc>
    <trkseg>
      <trkpt lon="6.934360396116972" lat="46.03442206978798">
        <ele>1349</ele>
        <time>2014-02-20T08:42:59.000Z</time>
        <extensions>
          <gpxtpx:TrackPointExtension>
            <gpxtpx:hr>91</gpxtpx:hr>
          </gpxtpx:TrackPointExtension>
        </extensions>
      </trkpt>
      <trkpt lon="6.93439643830061" lat="46.03444067761302">
        <ele>1350.5999755859375</ele>
        <time>2014-02-20T08:43:00.000Z</time>
        <extensions>
          <gpxtpx:TrackPointExtension>
            <gpxtpx:hr>92</gpxtpx:hr>
          </gpxtpx:TrackPointExtension>
        </extensions>
      </trkpt>
      <trkpt lon="6.934469779953361" lat="46.03447579778731">
        <ele>1351.5999755859375</ele>
        <time>2014-02-20T08:43:02.000Z</time>
        <extensions>
          <gpxtpx:TrackPointExtension>
            <gpxtpx:hr>93</gpxtpx:hr>
          </gpxtpx:TrackPointExtension>
        </extensions>
      </trkpt>
      <trkpt lon="6.934554101899266" lat="46.03450287133455">
        <ele>1351.5999755859375</ele>
        <time>2014-02-20T08:43:05.000Z</time>
        <extensions>
          <gpxtpx:TrackPointExtension>
            <gpxtpx:hr>94</gpxtpx:hr>
          </gpxtpx:TrackPointExtension>
        </extensions>
      </trkpt>
    </trkseg>
  </trk>
</gpx>'

  def test_load_data_from_string
    gpx = GPXReader::Gpx.new(TEXT_GPX)
    assert_equal(1, gpx.tracks.size)
    assert_equal(1, gpx.tracks.first.segments.size)
    assert_equal(4, gpx.tracks.first.segments.first.points.size)
    assert_equal("Track One", gpx.tracks.first.name)
    assert_equal("Track One, one segment, 4 points", gpx.tracks.first.desc)
    assert_equal(Time.parse("2014-02-20 08:42:59 UTC"), gpx.time)
    assert_equal(1349, gpx.tracks.first.segments.first.points.first.elevation)
    assert_equal(6.934360396116972, gpx.tracks.first.segments.first.points.first.lon)
    assert_equal(46.03442206978798, gpx.tracks.first.segments.first.points.first.lat)
  end

end
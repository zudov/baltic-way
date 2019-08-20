#!/usr/bin/env bash

echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>'
echo '<gpx xmlns="http://www.topografix.com/GPX/1/1">'
echo '  <url>http://www.thebalticway.eu</url>'
echo '  <url>http://www.thebalticway.eu/_map/route.json</url>'
jq -r '.[] | "  <wpt lat=\"\(.lat)\" lon=\"\(.lon)\"><name>\(.name)</name><desc>\(.desc)</desc><url>\(.url)</url></wpt>"' waypoints.json
echo '  <trk>'
echo '    <name>Baltic Way (Vilnius-Riga-Tallinn)</name>'
echo '    <trkseg>'
jq -r '.route | .[] | "      <trkpt lat=\"\(.[0])\" lon=\"\(.[1])\"></trkpt>"' trackpoints.json
echo '    </trkseg>'
echo '  </trk>'
echo '  <trk>'
echo '    <name>Baltic Way (Tallinn-Riga-Vilnius)</name>'
echo '    <trkseg>'
jq -r '.route | reverse | .[] | "      <trkpt lat=\"\(.[0])\" lon=\"\(.[1])\"></trkpt>"' trackpoints.json
echo '    </trkseg>'
echo '  </trk>'
echo '</gpx>'

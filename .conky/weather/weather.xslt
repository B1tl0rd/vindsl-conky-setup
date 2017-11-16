<!--  weather.xslt

This XSLT is used to translate an XML response from the www.google.com/ig/ XML API.

This style sheet shows the CURRENT WEATHER CONDITIONS in the Conky Weather Section, e.g.

++ Location
++ Forecast Date
++ Humidity
++ Wind

NOTE:   ++ Change the wording and spacing, as necessary.  Specify CITY or POSTAL CODE (as noted below)!!!
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" > 
  <xsl:output method="text" disable-output-escaping="yes"/>
  <xsl:template match="response">
    <xsl:apply-templates select="current_observation"/>
  </xsl:template>
  
  <xsl:template match="current_observation">
    <xsl:variable name="new-line"><xsl:text>&#10;</xsl:text></xsl:variable><!-- Sets line feed variable -->
    <xsl:text>      Location: </xsl:text><!-- 6 spaces before "Location:" 1 space after. Add/subtract spaces for proper alignment) -->
    <xsl:value-of select="display_location/full" /><!-- /city/ (Google API chooses the city's name) /postal_code/ (city's name is determined by your .conkyrc script) --> 
    <xsl:value-of select="$new-line" /><!-- Line feed -->
    <xsl:text>      Humidity: </xsl:text><xsl:value-of select="relative_humidity" /><!-- 6 spaces (output wording is determined by Google API) Add/subtract spaces for proper alignment -->
    <xsl:value-of select="$new-line" /><!-- Line feed -->
    <xsl:text>      Wind: </xsl:text><xsl:value-of select="wind_mph" />mph<!-- 6 spaces (output wording is determined by Google API) Add/subtract spaces for proper alignment -->
  </xsl:template>
</xsl:stylesheet>

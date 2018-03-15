<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.og/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.loc.gov/mods/v3"
    xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd"
    exclude-result-prefixes="xs" xpath-default-namespace="http://www.loc.gov/mods/v3" version="2.0">
    
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- identity transform -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:variable name="filename" select="collection('../mods_by_pid/?select=*.xml')"/>
    
    <xsl:template name="main">
        <xsl:for-each select="$filename">
            <xsl:variable name="fn" select="normalize-space(tokenize(document-uri(.), '/')[last()])"/>
            <!--<xsl:value-of select="concat($fn, '&#10;')"/>-->
            <xsl:result-document href="{concat('./output/',$fn)}">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <!-- apply rights statements.org -->
    <xsl:template match="accessCondition[text()]">
        <accessCondition type="use and reproduction" xlink:href="http://rightsstatements.org/vocab/InC/1.0/">In Copyright</accessCondition>
    </xsl:template>
    <xsl:template match="mods[not(accessCondition[text()])]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <accessCondition type="use and reproduction" xlink:href="http://rightsstatements.org/vocab/InC/1.0/">In Copyright</accessCondition>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
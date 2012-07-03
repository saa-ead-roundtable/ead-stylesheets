<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:ead="urn:isbn:1-931666-22-9" xmlns:ns2="http://www.w3.org/1999/xlink"
    exclude-result-prefixes="xsl ead ns2">
<!-- ========================================================== 
     Written by Joyce Chapman, 2009
     Contact: joyce_chapman@ncsu.edu
    
     This stylesheet provides the basic templates for outputting 
     an EAD's <dsc> into a table with containers in two columns 
     and all other information in a third column. 
     Indentation and layout of information in the third column 
     is controlled through css (please see threecolumn_dsc.css).  
     
     Things this stylesheet assumes that may not be true for your 
     institution include: 
           1. The <c01> has no sibling elements within the <dsc>
           2. All container-level componants have the attribute "level='file'"
              and other @level attributes include only 'series' and 'subseries'
           3. That you have templates in other parts of your 
           stylesheet that apply to various elements, such as <dao> 
           and <physdesc>, that can be called in the <dsc> as well.
 ============================================================= -->
    
    <xsl:template match="archdesc/dsc">
        <div id="dsc" class="section">            
            <h3><xsl:apply-templates select="head"/></h3>
            <xsl:apply-templates select="c01"/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="dsc/head"><xsl:apply-templates/></xsl:template> 
    
    
    <xsl:template name="title">
        <xsl:element name="h3">
            <!-- If there's a parent node with an id that's not empty, output it as an id here -->
            <xsl:if test="parent::node()/@id[not(not(string(.)))]"><xsl:attribute name="id"><xsl:value-of select="parent::node()/@id"/></xsl:attribute></xsl:if>
            <xsl:if test="container">
                <xsl:attribute name="class">file</xsl:attribute>
            </xsl:if>
            <a>  
                <xsl:apply-templates select="unittitle"/>
                <xsl:text> </xsl:text>
                <xsl:apply-templates select="unitdate"/></a>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="component-did">
        <xsl:apply-templates select="physdesc"/>
        <xsl:for-each select="abstract | note/p | langmaterial | materialspec">
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>
    
   
    <xsl:template match="c01">
        <table class="c01">
            <tr>
                <td/>
                <td/>
                <td/>
            </tr>
            <xsl:choose>
                <xsl:when test="did/container">
                    <xsl:apply-templates select="did"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="did"/>
                    <xsl:apply-templates select="c02"/>
                </xsl:otherwise>
            </xsl:choose>
        </table>
    </xsl:template>
    
    <!--Processes series/subseries <did> -->
    <xsl:template match="*[@level='series']/did | *[@level='subseries']/did">
        <tr class="t{count(ancestor::node())}">
            <td colspan="3">
                <xsl:call-template name="title"/>
                <xsl:call-template name="component-did"/>
                <xsl:apply-templates
                    select="following-sibling::scopecontent | following-sibling::bioghist | 
                    following-sibling::arrangement | following-sibling::userestrict | following-sibling::accessrestrict 
                    | following-sibling::processinfo | following-sibling::acqinfo | following-sibling::custodhist | 
                    following-sibling::controlaccess/controlaccess | following-sibling::odd | following-sibling::note |
                    following-sibling::descgrp/*"
                    > </xsl:apply-templates>
            </td>
        </tr>
    </xsl:template>
    
    
    <xsl:template
        match="dsc//scopecontent | dsc//bioghist | dsc//arrangement | dsc//userestrict | dsc//accessrestrict |
        dsc//processinfo | dsc//acqinfo | dsc//custodhist | dsc//controlaccess 
        | dsc//odd | dsc//note | dsc//descgrp/*">
        <xsl:for-each select="*[not(self::head)]">
            <xsl:choose>
                <xsl:when test="ancestor::node()[2]/@level='series' or ancestor::node()[2]/@level='subseries'">
                    <p class="scopelevel"><xsl:apply-templates/></p>
                </xsl:when>
                <xsl:otherwise>
                    <tr class="x{count(ancestor::node())}">
                        <td colspan="3">
                            <p class="scopelevel"><xsl:apply-templates/></p>
                        </td>
                    </tr>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="c02 | c03 | c04 | c05 | c06 | c07 | c08| c09 | c10 | c11 | c12">
        <xsl:apply-templates select="did | c02 | c03 | c04 | c05 | c06 | c07 | c08| c09 | c10 | c11 | c12"/>     
    </xsl:template>
    
    <!-- MATCH ALL <did> FOR COMPONANTS WITH CONTAINERS -->
    <xsl:template match="*[@level='file']/did">
        
        <xsl:variable name="class">
            <xsl:choose>
                <xsl:when test="position() mod 2 = 0">mod0</xsl:when>
                <xsl:otherwise>mod1</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="@audience='internal'"/>
            <xsl:otherwise>  
                <tr class="{$class}">
                    <td valign="top" class="x{count(ancestor::node())}">
                        <span class="containertype">
                            <!-- output the value of the @type attribute, but capitalize it -->
                            <xsl:value-of
                                select="concat(translate(substring(container[1]/@type,
                                1,1),'abcdefghijklmnopqrstuvwxyz',
                                'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),substring(container[1]/@type,2,string-length(container[1]/@type)))"
                            />
                        </span>
                        <xsl:text>&#160;</xsl:text>
                        <span class="container">
                            <xsl:value-of select="container[1]"/>
                        </span>
                    </td>
                    <td valign="top">
                        <span class="containertype">
                            <!-- output the value of the @type attribute, but capitalize it -->
                            <xsl:value-of
                                select="concat(translate(substring(container[2]/@type,
                                1,1),'abcdefghijklmnopqrstuvwxyz',
                                'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),substring(container[2]/@type,2,string-length(container[2]/@type)))"
                            />
                        </span>
                        <xsl:text>&#160;</xsl:text>
                        <span class="container">
                            <xsl:apply-templates select="container[2]"/>
                        </span>
                    </td>
                    <td valign="top">
                        <xsl:call-template name="title"/>
                        <xsl:call-template name="component-did"/>
                        <xsl:for-each select="abstract | note/p | langmaterial | materialspec">
                            <xsl:apply-templates/>
                        </xsl:for-each>
                    </td>
                </tr>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>

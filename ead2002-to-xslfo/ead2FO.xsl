<!-- EAD Cookbook Stylesheet for XSL-FO   Version 0.9   12 July 2006 -->
<!--This stylesheet generates XSL:FO objects.  It is an update to eadcbs1.xsl designed
to work with EAD 2002.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:strip-space elements="*"/>
	<xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>
	<!-- Creates the body of the finding aid.-->
	<xsl:template match="/ead">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="pages"
					page-height="11in" page-width="8.5in"
					margin="5mm 25mm 5mm 25mm">
					<fo:region-body margin="20mm 0mm 20mm 0mm"/>
					<fo:region-before extent="10mm"/>
					<fo:region-after extent="10mm"/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="cover"
					page-height="11in" page-width="8.5in">
					<fo:region-body margin="20mm 20mm 20mm 20mm"/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="toc"
					page-height="11in" page-width="8.5in">
					<fo:region-body margin="20mm 20mm 20mm 20mm"/>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="dsc"
					page-height="11in" page-width="8.5in">
					<fo:region-body margin="20mm 20mm 20mm 20mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="cover">
				<fo:flow flow-name="xsl-region-body">
					<fo:block space-before="2.0in" font-size="16pt"
					font-family="Times"
					font-weight="bold" text-align="center">
						<xsl:value-of select="archdesc/did/origination"/>
					</fo:block>
					<fo:block space-before="0.5in" font-size="16pt"
					font-family="Times"
					font-weight="bold" text-align="center">
						<xsl:value-of select="archdesc/did/unittitle"/>
						<xsl:text>,&#160;</xsl:text>
						<xsl:value-of select="archdesc/did/unitdate"/>
					</fo:block>
					<fo:block space-before="2.0in" text-align="center">
						<fo:external-graphic src="mhslogo.gif"/>
					</fo:block>
					<fo:block font-size="14pt" font-family="Times"
					font-weight="bold"
					space-before="1.0in" space-after="1.5in" text-align="center">
						<xsl:value-of select="archdesc/did/repository"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
			<fo:page-sequence master-reference="toc">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="center" font-family="Times"
					font-size="10pt" font-weight="bold"></fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block font-size="16pt" font-family="sans-serif"
						font-weight="bold" space-before="5pt" space-after="15pt"
						keep-with-next.within-page="always" text-align="center">					
						Table of Contents</fo:block>
					<xsl:call-template name="toc"/>
				</fo:flow>
			</fo:page-sequence>
			<fo:page-sequence master-reference="pages" initial-page-number="1">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="center" font-family="Times"
					font-size="12pt" font-weight="bold">
						<xsl:value-of select="archdesc/did/repository"/>
					</fo:block>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-after">
					<fo:block font-size="12pt">
						<fo:inline text-align="left">
							<xsl:text>Page </xsl:text>
							<fo:page-number/>
						</fo:inline>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="findaid"/>
				</fo:flow>
			</fo:page-sequence>
			<fo:page-sequence master-reference="dsc">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="center" font-family="Times"
					font-size="12pt" font-weight="bold">
						<xsl:value-of select="archdesc/did/repository"/>
					</fo:block>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-after">
					<fo:block font-size="12pt">
						<fo:inline text-align="left">
							<xsl:text>Page </xsl:text>
							<fo:page-number/>
						</fo:inline>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates select="archdesc/dsc"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template name="findaid">
		<!--To change the order of display, adjust the sequence of
			the following apply-template statements which invoke the various
			templates that populate the finding aid.  Multiple statements
			are included to handle the possibility that descgrp has been used
			as a wrapper to replace add and admininfo.  In several cases where
			multiple elemnents are displayed together in the output, a call-template
			statement is used-->
		<xsl:apply-templates select="archdesc/did"/>
		<xsl:apply-templates select="archdesc/bioghist"/>
		<xsl:apply-templates select="archdesc/scopecontent"/>
		<xsl:apply-templates select="archdesc/arrangement"/>
		<xsl:call-template name="archdesc-restrict"/>
		<xsl:call-template name="archdesc-relatedmaterial"/>
		<xsl:apply-templates select="archdesc/controlaccess"/>
		<xsl:apply-templates select="archdesc/odd"/>
		<xsl:apply-templates select="archdesc/originalsloc"/>
		<xsl:apply-templates select="archdesc/phystech"/>
		<xsl:call-template name="archdesc-admininfo"/>
		<xsl:apply-templates select="archdesc/otherfindaid | archdesc/*/otherfindaid"/>
		<xsl:apply-templates select="archdesc/fileplan | archdesc/*/fileplan"/>
		<xsl:apply-templates select="archdesc/bibliography | archdesc/*/bibliography"/>
		<xsl:apply-templates select="archdesc/index | archdesc/*/index"/>
	</xsl:template>
	<!--This template creates basic styles for the finding aid.-->
	<xsl:attribute-set name="divIndent25">
		<xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="font-family">Times</xsl:attribute>
		<xsl:attribute name="margin-left">25pt</xsl:attribute>
		<xsl:attribute name="space-before">5pt</xsl:attribute>
		<xsl:attribute name="space-after">5pt</xsl:attribute>
		<xsl:attribute name="keep-together.within-page">always</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="divIndent50">
		<xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="font-family">Times</xsl:attribute>
		<xsl:attribute name="margin-left">50pt</xsl:attribute>
		<xsl:attribute name="space-before">5pt</xsl:attribute>
		<xsl:attribute name="space-after">5pt</xsl:attribute>
		<xsl:attribute name="keep-together.within-page">always</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="component">
		<xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="font-family">Times</xsl:attribute>
		<xsl:attribute name="space-before">5pt</xsl:attribute>
		<xsl:attribute name="space-after">10pt</xsl:attribute>
		<xsl:attribute name="keep-together.within-page">always</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="h2">
		<xsl:attribute name="font-size">16pt</xsl:attribute>
		<xsl:attribute name="font-family">sans-serif</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="space-before">19pt</xsl:attribute>
		<xsl:attribute name="space-after">5pt</xsl:attribute>
		<xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="h3">
		<xsl:attribute name="font-size">13pt</xsl:attribute>
		<xsl:attribute name="font-family">sans-serif</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="space-before">14pt</xsl:attribute>
		<xsl:attribute name="space-after">5pt</xsl:attribute>
		<xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="h4">
		<xsl:attribute name="font-size">12pt</xsl:attribute>
		<xsl:attribute name="font-family">sans-serif</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="space-before">5pt</xsl:attribute>
		<xsl:attribute name="space-after">5pt</xsl:attribute>
		<xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="toc">
		<xsl:if test="string(archdesc/did/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:value-of select="archdesc/did/head"/>
				<fo:leader leader-pattern="dots"/>
				<fo:page-number-citation ref-id="{generate-id(archdesc/did/head)}"/>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/bioghist/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:value-of select="archdesc/bioghist/head"/>
				<fo:leader leader-pattern="dots"/>
				<fo:page-number-citation ref-id="{generate-id(archdesc/bioghist/head)}"/>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/scopecontent/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:value-of select="archdesc/scopecontent/head"/>
				<fo:leader leader-pattern="dots"/>
				<fo:page-number-citation ref-id="{generate-id(archdesc/scopecontent/head)}"/>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/arrangement/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:value-of select="archdesc/arrangement/head"/>
				<fo:leader leader-pattern="dots"/>
				<fo:page-number-citation ref-id="{generate-id(archdesc/arrangement/head)}"/>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/userestrict/head)
		or string(archdesc/accessrestrict/head)
		or string(archdesc/*/userestrict/head)
		or string(archdesc/*/accessrestrict/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:text>Restrictions</xsl:text>
				<fo:leader leader-pattern="dots"/>
				<fo:inline text-align="right">
					<fo:page-number-citation ref-id="restrictlink"/>
				</fo:inline>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/controlaccess/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:value-of select="archdesc/controlaccess/head"/>
				<fo:leader leader-pattern="dots"/>
				<fo:page-number-citation ref-id="{generate-id(archdesc/controlaccess/head)}"/>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/relatedmaterial)
		or string(archdesc/separatedmaterial)
		or string(archdesc/*/relatedmaterial)
		or string(archdesc/*/separatedmaterial)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:text>Related Material</xsl:text>
				<fo:leader leader-pattern="dots"/>
				<fo:page-number-citation ref-id="relatedmatlink"/>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/acqinfo/*)
		or string(archdesc/processinfo/*)
		or string(archdesc/prefercite/*)
		or string(archdesc/custodialhist/*)
		or string(archdesc/processinfo/*)
		or string(archdesc/appraisal/*)
		or string(archdesc/accruals/*)
		or string(archdesc/*/acqinfo/*)
		or string(archdesc/*/processinfo/*)
		or string(archdesc/*/prefercite/*)
		or string(archdesc/*/custodialhist/*)
		or string(archdesc/*/processinfo/*)
		or string(archdesc/*/appraisal/*)
		or string(archdesc/*/accruals/*)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:text>Administrative Information</xsl:text>
				<fo:leader leader-pattern="dots"/>
				<fo:page-number-citation ref-id="adminlink"/>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/otherfindaid/head)
			or string(archdesc/*/otherfindaid/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:choose>
					<xsl:when test="archdesc/otherfindaid/head">
						<xsl:value-of select="archdesc/otherfindaid/head"/>
						<fo:leader leader-pattern="dots"/>
						<fo:page-number-citation ref-id="{generate-id(archdesc/otherfindiad/head)}"/>
					</xsl:when>
					<xsl:when test="archdesc/*/otherfindaid/head">
						<xsl:value-of select="archdesc/*/otherfindaid/head"/>
						<fo:leader leader-pattern="dots"/>
						<fo:page-number-citation ref-id="{generate-id(archdesc/*/otherfindaid/head)}"/>
					</xsl:when>
				</xsl:choose>
			</fo:block>
		</xsl:if>
		<!--The next test covers the situation where there is more than one odd element
			in the document.-->
		<xsl:if test="string(archdesc/odd/head)">
			<xsl:for-each select="archdesc/odd">
				<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
					<xsl:value-of select="head"/>
					<fo:leader leader-pattern="dots"/>
					<fo:page-number-citation ref-id="{generate-id(head)}"/>
				</fo:block>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="string(archdesc/bibliography/head)
			or string(archdesc/*/bibliography/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:choose>
					<xsl:when test="archdesc/bibliography/head">
						<xsl:value-of select="archdesc/bibliography/head"/>
						<fo:leader leader-pattern="dots"/>
						<fo:page-number-citation ref-id="{generate-id(archdesc/bibliography/head)}"/>
					</xsl:when>
					<xsl:when test="archdesc/*/bibliography/head">
						<xsl:value-of select="archdesc/*/bibliography/head"/>
						<fo:leader leader-pattern="dots"/>
						<fo:page-number-citation ref-id="{generate-id(archdesc/*/bibliography/head)}"/>
					</xsl:when>
				</xsl:choose>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/index/head)
			or string(archdesc/*/index/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:choose>
					<xsl:when test="archdesc/index/head">
						<xsl:value-of select="archdesc/index/head"/>
						<fo:leader leader-pattern="dots"/>
						<fo:page-number-citation ref-id="{generate-id(archdesc/index/head)}"/>
					</xsl:when>
					<xsl:when test="archdesc/*/index/head">
						<xsl:value-of select="archdesc/*/index/head"/>
						<fo:leader leader-pattern="dots"/>
						<fo:page-number-citation ref-id="{generate-id(archdesc/*/index/head)}"/>
					</xsl:when>
				</xsl:choose>
			</fo:block>
		</xsl:if>
		<xsl:if test="string(archdesc/dsc/head)">
			<fo:block xsl:use-attribute-sets="h4" text-align-last="justify">
				<xsl:value-of select="archdesc/dsc/head"/>
				<fo:leader leader-pattern="dots"/>
				<fo:page-number-citation ref-id="{generate-id(archdesc/dsc/head)}"/>
			</fo:block>
			<!-- Displays the unittitle and unitdates for a c01 if it is a
			subgrp, subcollection,series or subseries (as
			evidenced by the value of @level) and numbers them
			to form a hyperlink to each.   Delete this section if you do not
			wish the c01 titles that are so identified
			to appear in the table of contents.-->
			<xsl:for-each select="archdesc/dsc/c01[@level='series' or @level='subseries'
			or @level='subgrp' or @level='subcollection']">
				<fo:block xsl:use-attribute-sets="h4" text-align-last="justify" margin-left="25pt">
					<xsl:value-of select="did/unittitle"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="did/unitdate"/>
					<fo:leader leader-pattern="dots"/>
					<fo:page-number-citation ref-id="{generate-id(did)}"/>
				</fo:block>
			</xsl:for-each>
			<!--This ends the section that causes the c01 titles to appear in the table of contents.-->
		</xsl:if>
		<!--End of the table of contents. -->
	</xsl:template>
	<!-- The following general templates format the display of various RENDER
	 attributes.-->
	<xsl:template match="emph[@render='bold']">
		<fo:inline font-weight="bold">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='italic']">
		<fo:inline font-style="italic">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='underline']">
		<fo:inline text-decoration="underline">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='sub']">
		<fo:inline vertical-align="sub">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='super']">
		<fo:inline vertical-align="super">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='quoted']">
		<fo:inline>
			<xsl:text>"</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>"</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='doublequote']">
		<fo:inline>
			<xsl:text>"</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>"</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='singlequote']">
		<fo:inline>
			<xsl:text>'</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>'</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='bolddoublequote']">
		<fo:inline font-weight="bold">
			<xsl:text>"</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>"</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='boldsinglequote']">
		<fo:inline font-weight="bold">
			<xsl:text>'</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>'</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='boldunderline']">
		<fo:inline font-weight="bold" text-decoration="underline">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='bolditalic']">
		<fo:inline font-weight="bold" font-style="italic">>	
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='boldsmcaps']">
		<fo:inline font-weight="bold" font-variant="small-caps">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="emph[@render='smcaps']">
		<fo:inline font-variant="small-caps">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='bold']">
		<fo:inline font-weight="bold">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='italic']">
		<fo:inline font-style="italic">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='underline']">
		<fo:inline text-decoration="underline">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='sub']">
		<fo:inline vertical-align="sub">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='super']">
		<fo:inline vertical-align="super">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='quoted']">
		<fo:inline>
			<xsl:text>"</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>"</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='doublequote']">
		<fo:inline>
			<xsl:text>"</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>"</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='singlequote']">
		<fo:inline>
			<xsl:text>'</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>'</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='bolddoublequote']">
		<fo:inline font-weight="bold">
			<xsl:text>"</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>"</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='boldsinglequote']">
		<fo:inline font-weight="bold">
			<xsl:text>'</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>'</xsl:text>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='boldunderline']">
		<fo:inline font-weight="bold" text-decoration="underline">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='bolditalic']">
		<fo:inline font-weight="bold" font-style="italic">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='boldsmcaps']">
		<fo:inline font-weight="bold" font-variant="small-caps">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<xsl:template match="title[@render='smcaps']">
		<fo:inline font-variant="small-caps">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<!--This template rule formats a list element anywhere
	except in arrangement.-->
	<xsl:template match="list[parent::*[not(self::arrangement)]]/head">
		<fo:block xsl:use-attribute-sets="divIndent25">
			<fo:inline font-weight="bold">
				<xsl:apply-templates/>
			</fo:inline>
		</fo:block>
	</xsl:template>
	<xsl:template match="list[parent::*[not(self::arrangement)]]/item">
		<fo:block xsl:use-attribute-sets="divIndent50">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!--This template rule formats a chronlist element.-->
	<xsl:template match="chronlist">
		<fo:table width="100%" style="margin-left:25pt">
			<fo:table-column column-width="5%"></fo:table-column>
			<fo:table-column column-width="15%"></fo:table-column>
			<fo:table-column column-width="80%"></fo:table-column>
			<fo:table-body>
				<xsl:apply-templates/>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template match="chronlist/head">
		<fo:table-row>
			<fo:table-cell number-columns-spanned="3">
				<fo:block xsl:use-attribute-sets="h4">
					<xsl:apply-templates/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="chronlist/listhead">
		<fo:table-row>
			<fo:table-cell>
				<fo:block> </fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:inline font-weight="bold">
					<xsl:apply-templates select="head01"/>
				</fo:inline>
			</fo:table-cell>
			<fo:table-cell>
				<fo:inline font-weight="bold">
					<xsl:apply-templates select="head02"/>
				</fo:inline>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="chronitem">
		<!--Determine if there are event groups.-->
		<xsl:choose>
			<xsl:when test="eventgrp">
				<!--Put the date and first event on the first line.-->
				<fo:table-row>
					<fo:table-cell>
						<fo:block> </fo:block>
					</fo:table-cell>
					<fo:table-cell vertical-align="top">
						<xsl:apply-templates select="date"/>
					</fo:table-cell>
					<fo:table-cell vertical-align="top">
						<xsl:apply-templates select="eventgrp/event[position()=1]"/>
					</fo:table-cell>
				</fo:table-row>
				<!--Put each successive event on another line.-->
				<xsl:for-each select="eventgrp/event[not(position()=1)]">
					<fo:table-row>
						<fo:table-cell>
							<fo:block> </fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block> </fo:block>
						</fo:table-cell>
						<fo:table-cell vertical-align="top">
							<xsl:apply-templates select="."/>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</xsl:when>
			<!--Put the date and event on a single line.-->
			<xsl:otherwise>
				<fo:table-row>
					<fo:table-cell>
						<fo:block> </fo:block>
					</fo:table-cell>
					<fo:table-cell vertical-align="top">
						<xsl:apply-templates select="date"/>
					</fo:table-cell>
					<fo:table-cell vertical-align="top">
						<xsl:apply-templates select="event"/>
					</fo:table-cell>
				</fo:table-row>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--Suppreses all other elements of eadheader.-->
	<xsl:template match="eadheader"/>
	<!--This template creates a table for the did, inserts the head and then
each of the other did elements.  To change the order of appearance of these
elements, change the sequence of the apply-templates statements.-->
	<xsl:template match="archdesc/did">
		<fo:table width="7in" table-layout="fixed">
			<fo:table-column column-width="2in"></fo:table-column>
			<fo:table-column column-width="5in"></fo:table-column>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell number-columns-spanned="2">
						<fo:block xsl:use-attribute-sets="h3" id="{generate-id(head)}">
							<xsl:apply-templates select="head"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<!--One can change the order of appearance for the children of did
				by changing the order of the following statements.-->
				<xsl:apply-templates select="repository"/>
				<xsl:apply-templates select="origination"/>
				<xsl:apply-templates select="unittitle"/>
				<xsl:apply-templates select="unitdate"/>
				<xsl:apply-templates select="physdesc"/>
				<xsl:apply-templates select="abstract"/>
				<xsl:apply-templates select="unitid"/>
				<xsl:apply-templates select="physloc"/>
				<xsl:apply-templates select="langmaterial"/>
				<xsl:apply-templates select="materialspec"/>
				<xsl:apply-templates select="note"/>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<!--This template formats the repostory, origination, physdesc, abstract,
	unitid, physloc and materialspec elements of archdesc/did which share a common presentaiton.
	The sequence of their appearance is governed by the previous template.-->
	<xsl:template match="archdesc/did/repository
	| archdesc/did/origination
	| archdesc/did/physdesc
	| archdesc/did/unitid
	| archdesc/did/physloc
	| archdesc/did/abstract
	| archdesc/did/langmaterial
	| archdesc/did/materialspec">
		<!--The template tests to see if there is a label attribute,
		inserting the contents if there is or adding display textif there isn't.
		The content of the supplied label depends on the element.  To change the
		supplied label, simply alter the template below.-->
		<xsl:choose>
			<xsl:when test="@label">
				<fo:table-row>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<fo:inline font-weight="bold">
								<xsl:value-of select="@label"/>
							</fo:inline>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block margin-left="25pt" font-family="Times" font-size="11pt">
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:when>
			<xsl:otherwise>
				<fo:table-row>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<fo:inline font-weight="bold">
								<xsl:choose>
									<xsl:when test="self::repository">
										<xsl:text>Repository: </xsl:text>
									</xsl:when>
									<xsl:when test="self::origination">
										<xsl:text>Creator: </xsl:text>
									</xsl:when>
									<xsl:when test="self::physdesc">
										<xsl:text>Quantity: </xsl:text>
									</xsl:when>
									<xsl:when test="self::physloc">
										<xsl:text>Location: </xsl:text>
									</xsl:when>
									<xsl:when test="self::unitid">
										<xsl:text>Identification: </xsl:text>
									</xsl:when>
									<xsl:when test="self::abstract">
										<xsl:text>Abstract: </xsl:text>
									</xsl:when>
									<xsl:when test="self::langmaterial">
										<xsl:text>Language: </xsl:text>
									</xsl:when>
									<xsl:when test="self::materialspec">
										<xsl:text>Technical: </xsl:text>
									</xsl:when>
								</xsl:choose>
							</fo:inline>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- The following two templates test for and processes various permutations
of unittitle and unitdate.-->
	<xsl:template match="archdesc/did/unittitle">
		<!--The template tests to see if there is a label attribute for unittitle,
inserting the contents if there is or adding one if there isn't. -->
		<xsl:choose>
			<xsl:when test="@label">
				<fo:table-row>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<fo:inline font-weight="bold">
								<xsl:value-of select="@label"/>
							</fo:inline>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<!--Inserts the text of unittitle and any children other that unitdate.-->
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<xsl:apply-templates select="text() |* [not(self::unitdate)]"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:when>
			<xsl:otherwise>
				<fo:table-row>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<fo:inline font-weight="bold">
								<xsl:text>Title: </xsl:text>
							</fo:inline>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<xsl:apply-templates select="text() |* [not(self::unitdate)]"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:otherwise>
		</xsl:choose>
		<!--If unitdate is a child of unittitle, it inserts unitdate on a new line.  -->
		<xsl:if test="child::unitdate">
			<!--The template tests to see if there is a label attribute for unittitle,
			inserting the contents if there is or adding one if there isn't. -->
			<xsl:choose>
				<xsl:when test="unitdate/@label">
					<fo:table-row>
						<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
							<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
								<fo:inline font-weight="bold">
									<xsl:value-of select="unitdate/@label"/>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
							<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
								<xsl:apply-templates select="unitdate"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:when>
				<xsl:otherwise>
					<fo:table-row>
						<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
							<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
								<fo:inline font-weight="bold">
									<xsl:text>Dates: </xsl:text>
								</fo:inline>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
							<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
								<xsl:apply-templates select="unitdate"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- Processes the unit date if it is not a child of unit title but a child of did, the current context.-->
	<xsl:template match="archdesc/did/unitdate">
		<!--The template tests to see if there is a label attribute for a unittitle that is the
	child of did and not unittitle, inserting the contents if there is or adding one if there isn't.-->
		<xsl:choose>
			<xsl:when test="@label">
				<fo:table-row>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<fo:inline font-weight="bold">
								<xsl:value-of select="@label"/>
							</fo:inline>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:when>
			<xsl:otherwise>
				<fo:table-row>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<fo:inline font-weight="bold">
								<xsl:text>Dates: </xsl:text>
							</fo:inline>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
						<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
							<xsl:apply-templates/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--This template processes the note element.-->
	<xsl:template match="archdesc/did/note">
		<xsl:for-each select="p">
			<!--The template tests to see if there is a label attribute,
inserting the contents if there is or adding one if there isn't. -->
			<xsl:choose>
				<xsl:when test="parent::note[@label]">
					<!--This nested choose tests for and processes the first paragraph. Additional paragraphs do not get a label.-->
					<xsl:choose>
						<xsl:when test="position()=1">
							<fo:table-row>
								<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
									<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
										<fo:inline font-weight="bold">
											<xsl:value-of select="@label"/>
										</fo:inline>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
									<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
										<xsl:apply-templates/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-row>
								<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt"/>
								<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
									<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
										<xsl:apply-templates/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<!--Processes situations where there is no
					label attribute by supplying default text.-->
				<xsl:otherwise>
					<!--This nested choose tests for and processes the first paragraph. Additional 		paragraphs do not get a label.-->
					<xsl:choose>
						<xsl:when test="position()=1">
							<fo:table-row>
								<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
									<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
										<fo:inline font-weight="bold">
											<xsl:text>Note: </xsl:text>
										</fo:inline>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
									<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
										<xsl:apply-templates/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-row>
								<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt"/>
								<fo:table-cell vertical-align="top" padding-bottom="5pt" padding-top="5pt">
									<fo:block text-indent="25pt" font-family="Times" font-size="11pt">
										<xsl:apply-templates/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			<!--Closes each paragraph-->
		</xsl:for-each>
	</xsl:template>
	<!--This template rule formats the top-level bioghist element and
		creates a link back to the top of the page after the display of the element.-->
	<xsl:template match="archdesc/bioghist |
			archdesc/scopecontent |
			archdesc/phystech |
			archdesc/odd   |
			archdesc/arrangement">
		<xsl:if test="string(child::*)">
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<!--This template formats various head elements and makes them targets for
		links from the Table of Contents.-->
	<xsl:template match="archdesc/bioghist/head  |
			archdesc/scopecontent/head |
			archdesc/phystech/head |
			archdesc/controlaccess/head |
			archdesc/odd/head |
			archdesc/arrangement/head">
		<fo:block xsl:use-attribute-sets="h3" id="{generate-id()}">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="archdesc/bioghist/p |
			archdesc/scopecontent/p |
			archdesc/phystech/p |
			archdesc/controlaccess/p |
			archdesc/odd/p |
			archdesc/bioghist/note/p |
			archdesc/arrangement/p |
			archdesc/scopecontent/note/p |
			archdesc/phystech/note/p |
			archdesc/controlaccess/note/p |
			archdesc/odd/note/p">
		<fo:block xsl:use-attribute-sets="divIndent25">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="archdesc/bioghist/bioghist/head |
		archdesc/scopecontent/scopecontent/head">
		<fo:block xsl:use-attribute-sets="h3" id="{generate-id()}" margin-left="25pt">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="archdesc/bioghist/bioghist/p |
		archdesc/scopecontent/scopecontent/p |
		archdesc/bioghist/bioghist/note/p |
		archdesc/scopecontent/scopecontent/note/p">
		<fo:block xsl:use-attribute-sets="divIndent50">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!-- The next two templates format an arrangement
	statement embedded in <scopecontent>.-->
	<xsl:template match="archdesc/scopecontent/arrangement/head">
		<fo:block xsl:use-attribute-sets="h4"  id="{generate-id()}">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="archdesc/scopecontent/arrangement/p
	| archdesc/scopecontent/arrangement/note/p">
		<fo:block xsl:use-attribute-sets="divIndent50">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!-- The next three templates format a list within an arrangement
	statement whether it is directly within <archdesc> or embedded in
	<scopecontent>.-->
	<xsl:template match="archdesc/scopecontent/arrangement/list/head">
		<fo:block xsl:use-attribute-sets="divIndent25">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="archdesc/arrangement/list/head">
		<fo:block xsl:use-attribute-sets="divIndent25" id="{generate-id()}">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="archdesc/scopecontent/arrangement/list/item
	| archdesc/arrangement/list/item">
		<fo:block xsl:use-attribute-sets="divIndent50">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!--This template rule formats the top-level related material
	elements by combining any related or separated materials
	elements. It begins by testing to see if there related or separated
	materials elements with content.-->
	<xsl:template name="archdesc-relatedmaterial">
		<xsl:if test="string(archdesc/relatedmaterial) or
		string(archdesc/*/relatedmaterial) or
		string(archdesc/separatedmaterial) or
		string(archdesc/*/separatedmaterial)">
			<fo:block xsl:use-attribute-sets="h3" id="relatedmatlink">
				<fo:inline font-weight="bold">
					<xsl:text>Related Material</xsl:text>
				</fo:inline>
			</fo:block>
			<xsl:apply-templates select="archdesc/relatedmaterial/p
				| archdesc/*/relatedmaterial/p
				| archdesc/relatedmaterial/note/p
				| archdesc/*/relatedmaterial/note/p"/>
			<xsl:apply-templates select="archdesc/separatedmaterial/p
				| archdesc/*/separatedmaterial/p
				| archdesc/separatedmaterial/note/p
				| archdesc/*/separatedmaterial/note/p"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="archdesc/relatedmaterial/p
		| archdesc/*/relatedmaterial/p
		| archdesc/separatedmaterial/p
		| archdesc/*/separatedmaterial/p
		| archdesc/relatedmaterial/note/p
		| archdesc/*/relatedmaterial/note/p
		| archdesc/separatedmaterial/note/p
		| archdesc/*/separatedmaterial/note/p">
		<fo:block xsl:use-attribute-sets="divIndent25">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!--This template formats the top-level controlaccess element.
	It begins by testing to see if there is any controlled
	access element with content. It then invokes one of two templates
	for the children of controlaccess.  -->
	<xsl:template match="archdesc/controlaccess">
		<xsl:if test="string(child::*)">
			<xsl:apply-templates select="head"/>
			<fo:block xsl:use-attribute-sets="divIndent25">
				<xsl:apply-templates select="p | note/p"/>
			</fo:block>
			<xsl:choose>
				<!--Apply this template when there are recursive controlaccess
				elements.-->
				<xsl:when test="controlaccess">
					<xsl:apply-templates mode="recursive" select="."/>
				</xsl:when>
				<!--Apply this template when the controlled terms are entered
				directly under the controlaccess element.-->
				<xsl:otherwise>
					<xsl:apply-templates mode="direct" select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!--This template formats controlled terms that are entered
	directly under the controlaccess element.  Elements are alphabetized.-->
	<xsl:template mode="direct" match="archdesc/controlaccess">
		<xsl:for-each select="subject |corpname | famname | persname | genreform | title | geogname | occupation">
			<xsl:sort select="." data-type="text" order="ascending"/>
			<fo:block xsl:use-attribute-sets="divIndent50">
				<xsl:apply-templates/>
			</fo:block>
		</xsl:for-each>
	</xsl:template>
	<!--When controlled terms are nested within recursive
	controlaccess elements, the template for controlaccess/controlaccess
	is applied.-->
	<xsl:template mode="recursive" match="archdesc/controlaccess">
		<xsl:apply-templates select="controlaccess"/>
	</xsl:template>
	<!--This template formats controlled terms that are nested within recursive
	controlaccess elements.   Terms are alphabetized within each grouping.-->
	<xsl:template match="archdesc/controlaccess/controlaccess">
		<fo:block xsl:use-attribute-sets="h4" text-indent="25pt">
			<xsl:apply-templates select="head"/>
		</fo:block>
		<xsl:for-each select="subject |corpname | famname | persname | genreform | title | geogname | occupation">
			<xsl:sort select="." data-type="text" order="ascending"/>
			<fo:block xsl:use-attribute-sets="divIndent50">
				<xsl:apply-templates/>
			</fo:block>
		</xsl:for-each>
	</xsl:template>
	<!--This template rule formats a top-level access and use retriction elements.
	They are displayed under a common heading.
	It begins by testing to see if there are any restriction elements with content.-->
	<xsl:template name="archdesc-restrict">
		<xsl:if test="string(archdesc/userestrict/*)
		or string(archdesc/accessrestrict/*)
		or string(archdesc/*/userestrict/*)
		or string(archdesc/*/accessrestrict/*)">
			<fo:block xsl:use-attribute-sets="h3" id="restrictlink">
				<fo:inline font-weight="bold">
					<xsl:text>Restrictions</xsl:text>
				</fo:inline>
			</fo:block>
			<xsl:apply-templates select="archdesc/accessrestrict
				| archdesc/*/accessrestrict"/>
			<xsl:apply-templates select="archdesc/userestrict
				| archdesc/*/userestrict"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="archdesc/accessrestrict/head
	| archdesc/userestrict/head
	| archdesc/*/accessrestrict/head
	| archdesc/*/userestrict/head">
		<fo:block xsl:use-attribute-sets="h4" margin-left="25pt">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="archdesc/accessrestrict/p
	| archdesc/userestrict/p
	| archdesc/*/accessrestrict/p
	| archdesc/*/userestrict/p
	| archdesc/accessrestrict/note/p
	| archdesc/userestrict/note/p
	| archdesc/*/accessrestrict/note/p
	| archdesc/*/userestrict/note/p">
		<fo:block xsl:use-attribute-sets="divIndent50">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!--This templates consolidates all the other administrative information
	 elements into one block under a common heading.  It formats these elements
	 regardless of which of three encodings has been utilized.  They may be
	 children of archdesc, admininfo, or descgrp.
	 It begins by testing to see if there are any elements of this type
	 with content.-->
	<xsl:template name="archdesc-admininfo">
		<xsl:if test="string(archdesc/admininfo/custodhist/*)
		or string(archdesc/altformavailable/*)
		or string(archdesc/prefercite/*)
		or string(archdesc/acqinfo/*)
		or string(archdesc/processinfo/*)
		or string(archdesc/appraisal/*)
		or string(archdesc/accruals/*)
		or string(archdesc/*/custodhist/*)
		or string(archdesc/*/altformavailable/*)
		or string(archdesc/*/prefercite/*)
		or string(archdesc/*/acqinfo/*)
		or string(archdesc/*/processinfo/*)
		or string(archdesc/*/appraisal/*)
		or string(archdesc/*/accruals/*)">
			<fo:block xsl:use-attribute-sets="h3" id="adminlink">
				<xsl:text>Administrative Information</xsl:text>
			</fo:block>
			<xsl:apply-templates select="archdesc/custodhist
				| archdesc/*/custodhist"/>
			<xsl:apply-templates select="archdesc/altformavailable
				| archdesc/*/altformavailable"/>
			<xsl:apply-templates select="archdesc/prefercite
				| archdesc/*/prefercite"/>
			<xsl:apply-templates select="archdesc/acqinfo
				| archdesc/*/acqinfo"/>
			<xsl:apply-templates select="archdesc/processinfo
				| archdesc/*/processinfo"/>
			<xsl:apply-templates select="archdesc/appraisal
				| archdesc/*/appraisal"/>
			<xsl:apply-templates select="archdesc/accruals
				| archdesc/*/accruals"/>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats the head element of top-level elements of
	administrative information.-->
	<xsl:template match="custodhist/head
		| archdesc/altformavailable/head
		| archdesc/prefercite/head
		| archdesc/acqinfo/head
		| archdesc/processinfo/head
		| archdesc/appraisal/head
		| archdesc/accruals/head
		| archdesc/*/custodhist/head
		| archdesc/*/altformavailable/head
		| archdesc/*/prefercite/head
		| archdesc/*/acqinfo/head
		| archdesc/*/processinfo/head
		| archdesc/*/appraisal/head
		| archdesc/*/accruals/head">
		<fo:block margin-left="25pt" xsl:use-attribute-sets="h4" id="{generate-id()}">
			<fo:inline font-weight="bold">
				<xsl:apply-templates/>
			</fo:inline>
		</fo:block>
	</xsl:template>
	<xsl:template match="custodhist/p
		| archdesc/altformavailable/p
		| archdesc/prefercite/p
		| archdesc/acqinfo/p
		| archdesc/processinfo/p
		| archdesc/appraisal/p
		| archdesc/accruals/p
		| archdesc/*/custodhist/p
		| archdesc/*/altformavailable/p
		| archdesc/*/prefercite/p
		| archdesc/*/acqinfo/p
		| archdesc/*/processinfo/p
		| archdesc/*/appraisal/p
		| archdesc/*/accruals/p
		| archdesc/custodhist/note/p
		| archdesc/altformavailable/note/p
		| archdesc/prefercite/note/p
		| archdesc/acqinfo/note/p
		| archdesc/processinfo/note/p
		| archdesc/appraisal/note/p
		| archdesc/accruals/note/p
		| archdesc/*/custodhist/note/p
		| archdesc/*/altformavailable/note/p
		| archdesc/*/prefercite/note/p
		| archdesc/*/acqinfo/note/p
		| archdesc/*/processinfo/note/p
		| archdesc/*/appraisal/note/p
		| archdesc/*/accruals/note/p">
		<fo:block xsl:use-attribute-sets="divIndent50">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="archdesc/otherfindaid
		| archdesc/*/otherfindaid
		| archdesc/bibliography
		| archdesc/*/bibliography
		| archdesc/originalsloc
		| archdesc/phystech">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="archdesc/otherfindaid/head
		| archdesc/*/otherfindaid/head
		| archdesc/bibliography/head
		| archdesc/*/bibliography/head
		| archdesc/fileplan/head
		| archdesc/originalsloc/head
		| archdesc/*/fileplan/head
		| archdesc/phystech/head">
		<fo:block xsl:use-attribute-sets="h3" id="{generate-id()}">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="archdesc/otherfindaid/p
		| archdesc/*/otherfindaid/p
		| archdesc/bibliography/p
		| archdesc/*/bibliography/p
		| archdesc/otherfindaid/note/p
		| archdesc/*/otherfindaid/note/p
		| archdesc/bibliography/note/p
		| archdesc/*/bibliography/note/p
		| archdesc/originalsloc/p
		| archdesc/originalsloc/note/p
		| archdesc/fileplan/p
		| archdesc/*/fileplan/p
		| archdesc/fileplan/note/p
		| archdesc/*/fileplan/note/p
		| archdesc/phystech/p
		| archdesc/phystech/note/p">
		<fo:block xsl:use-attribute-sets="divIndent25">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!--This template rule tests for and formats the top-level index element. It begins
	by testing to see if there is an index element with content.-->
	<xsl:template match="archdesc/index
		| archdesc/*/index">
		<fo:table width="100%">
			<fo:table-column column-number="5%"></fo:table-column>
			<fo:table-column column-width="45%"></fo:table-column>
			<fo:table-column column-width="50%"></fo:table-column>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell number-columns-spanned="3">
						<fo:block xsl:use-attribute-sets="h3">
							<fo:basic-link internal-destination="{generate-id(head)}">
								<xsl:apply-templates select="head"/>
							</fo:basic-link>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<xsl:for-each select="p | note/p">
					<fo:table-row>
						<fo:table-cell/>
						<fo:table-cell number-columns-spanned="2">
							<fo:block>
								<xsl:apply-templates/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				<!--Processes each index entry.-->
				<xsl:for-each select="indexentry">
					<!--Sorts each entry term.-->
					<xsl:sort select="corpname | famname | function | genreform | geogname | name | occupation | persname | subject"/>
					<fo:table-row>
						<fo:table-cell/>
						<fo:table-cell>
							<fo:block>
								<xsl:apply-templates select="corpname | famname | function | genreform | geogname | name | occupation | persname | subject"/>
							</fo:block>
						</fo:table-cell>
						<!--Supplies whitespace and punctuation if there is a pointer
						group with multiple entries.-->
						<xsl:choose>
							<xsl:when test="ptrgrp">
								<fo:table-cell>
									<fo:block>
										<xsl:for-each select="ptrgrp">
											<xsl:for-each select="ref | ptr">
												<xsl:apply-templates/>
												<xsl:if test="preceding-sibling::ref or preceding-sibling::ptr">
													<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
									</fo:block>
								</fo:table-cell>
							</xsl:when>
							<!--If there is no pointer group, process each reference or pointer.-->
							<xsl:otherwise>
								<fo:table-cell>
									<fo:block>
										<xsl:for-each select="ref | ptr">
											<xsl:apply-templates/>
										</xsl:for-each>
									</fo:block>
								</fo:table-cell>
							</xsl:otherwise>
						</xsl:choose>
					</fo:table-row>
					<!--Closes the indexentry.-->
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<!--This section of the stylesheet formats dsc, its head, and
	any introductory paragraphs. It assumes that c01 is a series and has
	no associated containers.-->
	<xsl:template name="dsc">
		<xsl:apply-templates/>
	</xsl:template>
	<!--Formats dsc/head.-->
	<xsl:template match="dsc/head">
		<fo:block xsl:use-attribute-sets="h2" text-align="left" id="{generate-id()}">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<xsl:template match="dsc/p | dsc/note/p">
		<fo:block xsl:use-attribute-sets="divIndent25" text-align="left">
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
	<!--This section of the stylesheet contains two named-templates
	that are used generically throughout the stylesheet.-->
	<!--This template formats the unitid, origination, unittitle,
	unitdate, and physdesc elements of components at all levels.  They appear on
	a separate line from other did elements. It is generic to all
	component levels.-->
	<xsl:template name="component-did">
		<!--Inserts unitid and a space if it exists in the markup.-->
		<xsl:if test="unitid">
			<xsl:apply-templates select="unitid"/>
			<xsl:text>&#x20;</xsl:text>
		</xsl:if>
		<!--Inserts origination and a space if it exists in the markup.-->
		<xsl:if test="origination">
			<xsl:apply-templates select="origination"/>
			<xsl:text>&#x20;</xsl:text>
		</xsl:if>
		<!--This choose statement selects between cases where unitdate is a child of
		unittitle and where it is a separate child of did.-->
		<xsl:choose>
			<!--This code processes the elements when unitdate is a child
			of unittitle.-->
			<xsl:when test="unittitle/unitdate">
				<xsl:apply-templates select="unittitle/text()| unittitle/*[not(self::unitdate)]"/>
				<xsl:text>&#x20;</xsl:text>
				<xsl:for-each select="unittitle/unitdate">
					<xsl:apply-templates/>
					<xsl:text>&#x20;</xsl:text>
				</xsl:for-each>
			</xsl:when>
			<!--This code process the elements when unitdate is not a
					child of untititle-->
			<xsl:otherwise>
				<xsl:apply-templates select="unittitle"/>
				<xsl:text>&#x20;</xsl:text>
				<xsl:for-each select="unitdate">
					<xsl:apply-templates/>
					<xsl:text>&#x20;</xsl:text>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="physdesc"/>
	</xsl:template>
	<!--This template formats the appearance of <thead> elements
	where ever they occur in <dsc>.-->
	<xsl:template match="thead">
		<xsl:for-each select="row">
			<fo:table-row>
				<fo:table-cell>
					<fo:block vertical-align="top" xsl:use-attribute-sets="component">
						<fo:inline font-weight="bold">
							<xsl:apply-templates select="entry[1]"/>
						</fo:inline>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block vertical-align="top" number-columns-spanned="2" xsl:use-attribute-sets="component">
						<fo:inline font-weight="bold">
							<xsl:apply-templates select="entry[2]"/>
						</fo:inline>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block vertical-align="top" xsl:use-attribute-sets="component"></fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block vertical-align="top" xsl:use-attribute-sets="component">
						<fo:inline font-weight="bold">
							<xsl:apply-templates select="entry[3]"/>
						</fo:inline>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
	</xsl:template>
	<!--This section of the stylesheet creates a table for each c01.-->
	<xsl:template match="c01">
		<fo:table width="100%" table-layout="fixed">
			<fo:table-column column-width=".3in" number-columns-repeated="20"/>
			<fo:table-body>
				<xsl:apply-templates/>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<!--This section of the stylesheet contains separate templates for
each component level.  The contents of each is identical except for the
spacing that is inserted to create the proper column display for each level.-->
	<!--Processes c01 which is assumed to be a series
	description without associated components.-->
	<xsl:template match="c01/did">
		<fo:table-row>
			<fo:table-cell number-columns-spanned="20" padding-bottom="5pt" padding-top="5pt">
				<fo:block vertical-align="top" xsl:use-attribute-sets="h3"
				space-after="12pt" id="{generate-id()}">
					<fo:inline font-weight="bold">
						<xsl:call-template name="component-did"/>
					</fo:inline>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="abstract | note/p | langmaterial | materialspec">
			<fo:table-row>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell number-columns-spanned="19">
					<fo:block vertical-align="top" xsl:use-attribute-sets="component">
						<xsl:apply-templates/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
	</xsl:template>
	<!--This template creates a separate row for each child of
		the listed elements.-->
	<xsl:template match="c01/scopecontent | c01/bioghist | c01/arrangement
			| c01/userestrict | c01/accessrestrict | c01/processinfo |
			c01/acqinfo | c01/custodhist | c01/controlaccess/controlaccess |
			c01/odd | c01/note | c01/descgrp/*">
		<xsl:for-each select="*[not(self::head)]">
			<fo:table-row>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell number-columns-spanned="19">
					<fo:block vertical-align="top" xsl:use-attribute-sets="component">
						<xsl:apply-templates/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
		<xsl:apply-templates select="c02 | thead"/>
	</xsl:template>
	<!--This template processes c02 elements.-->
	<xsl:template match="c02">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="c02/did">
		<fo:table-row>
			<fo:table-cell>
				<fo:block vertical-align="top"  xsl:use-attribute-sets="component">
					<xsl:apply-templates select="container[1]"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block vertical-align="top" xsl:use-attribute-sets="component">
					<xsl:apply-templates select="container[2]"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell number-columns-spanned="18">
				<fo:block xsl:use-attribute-sets="component">
					<xsl:call-template name="component-did"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="abstract | note/p | langmaterial | materialspec">
			<fo:table-row>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell number-columns-spanned="16">
					<fo:block vertical-align="top" xsl:use-attribute-sets="component">
						<xsl:apply-templates/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="c02/scopecontent | c02/bioghist | c02/arrangement |
			c02/userestrict | c02/accessrestrict | c02/processinfo |
			c02/acqinfo | c02/custodhist | c02/controlaccess/controlaccess |
			c02/odd | c02/note | c02/descgrp/*">
		<xsl:for-each select="*[not(self::head)]">
			<fo:table-row>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell number-columns-spanned="16">
					<fo:block vertical-align="top" xsl:use-attribute-sets="component">
						<xsl:apply-templates/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
		<xsl:apply-templates select="c03 | thead"/>
	</xsl:template>
	<xsl:template match="c03">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="c03/did">
		<fo:table-row>
			<fo:table-cell>
				<fo:block vertical-align="top" xsl:use-attribute-sets="component">
					<xsl:apply-templates select="container[1]"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block vertical-align="top" xsl:use-attribute-sets="component">
					<xsl:apply-templates select="container[2]"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block> </fo:block>
			</fo:table-cell>
			<fo:table-cell number-columns-spanned="17">
				<fo:block vertical-align="top" xsl:use-attribute-sets="component">
					<xsl:call-template name="component-did"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="abstract | note/p | langmaterial | materialspec">
			<fo:table-row>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell number-columns-spanned="15">
					<fo:block vertical-align="top" xsl:use-attribute-sets="component">
						<xsl:apply-templates/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="c03/scopecontent | c03/bioghist | c03/arrangement |
			c03/userestrict | c03/accessrestrict | c03/processinfo |
			c03/acqinfo | c03/custodhist | c03/controlaccess/controlaccess |
			c03/odd | c03/note | c03/descgrp/*">
		<xsl:for-each select="*[not(self::head)]">
			<fo:table-row>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell number-columns-spanned="15">
					<fo:block xsl:use-attribute-sets="component">
						<xsl:apply-templates/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
		<xsl:apply-templates select="c04| thead"/>
	</xsl:template>
	<!--This template processes c04 level components.-->
	<xsl:template match="c04">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="c04/did">
		<fo:table-row>
			<fo:table-cell>
				<fo:block xsl:use-attribute-sets="component">
					<xsl:apply-templates select="container[1]"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block vertical-align="top" xsl:use-attribute-sets="component">
					<xsl:apply-templates select="container[2]"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block> </fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block> </fo:block>
			</fo:table-cell>
			<fo:table-cell number-columns-spanned="16">
				<fo:block vertical-align="top" xsl:use-attribute-sets="component">
					<xsl:call-template name="component-did"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:for-each select="abstract | note/p | langmaterial | materialspec">
			<fo:table-row>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell number-columns-spanned="14">
					<fo:block vertical-align="top" xsl:use-attribute-sets="component">
						<xsl:apply-templates/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="c04/scopecontent | c04/bioghist | c04/arrangement |
			c04/descgrp/* | c04/userestrict | c04/accessrestrict | c04/processinfo |
			c04/acqinfo | c04/custodhist | c04/controlaccess/controlaccess |
			c04/odd | c04/note">
		<xsl:for-each select="*[not(self::head)]">
			<fo:table-row>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block> </fo:block>
				</fo:table-cell>
				<fo:table-cell number-columns-spanned="14">
					<fo:block vertical-align="top" xsl:use-attribute-sets="component">
						<xsl:apply-templates/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
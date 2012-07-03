<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml"
xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint">
	<xsl:strip-space elements="*"/>
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<xsl:processing-instruction name="mso-application">
			<xsl:text>progid="Word.Document"</xsl:text>
		</xsl:processing-instruction>
		<w:wordDocument
	xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml"
	xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:w10="urn:schemas-microsoft-com:office:word"
	xmlns:sl="http://schemas.microsoft.com/schemaLibrary/2003/core"
	xmlns:aml="http://schemas.microsoft.com/aml/2001/core"
	xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint"
	xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
	w:macrosPresent="no"
	w:embeddedObjPresent="no"
	w:ocxPresent="no"
	xml:space="preserve">
			<w:fonts>
				<w:defaultFonts w:ascii="Times New Roman" w:fareast="Times New Roman" w:h-ansi="Times New Roman" w:cs="Times New Roman"/>
			</w:fonts>
			<w:styles>
				<w:versionOfBuiltInStylenames w:val="4"/>
				<w:latentStyles w:defLockedState="off" w:latentStyleCount="156"/>
				<w:style w:type="paragraph" w:default="on" w:styleId="Normal">
					<w:name w:val="Normal"/>
					<w:rPr>
						<wx:font wx:val="Times New Roman"/>
						<w:sz w:val="24"/>
						<w:sz-cs w:val="24"/>
						<w:lang w:val="EN-US" w:fareast="EN-US" w:bidi="AR-SA"/>
					</w:rPr>
				</w:style>
				<w:style w:type="paragraph" w:default="off" w:styleId="TitlePage">
					<w:name w:val="Title Page"/>
					<w:pPr>
						<w:spacing w:line="480" w:line-rule="auto"/>
						<w:keepNext/>
					</w:pPr>
					<w:rPr>
						<w:rFonts w:ascii="Arial"/>
						<w:b/>
						<w:sz w:val="28"/>
						<w:sz-cs w:val="28"/>
						<w:lang w:val="EN-US" w:fareast="EN-US" w:bidi="AR-SA"/>
					</w:rPr>
				</w:style>
				<w:style w:type="paragraph" w:default="off" w:styleId="BigHead">
					<w:name w:val="Large Heading"/>
					<w:pPr>
						<w:spacing w:line="480" w:line-rule="auto"/>
						<w:keepNext/>
					</w:pPr>
					<w:rPr>
						<w:rFonts w:ascii="Arial"/>
						<w:b/>
						<w:sz w:val="28"/>
						<w:sz-cs w:val="28"/>
						<w:lang w:val="EN-US" w:fareast="EN-US" w:bidi="AR-SA"/>
					</w:rPr>
				</w:style>
				<w:style w:type="paragraph" w:default="off" w:styleId="MediumHead">
					<w:name w:val="Medium Heading"/>
					<w:pPr>
						<w:ind w:left="720"/>
						<w:spacing w:line="360" w:line-rule="auto"/>
						<w:keepNext/>
					</w:pPr>
					<w:rPr>
						<w:rFonts w:ascii="Arial"/>
						<w:b/>
						<w:sz w:val="24"/>
						<w:sz-cs w:val="24"/>
						<w:lang w:val="EN-US" w:fareast="EN-US" w:bidi="AR-SA"/>
					</w:rPr>
				</w:style>
				<w:style w:type="paragraph" w:default="off" w:styleId="BasePara">
					<w:name w:val="Base Paragraph"/>
					<w:pPr>
						<w:keepNext/>
						<wx:font wx:val="Times New Roman"/>
						<w:ind w:left="720"/>
					</w:pPr>
					<w:rPr>
						<w:sz w:val="24"/>
						<w:sz-cs w:val="24"/>
						<w:lang w:val="EN-US" w:fareast="EN-US" w:bidi="AR-SA"/>
					</w:rPr>
				</w:style>
				<w:style w:type="paragraph" w:default="off" w:styleId="IndentPara">
					<w:name w:val="Indented Paragraph"/>
					<w:pPr>
						<w:keepNext/>
						<w:ind w:left="1440"/>
					</w:pPr>
					<w:rPr>
						<w:rFonts ascii="Times New Roman"/>
						<w:sz w:val="24"/>
						<w:sz-cs w:val="24"/>
						<w:lang w:val="EN-US" w:fareast="EN-US" w:bidi="AR-SA"/>
					</w:rPr>
				</w:style>
				<w:style w:type="paragraph" w:default="off" w:styleId="c01Did">
					<w:name w:val="c01 Did"/>
					<w:pPr>
						<w:keepNext/>
						<wx:font wx:val="Times New Roman"/>
						<w:ind w:left="720"/>
					</w:pPr>
					<w:rPr>
						<w:sz w:val="24"/>
						<w:sz-cs w:val="24"/>
						<w:lang w:val="EN-US" w:fareast="EN-US" w:bidi="AR-SA"/>
					</w:rPr>
				</w:style>
				<w:style w:type="character" w:default="on" w:styleId="DefaultParagraphFont">
					<w:name w:val="Default Paragraph Font"/>
					<w:semiHidden/>
				</w:style>
				<w:style w:type="character" w:default="off" w:styleId="Bold">
					<w:basedOn w:val="DefaultParagraphFont"/>
					<w:name w:val="Bold"/>
					<w:semiHidden/>
					<w:rPr>
						<w:b/>
					</w:rPr>
				</w:style>
				<w:style w:type="character" w:default="off" w:styleId="Italic">
					<w:basedOn w:val="Default Paragraph Font"/>
					<w:name w:val="Italic"/>
					<w:semiHidden/>
					<w:rPr>
						<w:i/>
					</w:rPr>
				</w:style>
				<w:style w:type="character" w:default="off" w:styleId="Underscore">
					<w:basedOn w:val="Default Paragraph Font"/>
					<w:name w:val="Underscore"/>
					<w:semiHidden/>
					<w:rPr>
						<w:u w:val="single"/>
					</w:rPr>
				</w:style>
				<w:style w:type="table" w:default="on" w:styleId="TableNormal">
					<w:name w:val="Normal Table"/>
					<wx:uiName wx:val="Table Normal"/>
					<w:semiHidden/>
					<w:rPr>
						<wx:font wx:val="Times New Roman"/>
					</w:rPr>
					<w:tblPr>
						<w:tblInd w:w="0" w:type="dxa"/>
						<w:tblCellMar>
							<w:top w:w="0" w:type="dxa"/>
							<w:left w:w="108" w:type="dxa"/>
							<w:bottom w:w="0" w:type="dxa"/>
							<w:right w:w="108" w:type="dxa"/>
						</w:tblCellMar>
					</w:tblPr>
				</w:style>
				<w:style w:type="list" w:default="on" w:styleId="NoList">
					<w:name w:val="No List"/>
					<w:semiHidden/>
				</w:style>
			</w:styles>
			<w:docPr>
				<w:view w:val="web"/>
				<w:zoom w:percent="100"/>
				<w:proofState w:grammar="clean"/>
				<w:attachedTemplate w:val=""/>
				<w:defaultTabStop w:val="720"/>
				<w:characterSpacingControl w:val="DontCompress"/>
				<w:validateAgainstSchema/>
				<w:saveInvalidXML w:val="off"/>
				<w:ignoreMixedContent w:val="off"/>
				<w:alwaysShowPlaceholderText w:val="off"/>
				<w:alwaysMergeEmptyNamespace/>
				<w:compat/>
			</w:docPr>
			<w:body>
				<xsl:apply-templates/>
			</w:body>
		</w:wordDocument>
	</xsl:template>
	<xsl:template match="ead">
		<wx:sect>
			<xsl:apply-templates select="eadheader"/>
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
			<w:br w:type="page"/>
			<xsl:apply-templates select="archdesc/dsc"/>
			<w:sectPr>
				<w:pgSz w:w="12240" w:h="15840"/>
				<w:pgMar w:top="1440" w:right="1800" w:bottom="1440" w:left="1800" w:header="720" w:footer="720" w:gutter="0"/>
				<w:cols w:space="720"/>
				<w:docGrid w:line-pitch="360"/>
				<!--This section adds page numbers.-->
				<w:ftr w:type="even">
					<wx:pBdrGroup>
						<wx:apo>
							<wx:jc wx:val="center"/>
						</wx:apo>
						<w:p>
							<w:pPr>
								<w:pStyle w:val="Footer"/>
								<w:framePr w:wrap="around" w:vanchor="text" w:hanchor="margin" w:x-align="center" w:y="1"/>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
								</w:rPr>
								<w:fldChar w:fldCharType="begin"/>
							</w:r>
							<w:r>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
								</w:rPr>
								<w:instrText>PAGE  </w:instrText>
							</w:r>
							<w:r>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
								</w:rPr>
								<w:fldChar w:fldCharType="end"/>
							</w:r>
						</w:p>
					</wx:pBdrGroup>
					<w:p>
						<w:pPr>
							<w:pStyle w:val="Footer"/>
						</w:pPr>
					</w:p>
				</w:ftr>
				<w:ftr w:type="odd">
					<wx:pBdrGroup>
						<wx:apo>
							<wx:jc wx:val="center"/>
						</wx:apo>
						<w:p>
							<w:pPr>
								<w:pStyle w:val="Footer"/>
								<w:framePr w:wrap="around" w:vanchor="text" w:hanchor="margin" w:x-align="center" w:y="1"/>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
								</w:rPr>
							</w:pPr>
							<w:r>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
								</w:rPr>
								<w:fldChar w:fldCharType="begin"/>
							</w:r>
							<w:r>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
								</w:rPr>
								<w:instrText>PAGE  </w:instrText>
							</w:r>
							<w:r>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
								</w:rPr>
								<w:fldChar w:fldCharType="separate"/>
							</w:r>
							<w:r>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
									<w:noProof/>
								</w:rPr>
								<w:t>1</w:t>
							</w:r>
							<w:r>
								<w:rPr>
									<w:rStyle w:val="PageNumber"/>
								</w:rPr>
								<w:fldChar w:fldCharType="end"/>
							</w:r>
						</w:p>
					</wx:pBdrGroup>
					<w:p>
						<w:pPr>
							<w:pStyle w:val="Footer"/>
						</w:pPr>
					</w:p>
				</w:ftr>
				<!--End of page numbering-->
			</w:sectPr>
		</wx:sect>
	</xsl:template>
	<!--This template parses out paragraph elements that have mixed content
	into separate runs so that emph and title elements may be properly
	foramtted.-->
	<xsl:template name="mixedPara">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="BasePara"/>
				<w:keepNext/>
			</w:pPr>
			<xsl:for-each select="text() | child::*">
				<w:r>
					<xsl:choose>
						<xsl:when test="self::emph or self::title">
							<xsl:call-template name="render"/>
							<w:t>
								<xsl:value-of select="."/>
							</w:t>
						</xsl:when>
						<xsl:otherwise>
							<w:t>
								<xsl:value-of select="."/>
							</w:t>
						</xsl:otherwise>
					</xsl:choose>
				</w:r>
			</xsl:for-each>
		</w:p>
		<w:p>
			<w:pPr>
				<w:keepNext/>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
	</xsl:template>
	<!--This template assigns the appropriate styles to @render.-->
	<xsl:template name="render">
		<xsl:if test="@render='bold'">
			<w:rPr>
				<w:rStyle w:val="Bold"/>
			</w:rPr>
		</xsl:if>
		<xsl:if test="@render='italic'">
			<w:rPr>
				<w:rStyle w:val="Italic"/>
			</w:rPr>
		</xsl:if>
		<xsl:if test="@render='underline'">
			<w:rPr>
				<w:rStyle w:val="Underscore"/>
			</w:rPr>
		</xsl:if>
	</xsl:template>
	<!--Formats the Title Page-->
	<xsl:template match="eadheader">
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:pStyle w:val="TitlePage"/>
				<w:jc w:val="center"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates select="filedesc/titlestmt/titleproper"/>
				</w:t>
			</w:r>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:pStyle w:val="TitlePage"/>
				<w:jc w:val="center"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates select="filedesc/titlestmt/subtitle"/>
				</w:t>
			</w:r>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:pStyle w:val="Normal"/>
				<w:jc w:val="center"/>
			</w:pPr>
			<w:r>
				<w:rPr>
					<w:b/>
				</w:rPr>
				<w:t>
					<xsl:apply-templates select="filedesc/titlestmt/author"/>
				</w:t>
			</w:r>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<w:p>
			<w:pPr>
				<w:pStyle w:val="TitlePage"/>
				<w:jc w:val="center"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:value-of select="../archdesc/did/repository"/>
				</w:t>
			</w:r>
		</w:p>
		<w:br w:type="page"/>
	</xsl:template>
	<xsl:template match="archdesc">
		<xsl:apply-templates/>
	</xsl:template>
	<!--This template displays the contents of did, inserts the head and then
each of the other did elements.  To change the order of appearance of these
elements, change the sequence of the apply-templates statements.-->
	<xsl:template match="archdesc/did">
		<!--One can change the order of appearance for the children of did
				by changing the order of the following statements.-->
		<xsl:apply-templates select="head"/>
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
		<w:p>
			<w:pPr>
				<w:spacing w:line="360" w:line-rule="auto"/>
			</w:pPr>
		</w:p>
	</xsl:template>
	<!--This template formats the repostory, origination, physdesc, abstract,
	unitid, physloc and materialspec elements of archdesc/did which share a common presentaiton.
	The sequence of their appearance is governed by the previous template.-->
	<xsl:template match="archdesc/did/repository
	| archdesc/did/origination
	| archdesc/did/unittitle
	| archdesc/did/unitdate
	| archdesc/did/physdesc
	| archdesc/did/unitid
	| archdesc/did/physloc
	| archdesc/did/abstract
	| archdesc/did/langmaterial
	| archdesc/did/materialspec
	| archdesc/did/note">
		<!--The template tests to see if there is a label attribute,
		inserting the contents if there is or adding display textif there isn't.
		The content of the supplied label depends on the element.  To change the
		supplied label, simply alter the template below.-->
		<w:p>
			<w:pPr>
				<w:pStyle w:val="Normal"/>
				<!--Creates 1.5 line spacing between paragraphs.-->
				<w:spacing w:line="360" w:line-rule="auto"/>
				<w:tabs>
					<w:tab w:val="left" w:pos="720"/>
					<w:tab w:val="left" w:pos="2880"/>
				</w:tabs>
				<w:ind w:left="2880" w:hanging="2880"/>
			</w:pPr>
			<w:r>
				<w:rPr>
					<w:b/>
				</w:rPr>
				<w:tab/>
				<w:t>
					<xsl:choose>
						<xsl:when test="@label">
							<xsl:value-of select="@label"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="self::repository">
									<xsl:text>Repository: </xsl:text>
								</xsl:when>
								<xsl:when test="self::origination">
									<xsl:text>Creator: </xsl:text>
								</xsl:when>
								<xsl:when test="self::unittitle">
									<xsl:text>Title: </xsl:text>
								</xsl:when>
								<xsl:when test="self::unitdate">
									<xsl:text>Date: </xsl:text>
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
								<xsl:when test="self::note">
									<xsl:text>Note: </xsl:text>
								</xsl:when>
							</xsl:choose>
							<xsl:apply-templates/>
						</xsl:otherwise>
					</xsl:choose>
				</w:t>
			</w:r>
			<w:r>
				<w:tab/>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
	</xsl:template>
	<xsl:template match="archdesc/bioghist |
	archdesc/scopecontent |
	archdesc/odd |
	archdesc/phystech  |
	archdesc/otherfindaid |
	archdesc/*/otherfindaid |
	archdesc/bibliography |
	archdesc/*/bibliography |
	archdesc/originalsloc |
	archdesc/dsc">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="archdesc/did/head |
			archdesc/bioghist/head  |
			archdesc/scopecontent/head |
			archdesc/arrangement/head |
			archdesc/phystech/head |
			archdesc/controlaccess/head |
			archdesc/odd/head |
			archdesc/otherfindaid/head |
			archdesc/*/otherfindaid/head |
			archdesc/bibliography/head |
			archdesc/*/bibliography/head |
			archdesc/originalsloc/head |
			archdesc/dsc/head">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="BigHead"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
	</xsl:template>
	<xsl:template match="archdesc/bioghist/p |
			archdesc/scopecontent/p |
			archdesc/arrangement/p |
			archdesc/phystech/p |
			archdesc/controlaccess/p |
			archdesc/odd/p |
			archdesc/bioghist/note/p |
			archdesc/dsc/p |
			archdesc/dsc/note/p |
			archdesc/scopecontent/note/p |
			archdesc/arrangement/note/p |
			archdesc/phystech/note/p |
			archdesc/controlaccess/note/p |
			archdesc/odd/note/p |
			archdesc/otherfindaid/p |
			archdesc/*/otherfindaid/p |
			archdesc/bibliography/p |
			archdesc/*/bibliography/p |
			archdesc/originalsloc/p">
		<xsl:call-template name="mixedPara"/>
		<xsl:if test="position()=last()">
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:ind w:left="360" />
				</w:pPr>
			</w:p>
		</xsl:if>
	</xsl:template>
	<xsl:template match="archdesc/bioghist/bioghist/head |
		archdesc/scopecontent/scopecontent/head">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="MediumHead"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
	</xsl:template>
	<xsl:template match="archdesc/bioghist/bioghist/p |
		archdesc/scopecontent/scopecontent/p |
		archdesc/bioghist/bioghist/note/p |
		archdesc/scopecontent/scopecontent/note/p">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="IndentPara"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
		<xsl:if test="position()=last()">
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:ind w:left="360" />
				</w:pPr>
			</w:p>
		</xsl:if>
	</xsl:template>
	<xsl:template match="archdesc/arrangement/list">
		<xsl:for-each select="item">
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:pStyle w:val="IndentPara"/>
				</w:pPr>
				<w:r>
					<w:t>
						<xsl:apply-templates/>
					</w:t>
				</w:r>
			</w:p>
			<xsl:if test="position()=last()">
				<w:p>
					<w:pPr>
						<w:keepWith/>
						<w:ind w:left="360" />
					</w:pPr>
				</w:p>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="archdesc/controlaccess">
		<xsl:apply-templates select="head"/>
		<xsl:apply-templates select="controlaccess"/>
	</xsl:template>
	<!--This template formats controlled terms that are nested within recursive
	controlaccess elements.   Terms are alphabetized within each grouping.-->
	<xsl:template match="archdesc/controlaccess/controlaccess">
		<w:p>
			<w:pPr>
				<w:keepWith/>
				<w:pStyle w:val="MediumHead"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates select="head"/>
				</w:t>
			</w:r>
		</w:p>
		<xsl:for-each select="subject |corpname | famname | persname | genreform | title | geogname | occupation">
			<xsl:sort select="." data-type="text" order="ascending"/>
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:pStyle w:val="IndentPara"/>
				</w:pPr>
				<w:r>
					<w:t>
						<xsl:apply-templates/>
					</w:t>
				</w:r>
			</w:p>
			<xsl:if test="position()=last()">
				<w:p>
					<w:pPr>
						<w:keepWith/>
						<w:ind w:left="360" />
					</w:pPr>
				</w:p>
			</xsl:if>
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
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:pStyle w:val="BigHead"/>
				</w:pPr>
				<w:r>
					<w:t>Restrictions</w:t>
				</w:r>
			</w:p>
			<xsl:apply-templates select="archdesc/accessrestrict
				| archdesc/*/accessrestrict
				| archdesc/userestrict
				| archdesc/*/userestrict"></xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	<xsl:template match="archdesc/accessrestrict/head
	| archdesc/userestrict/head
	| archdesc/*/accessrestrict/head
	| archdesc/*/userestrict/head">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="MediumHead"/>
				<w:keepWith/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
	</xsl:template>
	<xsl:template match="archdesc/accessrestrict/p
	| archdesc/userestrict/p
	| archdesc/*/accessrestrict/p
	| archdesc/*/userestrict/p
	| archdesc/accessrestrict/note/p
	| archdesc/userestrict/note/p
	| archdesc/*/accessrestrict/note/p
	| archdesc/*/userestrict/note/p">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="BasePara"/>
				<w:keepWith/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
		<xsl:if test="position()=last()">
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:ind w:left="360" />
				</w:pPr>
			</w:p>
		</xsl:if>
	</xsl:template>
	<!--This templates consolidates all the other administrative information
	 elements into one block under a common heading.  It formats these elements
	 regardless of which of three encodings has been utilized.  They may be
	 children of archdesc, admininfo, or descgrp.
	 It begins by testing to see if there are any elements of this type
	 with content.-->
	<xsl:template name="archdesc-admininfo">
		<xsl:if test="string(archdesc/admininfo/custodhist/*)
		or string(archdesc/altformavail/*)
		or string(archdesc/prefercite/*)
		or string(archdesc/acqinfo/*)
		or string(archdesc/processinfo/*)
		or string(archdesc/appraisal/*)
		or string(archdesc/accruals/*)
		or string(archdesc/*/custodhist/*)
		or string(archdesc/*/altformavail/*)
		or string(archdesc/*/prefercite/*)
		or string(archdesc/*/acqinfo/*)
		or string(archdesc/*/processinfo/*)
		or string(archdesc/*/appraisal/*)
		or string(archdesc/*/accruals/*)">
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:pStyle w:val="BigHead"/>
				</w:pPr>
				<w:r>
					<w:t>Administrative Information</w:t>
				</w:r>
			</w:p>
			<xsl:apply-templates select="archdesc/custodhist
		| archdesc/altformavail
		| archdesc/prefercite
		| archdesc/acqinfo
		| archdesc/processinfo
		| archdesc/appraisal
		| archdesc/accruals
		| archdesc/*/custodhist
		| archdesc/*/altformavail
		| archdesc/*/prefercite
		| archdesc/*/acqinfo
		| archdesc/*/processinfo
		| archdesc/*/appraisal
		| archdesc/*/accruals"></xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	<xsl:template match="archdesc/custodhist/head
		| archdesc/altformavail/head
		| archdesc/prefercite/head
		| archdesc/acqinfo/head
		| archdesc/processinfo/head
		| archdesc/appraisal/head
		| archdesc/accruals/head
		| archdesc/*/custodhist/head
		| archdesc/*/altformavail/head
		| archdesc/*/prefercite/head
		| archdesc/*/acqinfo/head
		| archdesc/*/processinfo/head
		| archdesc/*/appraisal/head
		| archdesc/*/accruals/head">
		<w:p>
			<w:pPr>
				<w:keepWith/>
				<w:pStyle w:val="MediumHead"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
	</xsl:template>
	<xsl:template match="custodhist/p
		| archdesc/altformavail/p
		| archdesc/prefercite/p
		| archdesc/acqinfo/p
		| archdesc/processinfo/p
		| archdesc/appraisal/p
		| archdesc/accruals/p
		| archdesc/*/custodhist/p
		| archdesc/*/altformavail/p
		| archdesc/*/prefercite/p
		| archdesc/*/acqinfo/p
		| archdesc/*/processinfo/p
		| archdesc/*/appraisal/p
		| archdesc/*/accruals/p
		| archdesc/custodhist/note/p
		| archdesc/altformavail/note/p
		| archdesc/prefercite/note/p
		| archdesc/acqinfo/note/p
		| archdesc/processinfo/note/p
		| archdesc/appraisal/note/p
		| archdesc/accruals/note/p
		| archdesc/*/custodhist/note/p
		| archdesc/*/altformavail/note/p
		| archdesc/*/prefercite/note/p
		| archdesc/*/acqinfo/note/p
		| archdesc/*/processinfo/note/p
		| archdesc/*/appraisal/note/p
		| archdesc/*/accruals/note/p">
		<w:p>
			<w:pPr>
				<w:keepWith/>
				<w:pStyle w:val="IndentPara"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
		<xsl:if test="position()=last()">
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:ind w:left="360" />
				</w:pPr>
			</w:p>
		</xsl:if>
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
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:pStyle w:val="BigHead"/>
				</w:pPr>
				<w:r>
					<w:t>Related Materials</w:t>
				</w:r>
			</w:p>
			<xsl:apply-templates select="archdesc/relatedmaterial
				| archdesc/*/relatedmaterial
				| archdesc/relatedmaterial/note
				| archdesc/*/relatedmaterial/note"/>
			<xsl:apply-templates select="archdesc/separatedmaterial
				| archdesc/*/separatedmaterial
				| archdesc/separatedmaterial/note
				| archdesc/*/separatedmaterial/note"/>
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
		<w:p>
			<w:pPr>
				<w:keepWith/>
				<w:pStyle w:val="BasePara"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
		<xsl:if test="position()=last()">
			<w:p>
				<w:pPr>
					<w:keepWith/>
					<w:ind w:left="360" />
				</w:pPr>
			</w:p>
		</xsl:if>
	</xsl:template>
	<xsl:template match="c01">
		<w:p>
			<w:pPr>
				<w:keepWith/>
				<w:ind w:left="360" />
			</w:pPr>
		</w:p>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="thead">
		<xsl:for-each select="row">
			<w:p>
				<w:pPr>
					<w:pStyle w:val="Normal"/>
					<w:keepWith/>
					<w:tabs>
						<w:tab w:val="left" w:pos="720"/>
						<w:tab w:val="left" w:pos="1440"/>
					</w:tabs>
					<w:ind w:left="1440" w:hanging="1440"/>
				</w:pPr>
				<w:r>
					<w:rPr>
						<w:b/>
					</w:rPr>
					<w:t>
						<xsl:value-of select="entry[1]"/>
					</w:t>
					<w:tab/>
					<w:t>
						<xsl:value-of select="entry[2]"/>
					</w:t>
					<w:tab/>
					<w:t>
						<xsl:value-of select="entry[3]"/>
					</w:t>
				</w:r>
			</w:p>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="c01/did">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="c01Did"/>
				<w:keepWith/>
				<w:tabs>
					<w:tab w:val="left" w:pos="720"/>
					<w:tab w:val="left" w:pos="1440"/>
				</w:tabs>
				<w:ind w:left="1440" w:hanging="1440"/>
			</w:pPr>
			<w:r>
				<w:rPr>
					<w:b/>
				</w:rPr>
				<!--Inserts these did elements with a space between each.-->
				<w:t>
					<xsl:if test="unitid">
						<xsl:apply-templates select="unitid"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:if test="unittitle">
						<xsl:apply-templates select="unittitle"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:if test="unitdate">
						<xsl:apply-templates select="unitdate"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:if test="physdesc">
						<xsl:apply-templates select="physdesc"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
				</w:t>
			</w:r>
		</w:p>
		<w:p/>
		<xsl:apply-templates select="note/p"/>
		<xsl:apply-templates select="abstract"/>
	</xsl:template>
	<xsl:template match="c01/scopecontent/p | c01/bioghist/p | c01/did/note/p |
	c01/did/abstract | c01/accessrestrict/p | c01/userestrict/p">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="Normal"/>
				<w:tabs>
					<w:tab w:val="left" w:pos="720"/>
					<w:tab w:val="left" w:pos="1440"/>
				</w:tabs>
				<w:ind w:left="720" w:hanging="720"/>
			</w:pPr>
			<w:r>
				<w:tab/>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
		<w:p/>
	</xsl:template>
	<xsl:template match="c02">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="c02/did">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="Normal"/>
				<w:tabs>
					<w:tab w:val="left" w:pos="720"/>
					<w:tab w:val="left" w:pos="1440"/>
					<w:tab w:val="left" w:pos="2160"/>
				</w:tabs>
				<w:ind w:left="2160" w:hanging="2160"/>
				<w:spacing w:before="60"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates select="container[1]"/>
				</w:t>
				<w:tab/>
				<w:t>
					<xsl:apply-templates select="container[2]"/>
				</w:t>
				<w:tab/>
				<w:t>
					<xsl:if test="unitid">
						<xsl:apply-templates select="unitid"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:if test="unittitle">
						<xsl:apply-templates select="unittitle"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:if test="unitdate">
						<xsl:apply-templates select="unitdate"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:if test="physdesc">
						<xsl:apply-templates select="physdesc"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
				</w:t>
			</w:r>
		</w:p>
		<xsl:apply-templates select="note/p"/>
		<xsl:apply-templates select="abstract"/>
	</xsl:template>
	<xsl:template match="c02/scopecontent | c02/bioghist | c02/arrangment
	| c02/did/abstract | c02/did/note/p | c02/userestrict |c02/accessrestrict">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="Normal"/>
				<w:tabs>
					<w:tab w:val="left" w:pos="720"/>
					<w:tab w:val="left" w:pos="1440"/>
					<w:tab w:val="left" w:pos="2160"/>
				</w:tabs>
				<w:ind w:left="2160" w:hanging="2160"/>
			</w:pPr>
			<w:r>
				<w:tab/>
				<w:tab/>
				<w:tab/>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
	</xsl:template>
	<xsl:template match="c03">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="c03/did">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="Normal"/>
				<w:tabs>
					<w:tab w:val="left" w:pos="720"/>
					<w:tab w:val="left" w:pos="1440"/>
					<w:tab w:val="left" w:pos="2160"/>
					<w:tab w:val="left" w:pos="2880"/>
					<w:tab w:val="left" w:pos="3600"/>
				</w:tabs>
				<w:spacing w:before="60"/>
				<w:ind w:left="2880" w:hanging="2880"/>
			</w:pPr>
			<w:r>
				<w:t>
					<xsl:apply-templates select="container[1]"/>
				</w:t>
				<w:tab/>
				<w:t>
					<xsl:apply-templates select="container[2]"/>
				</w:t>
				<w:tab/>
				<w:tab/>
				<w:t>
					<xsl:if test="unitid">
						<xsl:apply-templates select="unitid"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:if test="unittitle">
						<xsl:apply-templates select="unittitle"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:if test="unitdate">
						<xsl:apply-templates select="unitdate"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
					<xsl:if test="physdesc">
						<xsl:apply-templates select="physdesc"/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:if>
				</w:t>
			</w:r>
		</w:p>
		<xsl:apply-templates select="note/p"/>
		<xsl:apply-templates select="abstract"/>
	</xsl:template>
	<xsl:template match="c03/scopecontent | c03/bioghist | c03/arrangment
	| c03/did/abstract | c03/did/note/p | c03/userestrict |c03/accessrestrict">
		<w:p>
			<w:pPr>
				<w:pStyle w:val="Normal"/>
				<w:tabs>
					<w:tab w:val="left" w:pos="720"/>
					<w:tab w:val="left" w:pos="1440"/>
					<w:tab w:val="left" w:pos="2160"/>
					<w:tab w:val="left" w:pos="2880"/>
					<w:tab w:val="left" w:pos="3600"/>
				</w:tabs>
				<w:ind w:left="2880" w:hanging="2880"/>
			</w:pPr>
			<w:r>
				<w:tab/>
				<w:tab/>
				<w:tab/>
				<w:tab/>
				<w:t>
					<xsl:apply-templates/>
				</w:t>
			</w:r>
		</w:p>
	</xsl:template>
</xsl:stylesheet>
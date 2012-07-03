<!--This stylesheet was adapted by Amy McCrory in May 2005 from the SAA EAD Cookbook stylesheet eadcbs7.xsl.-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://icl.com/saxon" extension-element-prefixes="saxon" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" version="1.1">
<xsl:strip-space elements="*"/>
<xsl:output encoding="ISO-8859-1" method="html"/>


<!-- Creates a variable equal to the value of the number in eadid which serves as the base
 for file names.-->
<xsl:variable name="file">
<xsl:value-of select="ead/eadheader/eadid"/>
</xsl:variable>

<xsl:template match="/">


<!--TEMPLATE 1: CREATES A PAGE FOR THE COLLECTION-LEVEL DESCRIPTION-->

<xsl:variable name="file">
<xsl:value-of select="ead/eadheader/eadid"/>
</xsl:variable>


<xsl:document method="html" href="{$file}.html">
<html>

<head>
<link rel="stylesheet" type="text/css" href="ead_divs.css" />
<title>
<xsl:value-of select="eadheader/filedesc/titlestmt/titleproper"/>
<xsl:text>  </xsl:text>
<xsl:value-of select="eadheader/filedesc/titlestmt/subtitle"/>
</title>
<xsl:call-template name="metadata"/>
</head>


<body style="font-family:verdana; font-size:12">

<!--TABLE OF CONTENTS-->
<!--CHANGED DISPLAY PROPERTIES-->
<div id="toc" style="overflow:scroll; position:fixed; height:101%; border-right:1px; float:left; width:20%; margin-right:5px">

<div style="font-size:20"><b>Table of Contents</b></div>
<hr/>

<!-- The Table of Contents generates link to the [list of mandatory elements], then performs a series of tests to determine which additional elements will be included in the table of contents.  Each xsl:if statement tests to see if there is a matching element with content in the finding aid.-->

<div style="font-size:14"><b>General Description of the Collection</b></div>
<br/>

<b>
<div style="linespacing:20px">
<a href="{$file}.html">
<xsl:text>Title Page</xsl:text>
</a>
<br/><br/>

<b>
<a href="{$file}.html#{generate-id(ead/archdesc/did/head)}">
<xsl:value-of select="ead/archdesc/did/head"/>
</a>
<br/><br/>

<a href="{$file}.html#{generate-id(ead/archdesc/bioghist/head)}">
<xsl:value-of select="ead/archdesc/bioghist/head"/>
</a>
<br/><br/>

<a href="{$file}.html#{generate-id(ead/archdesc/scopecontent/head)}">
<xsl:value-of select="ead/archdesc/scopecontent/head"/>
</a>
<br/><br/>

<a href="{$file}.html#{generate-id(ead/archdesc/arrangement/head)}">
<xsl:value-of select="ead/archdesc/arrangement/head"/>
</a>
<br/><br/>
</b>
</div>
<hr></hr>


<div style="font-size:14">Detailed Description of the Collection / Box and Folder List</div>
<br/>
<!-- Displays the unittitle and unitdates for a c01 if it is a series and numbers them to form a hyperlink to each.-->
<xsl:for-each select="ead/archdesc/dsc/c01[@level='series']">
<a>
<xsl:attribute name="href">
<xsl:value-of select="$file"/>series<xsl:number value="position()" format="1"/>.html</xsl:attribute>

<xsl:apply-templates select="did/unittitle"/>
<xsl:text>, </xsl:text>
<xsl:apply-templates select="did/unitdate"/>
<br/><br/>
</a>
</xsl:for-each>

<hr/>


<div style="font-size:14">Information for researchers</div>
<br/>


<xsl:if test="string(ead/archdesc/prefercite/head)">
<a href="{$file}.html#{generate-id(ead/archdesc/prefercite/head)}">
<xsl:value-of select="ead/archdesc/prefercite/head"/>
</a>
</xsl:if>
<br/><br/>

<xsl:if test="string(ead/archdesc/accessrestrict/head)">
<a href="{$file}.html#{generate-id(ead/archdesc/accessrestrict/head)}">
<xsl:value-of select="ead/archdesc/accessrestrict/head"/>
</a>
</xsl:if>
<br/><br/>

<xsl:if test="string(ead/archdesc/userestrict/head)">
<a href="{$file}.html#{generate-id(ead/archdesc/userestrict/head)}">
<xsl:value-of select="ead/archdesc/userestrict/head"/>
</a>
</xsl:if>
<br/><br/>
<xsl:if test="string(ead/archdesc/separatedmaterial/head)">
<a href="{$file}.html#{generate-id(ead/archdesc/separatedmaterial/head)}">
<xsl:value-of select="ead/archdesc/separatedmaterial/head"/>
</a>
</xsl:if>
<br/><br/>

<xsl:if test="string(ead/archdesc/relatedmaterial/head)">
<a href="{$file}.html#{generate-id(ead/archdesc/relatedmaterial/head)}">
<xsl:value-of select="ead/archdesc/relatedmaterial/head"/>
</a>
</xsl:if>
<br/><br/>

<xsl:if test="string(ead/archdesc/phystech/head)">
<a href="{$file}.html#{generate-id(ead/archdesc/phystech/head)}">
<xsl:value-of select="ead/archdesc/phystech/head"/>
</a>
</xsl:if>
</b>
<br/><br/>
<hr/>

<div style="font-size:14"><b>Acquisition and Processing Information</b></div>
<br/>
<b>

<xsl:if test="string(ead/archdesc/acqinfo/*)">
<a href="{$file}.html#{generate-id(ead/archdesc/acqinfo/head)}">
<xsl:value-of select="ead/archdesc/acqinfo/head"/>
</a>
</xsl:if>
<br/><br/>

<xsl:if test="string(ead/archdesc/processinfo/*)">
<a href="{$file}.html#{generate-id(ead/archdesc/processinfo/head)}">
<xsl:value-of select="ead/archdesc/processinfo/head"/>
</a>
</xsl:if>
</b>
<br/><br/>
<b><a href="mailto:cartoons@osu.edu">Contact the Cartoon Research Library</a></b>
<br/><br/>
<hr/>
<hr/>
</div>


<!--This part of template inserts a logo and title at the top of the display.  Insert the proper path to your image in place of yourlogo.gif.-->

<div style="font-size:24; margin-left:21%">
<img src="[YOUR LOGO HERE].gif"></img>
<xsl:text>            </xsl:text>
<b>The Ohio State University Cartoon Research Library</b>
</div>
<br/>
<br/>
<!--TEMPLATE 19, LINE 406 FORMATS EADHEADER.-->


<div style="margin-left:35%; font-size:28">
<b>

<xsl:value-of select="ead/eadheader/filedesc/titlestmt/titleproper"/>
<xsl:text>  </xsl:text>
<xsl:value-of select="ead/eadheader/filedesc/titlestmt/subtitle"/>

</b>
</div>
<br/><br/><br/>
<br/><br/>


<div style="margin-left:35%; font-size:28">
<img src="[YOUR IMAGE NAME HERE].jpg"></img>
</div>
<br/><br/>
<br/><br/>



<!--THIS APPLIES TO PARAGRAPH TAGS OF THESE ELEMENTS - To change the order of display, adjust the sequence of the following apply-template statements which invoke the various templates that populate the finding aid.-->

<div style="margin-left:21%; padding-left:10px; padding-right:10px; width:77%">
<xsl:apply-templates select="ead/archdesc/did"/>

<xsl:apply-templates select="ead/archdesc/bioghist"/>
<xsl:apply-templates select="ead/archdesc/scopecontent"/>
<xsl:apply-templates select="ead/archdesc/arrangement"/>

<h2>Information for researchers</h2>
<xsl:apply-templates select="ead/archdesc/prefercite"/>
<xsl:apply-templates select="ead/archdesc/accessrestrict"/>
<xsl:apply-templates select="ead/archdesc/userestrict"/>
<xsl:apply-templates select="ead/archdesc/separatedmaterial"/>
<xsl:apply-templates select="ead/archdesc/relatedmaterial"/>
<xsl:apply-templates select="ead/archdesc/phystech"/>



<h2>Acquisition and Processing Information</h2>
<xsl:apply-templates select="ead/archdesc/acqinfo"/>
<xsl:apply-templates select="ead/archdesc/processinfo"/>
</div>
</body>
</html>
</xsl:document>



<!--CREATES A PAGE FOR EACH SERIES OF THE FINDING AID-->

<xsl:for-each select="ead/archdesc/dsc/c01">
<xsl:variable name="series">
<xsl:number value="position()" format="1"/>
</xsl:variable>
	
<xsl:document method="html" href="{$file}series{$series}.html">
<html>
<head><link rel="stylesheet" type="text/css" href="ead_divs.css" />
<title>

<xsl:value-of select="ancestor::ead/eadheader/filedesc/titlestmt/titleproper"/>
<xsl:text>  </xsl:text>
<xsl:value-of select="ancestor::ead/eadheader/filedesc/titlestmt/subtitle"/>
</title>
</head>

<body style="font-family:verdana; font-size:12">


<!--CHANGED DISPLAY PROPERTIES-->
<div id="toc" style="overflow:scroll; position:fixed; height:101%; border-right:1px; float:left; width:20%; margin-right:5px">

<div style="font-size:20"><b>Table of Contents</b></div>
<hr/>

<!-- The Table of Contents generates link to the [list of mandatory elements], then performs a series of tests to determine which additional elements will be included in the table of contents.  Each xsl:if statement tests to see if there is a matching element with content in the finding aid.-->

<div style="font-size:14"><b>General Description of the Collection</b></div>
<br/>


<b>
<div style="linespacing:20px">
<a href="{$file}.html">
<xsl:text>Title Page</xsl:text>
</a>
<br/><br/>

<!--CHANGED: VALUE-OF SELECT HAS ADDITION OF ANCESTOR::-->
<b>
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/did/head)}">
<xsl:value-of select="ancestor::ead/archdesc/did/head"/>
</a>
<br/><br/>

<!--CHANGED: VALUE-OF SELECT HAS ADDITION OF ANCESTOR::-->
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/bioghist/head)}">
<xsl:value-of select="ancestor::ead/archdesc/bioghist/head"/>
</a>
<br/><br/>

<!--CHANGED: VALUE-OF SELECT HAS ADDITION OF ANCESTOR::-->
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/scopecontent/head)}">
<xsl:value-of select="ancestor::ead/archdesc/scopecontent/head"/>
</a>
<br/><br/>
<!--CHANGED: VALUE-OF SELECT HAS ADDITION OF ANCESTOR::-->
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/arrangement/head)}">
<xsl:value-of select="ancestor::ead/archdesc/arrangement/head"/>
</a>
<br/><br/>

</b>
</div>
<hr/>

<div style="font-size:14">Detailed Description of the Collection / Box and Folder List</div>
<br/>
<!-- Displays the unittitle and unitdates for a c01 if it is a series and numbers them to form a hyperlink to each.-->

<!--CHANGED: FOR-EACH HAS ADDITION OF ANCESTOR::-->
<xsl:for-each select="ancestor::ead/archdesc/dsc/c01[@level='series']">
<a>
<xsl:attribute name="href">
<xsl:value-of select="$file"/>series<xsl:number value="position()" format="1"/>.html</xsl:attribute>

<xsl:apply-templates select="did/unittitle"/>
<xsl:text>, </xsl:text>
<xsl:apply-templates select="did/unitdate"/>
<br/><br/>
</a>
</xsl:for-each>

<hr/>


<div style="font-size:14">Information for researchers</div>
<br/>

<!--CHANGED: IF TEST AND VALUE-OF SELECT HAVE ADDITIONS OF ANCESTOR::-->
<xsl:if test="string(ancestor::ead/archdesc/prefercite/head)">
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/prefercite/head)}">
<xsl:value-of select="ancestor::ead/archdesc/prefercite/head"/>
</a>
</xsl:if>
<br/><br/>

<!--CHANGED: IF TEST AND VALUE-OF SELECT HAVE ADDITIONS OF ANCESTOR::-->
<xsl:if test="string(ancestor::ead/archdesc/accessrestrict/head)">
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/accessrestrict/head)}">
<xsl:value-of select="ancestor::ead/archdesc/accessrestrict/head"/>
</a>
</xsl:if>
<br/><br/>

<!--CHANGED: IF TEST AND VALUE-OF SELECT HAVE ADDITIONS OF ANCESTOR::-->
<xsl:if test="string(ancestor::ead/archdesc/userestrict/head)">
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/userestrict/head)}">
<xsl:value-of select="ancestor::ead/archdesc/userestrict/head"/>
</a>
</xsl:if>
<br/><br/>

<!--CHANGED: IF TEST AND VALUE-OF SELECT HAVE ADDITIONS OF ANCESTOR::-->
<xsl:if test="string(ancestor::ead/archdesc/separatedmaterial/head)">
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/separatedmaterial/head)}">
<xsl:value-of select="ancestor::ead/archdesc/separatedmaterial/head"/>
</a>
</xsl:if>
<br/><br/>

<!--CHANGED: IF TEST AND VALUE-OF SELECT HAVE ADDITIONS OF ANCESTOR::-->
<xsl:if test="string(ancestor::ead/archdesc/relatedmaterial/head)">
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/relatedmaterial/head)}">
<xsl:value-of select="ancestor::ead/archdesc/relatedmaterial/head"/>
</a>
</xsl:if>
<br/><br/>

<!--CHANGED: IF TEST AND VALUE-OF SELECT HAVE ADDITIONS OF ANCESTOR::-->
<xsl:if test="string(ancestor::ead/archdesc/phystech/head)">
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/phystech/head)}">
<xsl:value-of select="ancestor::ead/archdesc/phystech/head"/>
</a>
</xsl:if>
</b>
<br/><br/>

<hr/>

<div style="font-size:14"><b>Acquisition and Processing Information</b></div>
<br/>
<b>

<!--CHANGED: IF TEST AND VALUE-OF SELECT HAVE ADDITIONS OF ANCESTOR::-->
<xsl:if test="string(ancestor::ead/archdesc/acqinfo/*)">
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/acqinfo/head)}">
<xsl:value-of select="ancestor::ead/archdesc/acqinfo/head"/>
</a>
</xsl:if>
<br/><br/>

<!--CHANGED: IF TEST AND VALUE-OF SELECT HAVE ADDITIONS OF ANCESTOR::-->
<xsl:if test="string(ancestor::ead/archdesc/processinfo/*)">
<a href="{$file}.html#{generate-id(ancestor::ead/archdesc/processinfo/head)}">
<xsl:value-of select="ancestor::ead/archdesc/processinfo/head"/>
</a>
</xsl:if>
</b>
<br/><br/>

<div style="margin-bottom:20px">
<b><a href="mailto:[YOUR CONTACT EMAIL ADDRESS]">Contact the [YOUR INSTITUTION NAME]</a></b>
<br/><br/>
</div>
</div>


<div style="margin-left:21%">
<div style="font-size:14">
<b>
<xsl:value-of select="../head"/>
</b>
</div>


<div style="font-size:14">
<xsl:for-each select="p">
<p style="margin-left:25pt">
<xsl:value-of select="."/>
</p>
</xsl:for-each>


<xsl:for-each select="did">
<hr/>
<h3>
<b>
<a>
<xsl:attribute name="name">
<xsl:text>series</xsl:text>
<xsl:number from="dsc" count="c01"/>
</xsl:attribute>
<xsl:apply-templates select="unittitle"/>
<xsl:if test="unitdate[string-length(text()|*)!=0]">
<xsl:text>, </xsl:text>
</xsl:if>
<xsl:for-each select="unitdate">
<xsl:apply-templates/>
</xsl:for-each>
</a>
</b>
</h3>



<h3>
<xsl:apply-templates select="physdesc"/>
</h3>
</xsl:for-each>

<!--Closes the did.-->

<div style="margin-left:10pt; margin-right:10pt; font-size:14">
<b><xsl:apply-templates select="scopecontent/head"/></b>

<div style="font-size:12">
<xsl:for-each select="scopecontent/p">
<p><xsl:value-of select="." /></p>
</xsl:for-each>


<xsl:for-each select="separatedmaterial/p">
<p><xsl:value-of select="." /></p>
</xsl:for-each>
</div>
</div>

<!--Creates jump links to each of the subseries from the c01/arrangement lists.-->

<b>
<div style="font-size:12">
<p>
<xsl:value-of select="arrangement/p"/>
</p>
<xsl:for-each select="arrangement/list/item">
<xsl:variable name="subseriesNumber">
<xsl:number />
</xsl:variable>
<div style="margin-left:25pt">
<xsl:element name="a">
<xsl:attribute name="href">#subseries<xsl:value-of select="$subseriesNumber"/></xsl:attribute>
<xsl:value-of select="."/>
</xsl:element>
<br/><br/>
</div>
</xsl:for-each>
</div>
</b>
<br/>
<hr></hr>
<!--End creation of jump links.-->



<xsl:for-each select="c02">
<xsl:choose>
<xsl:when test="@level='subseries'">
<xsl:for-each select="did">
<b>
<h3>
<a>
<xsl:attribute name="name">
<xsl:text>subseries</xsl:text>
<xsl:number from="c01" count="c02 "/>
</xsl:attribute>
<xsl:apply-templates select="unittitle"/>
<xsl:if test="unitdate[string-length(text()|*)!=0]">
<xsl:text>, </xsl:text>
</xsl:if>
<xsl:for-each select="unitdate">
<xsl:apply-templates/>
<xsl:text>.&#x20;&#x20;</xsl:text>
</xsl:for-each>
</a>
</h3>
</b>
<h3>
<xsl:apply-templates select="physdesc"/>
</h3>
</xsl:for-each>


<div style="margin-left:10pt; margin-right:10pt; font-size:12">
<b><xsl:apply-templates select="scopecontent/head"/></b>
<br/>

<xsl:for-each select="scopecontent/p">
<p><xsl:apply-templates /></p>
</xsl:for-each>


<xsl:for-each select="accessrestrict/p">
<p><xsl:apply-templates /></p>
</xsl:for-each>

<xsl:for-each select="separatedmaterial/p">
<p><xsl:value-of select="." /></p>
</xsl:for-each>
</div>
</xsl:when>

<xsl:otherwise>
<xsl:for-each select="did">
<div style="margin-left:10pt; margin-right:10pt; font-size:12">
<b>

<xsl:variable name="first" select="container[@type='Box' or @type='Oversize' or @type='Map-case' or @type='Volume' or @type='Carton']"/>

<xsl:variable name="second" select="container[@type='Folder' or @type='Frame' or @type='Page'  or @type='Reel']"/>

<br/>

<xsl:value-of select="$first/@type"/><xsl:text> </xsl:text><xsl:value-of select="container[@type='Box']"/>

<xsl:if test="container[@type='Folder']">
<xsl:text> / </xsl:text>
<xsl:value-of select="$second/@type"/><xsl:text> </xsl:text><xsl:value-of select="container[@type='Folder']"/>
</xsl:if>

<br/>

<xsl:apply-templates select="unittitle"/>
<xsl:if test="unitdate[string-length(text()|*)!=0]">
<xsl:text>, </xsl:text>
</xsl:if>
<xsl:for-each select="unitdate">
<xsl:apply-templates/>
</xsl:for-each>
</b>
</div>			
</xsl:for-each>


<!--Closes the did.-->


<div style="margin-left:10pt; margin-right:10pt; font-size:12">
<xsl:for-each select="scopecontent">
<xsl:apply-templates/>
<br/><br/>
</xsl:for-each>

<xsl:for-each select="note/p">
<xsl:apply-templates/>
<br/><br/>
</xsl:for-each>


<xsl:for-each select="separatedmaterial/p">
<xsl:apply-templates/>
<br/><br/>
</xsl:for-each>
</div>
<xsl:if test="position()=last()">
<hr/>
</xsl:if>
</xsl:otherwise>
</xsl:choose>

<xsl:for-each select="c03">
<xsl:for-each select="did">
<div style="margin-left:10pt; margin-right:10pt; font-size:12">
<b>

<xsl:variable name="first" select="container[@type='Box' or @type='Oversize' or @type='Map-case' or @type='Volume' or @type='Carton']"/>

<xsl:variable name="second" select="container[@type='Folder' or @type='Frame' or @type='Page'  or @type='Reel']"/>

<br/>

<xsl:value-of select="$first/@type"/><xsl:text> </xsl:text><xsl:value-of select="container[@type='Box']"/>

<xsl:if test="container[@type='Folder']">
<xsl:text> / </xsl:text>
<xsl:value-of select="$second/@type"/><xsl:text> </xsl:text><xsl:value-of select="container[@type='Folder']"/>
</xsl:if>


<xsl:if test="container[@type='Oversize']">
<xsl:value-of select="$second"/>
<xsl:text> </xsl:text>
<xsl:value-of select="container[@type='Oversize']"/>
</xsl:if>


<xsl:if test="container[@type='Map-case']">
<xsl:value-of select="$second"/>
<xsl:text> </xsl:text>
<xsl:value-of select="container[@type='Map-case']"/>
</xsl:if>

<br/>

<xsl:apply-templates select="unittitle"/>
<xsl:if test="unitdate[string-length(text()|*)!=0]">
<xsl:text>, </xsl:text>
</xsl:if>
<xsl:for-each select="unitdate">
<xsl:apply-templates/>
</xsl:for-each>
</b>
</div>			
</xsl:for-each>


<!--Closes the did.-->

<div style="margin-left:10pt; margin-right:10pt; font-size:12">
<xsl:for-each select="scopecontent">
<xsl:apply-templates/>
<br/><br/>
</xsl:for-each>

<xsl:for-each select="note/p">
<xsl:apply-templates/>
<br/><br/>
</xsl:for-each>


<xsl:for-each select="separatedmaterial/p">
<xsl:apply-templates/>
<br/><br/>
</xsl:for-each>
</div>
<xsl:if test="position()=last()">
<hr/>
</xsl:if>
</xsl:for-each>
</xsl:for-each>

</div>
</div>
</body>
</html>
</xsl:document>
</xsl:for-each>

</xsl:template>


<!--TEMPLATE 3: META TAGS (DUBLIN CORE)-->
<xsl:template name="metadata">

<meta http-equiv="Content-Type" name="dc.title" content="{eadheader/filedesc/titlestmt/titleproper&#x20; }{eadheader/filedesc/titlestmt/subtitle}"/>

<meta http-equiv="Content-Type" name="dc.author" content="{ead/archdesc/did/origination}"/>

<xsl:for-each select="//controlaccess/persname | //controlaccess/corpname">
<xsl:choose>
<xsl:when test="@encodinganalog='600'">
<meta http-equiv="Content-Type" name="dc.subject" content="{.}"/>

</xsl:when>
<xsl:when test="//@encodinganalog='610'">
<meta http-equiv="Content-Type" name="dc.subject" content="{.}"/>
</xsl:when>
<xsl:when test="//@encodinganalog='611'">
<meta http-equiv="Content-Type" name="dc.subject" content="{.}"/>
</xsl:when>

<xsl:when test="//@encodinganalog='700'">
<meta http-equiv="Content-Type" name="dc.contributor" content="{.}"/>
</xsl:when>
<xsl:when test="//@encodinganalog='710'">
<meta http-equiv="Content-Type" name="dc.contributor" content="{.}"/>
</xsl:when>

<xsl:otherwise>
<meta http-equiv="Content-Type" name="dc.contributor" content="{.}"/>
</xsl:otherwise>
</xsl:choose>

</xsl:for-each>
<xsl:for-each select="//controlaccess/subject">
<meta http-equiv="Content-Type" name="dc.subject" content="{.}"/>
</xsl:for-each>
<xsl:for-each select="//controlaccess/geogname">
<meta http-equiv="Content-Type" name="dc.subject" content="{.}"/>
</xsl:for-each>

<meta http-equiv="Content-Type" name="dc.title" content="{ead/archdesc/did/unittitle}"/>
<meta http-equiv="Content-Type" name="dc.type" content="text"/>
<meta http-equiv="Content-Type" name="dc.format" content="manuscripts"/>
<meta http-equiv="Content-Type" name="dc.format" content="finding aids"/>
</xsl:template>
<!--END TEMPLATE 3 (metadata)-->




<!--TEMPLATES 6-15: TEXT RENDERING ATTRIBUTES-->

<xsl:template match="title[@render='italic']">
<i>
<xsl:apply-templates/>
</i>
</xsl:template>

<xsl:template match="title[@render='doublequote']">
<xsl:text>"</xsl:text>
<xsl:apply-templates/>
<xsl:text>"</xsl:text>
</xsl:template>

<xsl:template match="title[@render='singlequote']">
<xsl:text>'</xsl:text>
<xsl:apply-templates/>
<xsl:text>'</xsl:text>
</xsl:template>

<xsl:template match="title[@render='bold']">
<b>
<xsl:apply-templates/>
</b>
</xsl:template>

<xsl:template match="title[@render='underline']">
<u>
<xsl:apply-templates/>
</u>
</xsl:template>

<xsl:template match="emph[@render='italic']">
<i>
<xsl:apply-templates/>
</i>
</xsl:template>

<xsl:template match="emph[@render='doublequote']">
<xsl:text>"</xsl:text>
<xsl:apply-templates/>
<xsl:text>"</xsl:text>
</xsl:template>

<xsl:template match="emph[@render='singlequote']">
<xsl:text>'</xsl:text>
<xsl:apply-templates/>
<xsl:text>'</xsl:text>
</xsl:template>

<xsl:template match="emph[@render='bold']">
<b>
<xsl:apply-templates/>
</b>
</xsl:template>

<xsl:template match="emph[@render='underline']">
<u>
<xsl:apply-templates/>
</u>
</xsl:template>

<!--END TEMPLATES 6-15-->


<!--TEMPLATE 16.1: OUTPUT <extref> TO HTML <a href>.-->
<xsl:template match="ead/archdesc/relatedmaterial/p/extref">
<xsl:element name="a">
<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
<xsl:attribute name="role"><xsl:value-of select="@role" /></xsl:attribute>
<xsl:attribute name="actuate"><xsl:value-of select="@actuate" /></xsl:attribute>
<xsl:attribute name="show"><xsl:value-of select="@show" /></xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:template>



<!--TEMPLATE 16.2: OUTPUT <extref> TO HTML <a href>, puts link on a new line.-->
<xsl:template match="ead/archdesc/dsc//extref">
<br/>
<xsl:element name="a">
<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
<xsl:attribute name="role"><xsl:value-of select="@role" /></xsl:attribute>
<xsl:attribute name="actuate"><xsl:value-of select="@actuate" /></xsl:attribute>
<xsl:attribute name="show"><xsl:value-of select="@show" /></xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:template>


<!--TEMPLATES 17-18: FORMAT LISTS (EXCEPT IN ARRANGEMENT ELEMENT)-->
<xsl:template match="list[parent::*[not(self::arrangement)]]/head">
<div style="margin-left: 25pt">
<b>
<xsl:apply-templates/>
</b>
</div>
</xsl:template>

<xsl:template match="list[parent::*[not(self::arrangement)]]/item">
<div style="margin-left: 40pt">
<xsl:apply-templates/>
</div>
</xsl:template>
<!--END TEMPLATES 17-18-->


<!--TEMPLATE 19: SUPPRESS ALL OTHER ELEMENTS OF EADHEADER (see line 278 in template 5)-->
<xsl:template match="eadheader">
<h1 style="margin-left:40pt">
<xsl:value-of select="filedesc/titlestmt/titleproper"/>
</h1>
<h2 style="margin-left:40pt">
<xsl:value-of select="filedesc/titlestmt/subtitle"/>
</h2>
<br></br>
<div style="margin-left:40pt">
<img src="Toni.jpg"/>
<img src="ToniCard.gif"/>
</div>
<br/><br/>
</xsl:template>
<!--END TEMPLATE 19-->


<!--TEMPLATE 20: FORMATS TABLE FOR ARCHDESC/DID-->
<!--This template creates a table for the did, inserts the head and then each of the other did elements.  To change the order of appearance of these elements, change the sequence of the apply-templates statements.-->

<xsl:template match="ead/archdesc/did">
<table width="100%">
<tr>
<td width="15%"></td>
<td width="45%"></td>
</tr>

<tr>
<td colspan="2">
<b>
<div style="font-size:16">
<a name="{generate-id(head)}">
<xsl:apply-templates select="head"/>
</a>
</div>
</b>
</td>
</tr>



<!--One can change the order of appearance for the children of did 				by changing the order of the following statements.-->
<div style="font-size:14">
<br/>
<xsl:apply-templates select="repository"/>
<xsl:apply-templates select="origination"/>
<xsl:apply-templates select="unittitle"/>
<xsl:apply-templates select="unitdate"/>
<xsl:apply-templates select="physdesc"/>
<xsl:apply-templates select="abstract"/>
<xsl:apply-templates select="unitid"/>
<xsl:apply-templates select="langmaterial"/>
</div>
</table>
<p>
<a href="{$file}.html">Return to Top</a>
</p>
<hr></hr>
</xsl:template>


<!--END TEMPLATE 20-->


<!--TEMPLATE 21-->
<!--This template formats the repository, origination, unittitle, unitdate, physdesc, abstract, unitid, and langmaterial elements of ead/archdesc/did.  The sequence of their appearance is governed by Template 20.-->

<xsl:template match="ead/archdesc/did/repository | ead/archdesc/did/origination | ead/archdesc/did/unittitle | ead/archdesc/did/unitdate | ead/archdesc/did/physdesc | ead/archdesc/did/unitid | ead/archdesc/did/physloc | ead/archdesc/did/abstract | ead/archdesc/did/langmaterial | ead/archdesc/did/materialspec">
<tr>
<td valign="top">
<b>
<div style="font-size:12">
<xsl:value-of select="@label"/>
</div>
</b>
</td>
<td>
<div style="font-size:12">
<xsl:apply-templates/>
</div>
</td>
</tr>
</xsl:template>


<!--END TEMPLATE 21-->


<!--TEMPLATE 22: FORMATS SCOPECONTENT, ARRANGEMENT, BIOGRAPHY/HISTORY, AND ODD-->
<xsl:template match="ead/archdesc/scopecontent |  ead/archdesc/arrangement | ead/archdesc/bioghist | ead/archdesc/odd">
<xsl:if test="string(child::*)">
<xsl:apply-templates/>
<p>
<a href="{$file}.html">Return to Top</a>
</p>
<hr></hr>
</xsl:if>
</xsl:template>
<!--END TEMPLATE 22-->


<!--TEMPLATE 23: MATCHES VARIOUS HEAD ELEMENTS AND MAKES THEM LINK BACK TO THE TOC-->
<xsl:template match="ead/archdesc/scopecontent/head | ead/archdesc/arrangement/head  | ead/archdesc/bioghist/head | ead/archdesc/odd/head">
<h3>
<a name="{generate-id()}">
<xsl:apply-templates/>
</a>
</h3>
</xsl:template>
<!--END TEMPLATE 23-->

<!--TEMPLATE 24: MATCHES PARAGRAPH ELEMENTS CORRESPONDING TO HEAD ELEMENTS IN TEMPLATE 23-->
<xsl:template match="ead/archdesc/scopecontent/p | ead/archdesc/scopecontent/scopecontent/p | ead/archdesc/arrangement/p | ead/archdesc/bioghist/p | ead/archdesc/bioghist/bioghist/p | ead/archdesc/odd/p ">

<p style="margin-left:10pt">
<xsl:apply-templates/>
</p>
</xsl:template>
<!--END TEMPLATE 24-->


<!--TEMPLATES 25-26: FORMAT AN ARRANGEMENT ELEMENT EMBEDDED IN A SCOPECONTENT-->
<xsl:template match="ead/archdesc/scopecontent/arrangement/head">
<p style="margin-left:25pt">
<a name="{generate-id()}">
<xsl:apply-templates/>
</a>
</p>

</xsl:template>

<xsl:template match="ead/archdesc/scopecontent/arrangement/p">
<p style="margin-left:50pt">
<xsl:apply-templates/>
</p>
</xsl:template>
<!--END TEMPLATES 25-26-->


<!--TEMPLATES 27-28: FORMAT A LIST WITHIN AN ARRANGEMENT ELEMENT-->
<xsl:template match="ead/archdesc/arrangement/list/head">
<p style="margin-left:25pt">
<xsl:apply-templates/>
</p>
</xsl:template>

<xsl:template match="ead/archdesc/arrangement/list/item">
<div style="margin-left:50pt">
<xsl:element name="a">
<xsl:attribute name="href">#series<xsl:number/>
</xsl:attribute>
<xsl:apply-templates/>
</xsl:element>
</div>
</xsl:template>
<!--END TEMPLATES 27-28-->



<!--TEMPLATES : INFORMATION FOR RESEARCHERS ELEMENTS-->
<xsl:template match="ead/archdesc/prefercite | ead/archdesc/accessrestrict | ead/archdesc/userestrict | ead/archdesc/relatedmaterial | ead/archdesc/separatedmaterial | ead/archdesc/phystech">
<xsl:if test="string(child::*)">
<xsl:apply-templates/>
</xsl:if>
<a href="{$file}.html">Return to Top</a>
</xsl:template>

<!--TEMPLATE : MATCHES VARIOUS HEAD ELEMENTS AND MAKES THEM LINK BACK TO THE TOC-->
<xsl:template match="ead/archdesc/prefercite/head | ead/archdesc/accessrestrict/head | ead/archdesc/userestrict/head | ead/archdesc/relatedmaterial/head | ead/archdesc/separatedmaterial/head | ead/archdesc/phystech/head">
<h3>
<a name="{generate-id()}">
<xsl:apply-templates/>
</a>
</h3>
</xsl:template>

<!--TEMPLATE : MATCHES PARAGRAPH ELEMENTS CORRESPONDING TO HEAD ELEMENTS IN TEMPLATE 23-->

<xsl:template match="ead/archdesc/prefercite/p | ead/archdesc/accessrestrict/p | ead/archdesc/userestrict/p | ead/archdesc/relatedmaterial/p | ead/archdesc/separatedmaterial/p | ead/archdesc/phystech/p">
<p style="margin-left:25pt">
<xsl:apply-templates/>
</p>
<xsl:if test="position()=last()">
<br/>
</xsl:if>
</xsl:template>



<!--TEMPLATES 33-35: ACQUISTION AND PROCESSING INFORMATION-->
<xsl:template match="ead/archdesc/acqinfo | ead/archdesc/processinfo">
<xsl:if test="string(child::*)">
<xsl:apply-templates/>
</xsl:if>
<a href="{$file}.html">Return to Top</a>
</xsl:template>


<xsl:template match="ead/archdesc/acqinfo/head | ead/archdesc/custodhist/head | ead/archdesc/processinfo/head">
<h3>
<a name="{generate-id()}">
<xsl:apply-templates/>
</a>
</h3>
</xsl:template>

<xsl:template match="ead/archdesc/acqinfo/p | ead/archdesc/custodhist/p | ead/archdesc/processinfo/p">
<p style="margin-left:25pt">
<xsl:apply-templates/>
</p>
<xsl:if test="position()=last()">
<br/>
</xsl:if>
</xsl:template>
<!--END TEMPLATES 33-35-->

</xsl:stylesheet>
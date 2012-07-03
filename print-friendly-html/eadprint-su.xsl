<!-- Based on EAD Cookbook Style 6 and dsc1 -->

<!--  This stylesheet generates a very simple printer-friendly HTML. 
      It presumes the presence of the associated style sheet, 
      eadprint.css style. All font properties - family, size, weight,
      etc - are set in the css style sheet, not in the XSLT. -->

<!--  Line 75 calls out the logo of the university. -->


<!-- ******************************************************************** -->
<!-- ******                    CHANGE RECORD                      ******* -->
<!-- ******************************************************************** -->

<!-- MRC - 6/27/07
     Moved Related Finding Aids section to follow arrangement. -->

<!-- MRC - 5/17/07
     Added "Tape" as permissible second container type

     Added phystech handling (puts it in parens, after the
     date but before the extent, e.g. "My Show 8/19/98 (VHS) (5 tapes) 

     Modifed small collection container processing, container
     type should now be "SC" and the contents will be just the folder
     number, e.g. <container type="SC">175</container> which will yield
     "SC 175" as the container name. -->

<!-- MRC - 9/7/06
     Fixed problems when there are two container elements
     Tested with vassos_j.xml (map-case/drawer) and kenya_full.xml (reels) -->

<!-- 31 Aug 2006
     Added "Package" as allowable container type -->

<!-- 24 Aug 2006
     Moved indexes to the end of the finding aid, added for-each to make
     them all show up in the TOC -->

<!-- 25 Jul 2006
     Merged bulk and inclusive dates into one line to take up less space -->



<!-- ******************************************************************** -->
<!-- *******                 END OF CHANGE RECORD                 ******* -->
<!-- ******************************************************************** -->




	<!-- ****************************************************************** -->
	<!-- Outputs header information for the HTML document 			-->
	<!-- ****************************************************************** -->

	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:strip-space elements="*"/>
	<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
	<!-- Creates the body of the finding aid.-->
	<xsl:template match="/ead">
		<html>
			<head>
      				<link rel="stylesheet" type="text/css" href="eadprint.css" />
				<title>
					<xsl:value-of select="eadheader/filedesc/titlestmt/titleproper"/>
					<xsl:text>  </xsl:text>
					<xsl:value-of select="eadheader/filedesc/titlestmt/subtitle"/>
				</title>
			</head>


			<body>
	
				<!-- Inserts logo and title at the top of the display. -->

				<center>
					<img src="sulogo_sm.gif"></img>
						
					<xsl:apply-templates select="eadheader"/>

                        	<!-- output information about the author(s) and date(s) of the finding aid -->

				<p class="fa-info">
                       			Finding aid created by: <xsl:apply-templates select="//eadheader/filedesc/titlestmt/author"/><br/>
                       			Date: <xsl:apply-templates select="//eadheader/filedesc/publicationstmt/date"/><br/>
                       		</p>

                                <table class="revhist">
                                   <tr>
                                      <td colspan="2"><center>Revision history:</center></td>
                                   </tr>
                                   <xsl:for-each select="//eadheader/revisiondesc/list/item">
                                      <tr>
                                         <td class="revdate"><xsl:value-of select="substring-before(.,' - ')"/></td>
                                         <td class="revdesc"><xsl:value-of select="substring-after(.,' - ')"/></td>
                                      </tr>
                                   </xsl:for-each>
                                </table>

 				</center>
													
				<hr/>
				
				<!--To change the order of display, adjust the sequence of
				the following apply-template statements which invoke the various
				templates that populate the finding aid.  Multiple statements
				are included to handle the possibility that descgrp has been used
				as a wrapper to replace add and admininfo.  In several cases where
				multiple elements are displayed together in the output, a call-template
				statement is used -->	
					
				<xsl:apply-templates select="archdesc/did"/>
                                <p class="breakhere"></p>
				<xsl:apply-templates select="archdesc/bioghist"/>
				<xsl:apply-templates select="archdesc/scopecontent"/>
				<xsl:apply-templates select="archdesc/arrangement"/>
				<xsl:apply-templates select="archdesc/otherfindaid | archdesc/*/otherfindaid"/>
				<xsl:call-template name="archdesc-restrict"/>
				<xsl:call-template name="archdesc-relatedmaterial"/>
				<xsl:apply-templates select="archdesc/controlaccess"/>
				<xsl:apply-templates select="archdesc/odd"/>
				<xsl:apply-templates select="archdesc/originalsloc"/>
				<xsl:apply-templates select="archdesc/phystech"/>
				<xsl:call-template name="archdesc-admininfo"/>
				<xsl:apply-templates select="archdesc/fileplan | archdesc/*/fileplan"/>
				<xsl:apply-templates select="archdesc/bibliography | archdesc/*/bibliography"/>
				<xsl:call-template name="toc"/>
				<xsl:apply-templates select="archdesc/dsc"/>	
                                <hr/>			
				<xsl:apply-templates select="archdesc/index | archdesc/*/index"/>
			</body>
		</html>
	</xsl:template>






	<!-- ****************************************************************** -->
	<!-- TABLE OF CONTENTS TEMPLATE						-->
	<!-- Because paper copies have no linking capabilities, no linking	-->
	<!-- HTML in included.  Also, none of the front matter is listed in 	-->
	<!-- the TOC since in the paper version the TOC comes after the front	-->
	<!-- matter and right before the actual inventory itself		-->
	<!-- ****************************************************************** -->

	<xsl:template name="toc">

		<h3>Table of Contents</h3>

		<!-- *************************************************	-->
		<!-- Captures unittitle and unitdates for c01's whose	-->
		<!-- @level is subgrp, subcollection,series or 		-->
		<!-- subseries, and generates TOC (no page #s)  	-->
		<!-- *************************************************	-->

		<xsl:for-each select="archdesc/dsc/c01[@level='series' or @level='subseries'
		or @level='subgrp' or @level='subcollection']">
			<p class="toc-para1">
				<xsl:choose>
					<xsl:when test="did/unittitle/unitdate">
						<xsl:for-each select="did/unittitle">
							<xsl:value-of select="text()"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="./unitdate"/>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="did/unittitle"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="did/unitdate"/>
					</xsl:otherwise>
				</xsl:choose>
			</p>
		</xsl:for-each>
                <xsl:for-each select="archdesc/index | archdesc/*/index">
                	<p class="toc-para1"><xsl:apply-templates select="head"/></p>
                </xsl:for-each>
		<hr/>
		<!-- <p class="breakhere"/> -->
	</xsl:template>


	<!-- ******************************************************************	-->
	<!-- Formats variety of text properties (bold, italic) from @RENDER     -->
	<!-- Also BLOCKQUOTE handling                                           -->
	<!-- ****************************************************************** -->

	<xsl:template match="blockquote">
		<blockquote>
			<xsl:apply-templates/>
		</blockquote>
	</xsl:template>


	<xsl:template match="blockquote/p">
		<blockquote>
			<xsl:apply-templates/>
		</blockquote>
	</xsl:template>


	<xsl:template match="emph[@render='bold']">
		<b>
			<xsl:apply-templates/>
		</b>
	</xsl:template>

	<xsl:template match="emph[@render='italic']">
		<i>
			<xsl:apply-templates/>
		</i>
	</xsl:template>

	<xsl:template match="emph[@render='underline']">
		<u>
			<xsl:apply-templates/>
		</u>
	</xsl:template>

	<xsl:template match="emph[@render='sub']">
		<sub>
			<xsl:apply-templates/>
		</sub>
	</xsl:template>

	<xsl:template match="emph[@render='super']">
		<super>
			<xsl:apply-templates/>
		</super>
	</xsl:template>

	<xsl:template match="emph[@render='bolditalic']">
		<b>
			<i>
				<xsl:apply-templates/>
			</i>
		</b>
	</xsl:template>



	<!-- ****************************************************************** -->
	<!-- LINKS								-->
	<!-- Converts REF, EXTREF and PTR elements into HTML links as needed 	-->
	<!-- ****************************************************************** -->

	<!-- <xsl:template match="ref">
		<a href="#{@target}">
			<xsl:apply-templates/>
		</a>
	</xsl:template>

	<xsl:template match="extref">
		<a href="{@href}">
			<xsl:apply-templates/>
		</a>
	</xsl:template>

	<xsl:template match="ptr">
		<a href="{@href}">
			<xsl:value-of select="@href"/><xsl:apply-templates/>
		</a>
	</xsl:template> -->

	<xsl:template match="extptr">

		<xsl:choose>
			<xsl:when test="self::extptr[@show='embed']">
                              <img src="{@xpointer}" alt="{@title}" align="{@altrender}"/>
			</xsl:when>

			<xsl:otherwise>
                              {@title} [Link to external file "{@xpointer}"]
			</xsl:otherwise>
                </xsl:choose>

	</xsl:template>


	
	<!-- ****************************************************************** -->
	<!-- LIST								-->
	<!-- Formats a list anywhere except in ARRANGEMENT or REVISIONDESC.   	-->
	<!-- Two values for attribute TYPE are implemented: "simple" gives   	-->
	<!-- an indented list with no marker, "marked" gives an indented list  	-->
	<!-- with each item bulleted.						-->
	<!-- ****************************************************************** -->

        
	<xsl:template match="archdesc/scopecontent/list">
		<div style="margin-left: 25pt">
			<xsl:apply-templates/>
		</div>
	</xsl:template>


	<xsl:template match="list[parent::*[not(self::arrangement)]]/head">
		<div style="margin-left: 25pt">
			<b>
				<xsl:apply-templates/>
			</b>
		</div>
	</xsl:template>


	<xsl:template match="list[parent::*[not((self::arrangement)|(self::revisiondesc))]]/item">
		<xsl:if test="@id">
			<a id="{@id}"></a>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="parent::list[@type='marked']">
				<div style="margin-left: 25pt">
					&#x2022; <xsl:apply-templates/>
				</div>
			</xsl:when>
			<xsl:otherwise>
		             <div style="margin-left: 25pt"><xsl:apply-templates/></div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="list[parent::*[not(self::arrangement)]]/item/note">
		<i><xsl:apply-templates/></i>
	</xsl:template>


	<!-- ****************************************************************** -->
	<!-- TABLE								-->
	<!-- Formats a simple table. The width of each column is defined 	-->
	<!-- by the colwidth attribute in a colspec element. The template	-->
	<!-- is named so it can be called from inside c0# elements.  ID  	-->
	<!-- attribute is implemented for ROW but not ENTRY 			-->
	<!-- ****************************************************************** -->
	
	<xsl:template match="table">
		<xsl:call-template name="table"/>
	</xsl:template>


	<xsl:template name="table">
		<table width="75%" style="margin-left: 25pt">
			<tr>
				<td colspan="3">
					<h4>
						<xsl:apply-templates select="head"/>
					</h4>
				</td>
			</tr>
			<xsl:for-each select="tgroup">
				<tr>
					<xsl:for-each select="colspec">
						<td width="{@colwidth}"></td>
					</xsl:for-each>
				</tr>
				<xsl:for-each select="thead">
					<xsl:for-each select="row">
						<tr>
							<xsl:for-each select="entry">
								<td valign="top">
									<b>
										<xsl:apply-templates/>
									</b>
								</td>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</xsl:for-each>

				<xsl:for-each select="tbody">
					<xsl:for-each select="row">
						<xsl:if test="@id">
							<a id="{@id}"></a>
						</xsl:if>
						<tr>
							<xsl:for-each select="entry">
								<td valign="top">
									<xsl:apply-templates/>
								</td>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template match="entry/note">
		<br/><i><xsl:apply-templates/></i>
	</xsl:template>


	<!-- ****************************************************************** -->
	<!-- CHRONLIST								-->
	<!-- Formats a chronology list with items			 	-->
	<!-- ****************************************************************** -->

	<xsl:template match="chronlist">
		<table width="100%" style="margin-left:25pt">
			<tr>
				<td width="5%"> </td>
				<td width="15%"> </td>
				<td width="80%"> </td>
			</tr>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	
	<xsl:template match="chronlist/head">
		<tr>
			<td colspan="3">
				<h4>
					<xsl:apply-templates/>			
				</h4>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="chronlist/listhead">
		<tr>
			<td> </td>
			<td>
				<b>
					<xsl:apply-templates select="head01"/>
				</b>
			</td>
			<td>
				<b>
					<xsl:apply-templates select="head02"/>
				</b>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="chronitem">
		<!--Determine if there are event groups.-->
		<xsl:choose>
			<xsl:when test="eventgrp">
				<!--Put the date and first event on the first line.-->
				<tr>
					<td> </td>
					<td valign="top">
						<xsl:apply-templates select="date"/>
					</td>
					<td valign="top">
						<xsl:apply-templates select="eventgrp/event[position()=1]"/>
					</td>
				</tr>
				<!--Put each successive event on another line.-->
				<xsl:for-each select="eventgrp/event[not(position()=1)]">
					<tr>
						<td> </td>
						<td> </td>
						<td valign="top">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:when>
			<!--Put the date and event on a single line.-->
			<xsl:otherwise>
				<tr>
					<td> </td>
					<td valign="top">
						<xsl:apply-templates select="date"/>
					</td>
					<td valign="top">
						<xsl:apply-templates select="event"/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- ****************************************************************** -->
	<!-- TITLEPROPER and SUBTITLE are output	 			-->
	<!-- ****************************************************************** -->

	<xsl:template match="eadheader">
	<h2>
		<xsl:apply-templates select="filedesc/titlestmt/titleproper"/>
	</h2>
	<h3>
		<xsl:apply-templates select="filedesc/titlestmt/subtitle"/>
	</h3>
	<br/>
	</xsl:template>


	<!-- ****************************************************************** -->
	<!-- DID processing: 							-->
	<!-- This template creates a table for the did, inserts the head and  	-->
	<!-- then each of the other did elements.  To change the order of 	-->
	<!-- appearance of these elements, change the sequence here.		-->
	<!-- UNITID is suppressed as not being useful to researchers; to show	-->
	<!-- it, uncomment the unitid line below.				-->
	<!-- ****************************************************************** -->

	<xsl:template match="archdesc/did">
		<table width="100%" class="overview">
			<tr>
				<td width="10%"> </td>
				<td> </td>
			</tr>
			<tr>
				<td colspan="2">
					<h3><xsl:apply-templates select="head"/></h3>
				</td>
			</tr>	

			<xsl:apply-templates select="origination"/>	
			<xsl:apply-templates select="unittitle"/>	
			<!-- <xsl:apply-templates select="unitdate"/> -->
                        <xsl:if test="unitdate">
                           <tr>	
                              <td valign="top">
                                 <b>Dates:</b>
                              </td>
                              <td>
                                 <xsl:for-each select="unitdate">
                                    <xsl:choose>
                                       <xsl:when test="@encodinganalog='245$f'">
                                          <xsl:value-of select="."/>
                                       </xsl:when>
                                       <xsl:when test="@encodinganalog='245$g'">
                                          (bulk: <xsl:value-of select="."/>)
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <xsl:value-of select="."/>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:if>	
			<xsl:apply-templates select="physdesc"/>	
			<xsl:apply-templates select="abstract"/>	
			<!-- <xsl:apply-templates select="unitid"/>  -->
			<xsl:apply-templates select="physloc"/>
			<xsl:apply-templates select="langmaterial"/>
			<xsl:apply-templates select="repository"/>
			<xsl:apply-templates select="materialspec"/>
			<xsl:apply-templates select="note"/>
		</table>
		<hr/>
	</xsl:template>



	<!-- ****************************************************************** -->
	<!-- COLLECTION INFO: 							-->
	<!-- This handles repository, origination, physdesc, abstract,unitid, 	-->
	<!-- physloc and materialspec elements of archdesc/did which share a 	-->
	<!-- common appearance.  Labels are also generated; to change the label	-->
	<!-- generated for these sections, modify the text below.		-->
	<!-- ****************************************************************** -->

	<xsl:template match="archdesc/did/repository
	| archdesc/did/origination
	| archdesc/did/physdesc
	| archdesc/did/unitid
	| archdesc/did/physloc
	| archdesc/did/abstract
	| archdesc/did/langmaterial
	| archdesc/did/materialspec">

	<!-- ****************************************************************** -->
	<!-- Tests for @LABEL.  If @LABEL is present it is used, otherwise 	-->
	<!-- a label is supplied (to alter supplied text, make change below).	-->
	<!-- ****************************************************************** -->

		<xsl:choose>
			<xsl:when test="@label">
				<tr>
				
					<td valign="top">
						<b>
							<xsl:value-of select="@label"/>
						</b>
					</td>
					<td>
						<xsl:apply-templates/>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<tr>
					<td valign="top">
						<b>
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
									<xsl:text>Abstract:</xsl:text>
								</xsl:when>
								<xsl:when test="self::langmaterial">
									<xsl:text>Language: </xsl:text>
								</xsl:when>
								<xsl:when test="self::materialspec">
									<xsl:text>Technical: </xsl:text>
								</xsl:when>
							</xsl:choose>
						</b>
					</td>
					<td>
						<xsl:apply-templates/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ****************************************************************** -->
	<!-- UNITTITLE, UNITDATE						-->
	<!-- If @LABEL is present it is used, otherwise a label is generated.	-->
	<!-- ****************************************************************** -->

	<xsl:template match="archdesc/did/unittitle">

		<xsl:choose>

			<xsl:when test="@label">
				<tr>
					
					<td valign="top">
						<b>
							<xsl:value-of select="@label"/>
						</b>
					</td>
					<td>
						<xsl:apply-templates select="text() |* [not(self::unitdate)]"/>
					</td>
				</tr>
			</xsl:when>
		
			<xsl:otherwise>
				<tr>
					
					<td valign="top">
						<b>
							<xsl:text>Title: </xsl:text>
						</b>
					</td>
					<td>
						<xsl:apply-templates select="text() |* [not(self::unitdate)]"/>
					</td>
				</tr>

			</xsl:otherwise>

		</xsl:choose>


		<xsl:if test="child::unitdate">

			<xsl:choose>
				<xsl:when test="unitdate/@label">
					<tr>
						
						<td valign="top">
							<b>
								<xsl:value-of select="unitdate/@label"/>
							</b>
						</td>
						<td>
							<xsl:apply-templates select="unitdate"/>
						</td>
					</tr>
				</xsl:when>
	
				<xsl:otherwise>
					<tr>
						
						<td valign="top">
							<b>
								<xsl:text>Dates: </xsl:text>
							</b>
						</td>
						<td>
							<xsl:apply-templates select="unitdate"/>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template match="archdesc/did/unitdate">

		<xsl:choose>
			<xsl:when test="@label">
				<tr>
					
					<td valign="top">
						<b>
							<xsl:value-of select="@label"/>
						</b>
					</td>
					<td>
						<xsl:apply-templates/>
					</td>
				</tr>
			</xsl:when>
		
			<xsl:otherwise>
				<tr>
				
					<td valign="top">
						<b>
							<xsl:text>Dates: </xsl:text>
						</b>
					</td>
					<td>
						<xsl:apply-templates/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	
	<!-- ************************* -->
	<!-- NOTE element within a DID -->
	<!-- ************************* -->

	<xsl:template match="archdesc/did/note">
		<xsl:for-each select="p">
			<!--The template tests to see if there is a label attribute, inserting the contents if there is or adding one if there isn't. -->
			<xsl:choose>
				<xsl:when test="parent::note[@label]">
					<!--This nested choose tests for and processes the first paragraph. Additional paragraphs do not get a label.-->
					<xsl:choose>
						<xsl:when test="position()=1">
							<tr>
							
								<td valign="top">
									<b>
										<xsl:value-of select="@label"/>
									</b>
								</td>
								<td valign="top">
									<xsl:apply-templates/>
								</td>
							</tr>
						</xsl:when>

						<xsl:otherwise>
							<tr>
								
								<td valign="top"></td>
								<td valign="top">
									<xsl:apply-templates/>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>

				<xsl:otherwise>

					<xsl:choose>
						<xsl:when test="position()=1">
							<tr>
								
								<td valign="top">
									<b>
										<xsl:text>Note: </xsl:text>
									</b>
								</td>
								<td>
									<xsl:apply-templates/>
								</td>
							</tr>
						</xsl:when>
		
						<xsl:otherwise>
							<tr>
								<td valign="top"></td>
								<td>
									<xsl:apply-templates/>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			<!--Closes each paragraph-->
		</xsl:for-each>
	</xsl:template>


	<!-- ****************************************************************** -->
	<!-- ARCHDESC Processing						-->
	<!-- Formats the top-level bioghist, scopecontent, phystech, odd, and	-->
	<!-- arrangement elements and creates a link back to the top of the	-->
	<!-- page after the display of the element.  Each HEAD element is also	-->
	<!-- given a generated ID so it can be linked to from the TOC.		-->
	<!-- ****************************************************************** -->

	<xsl:template match="archdesc/bioghist |
			archdesc/scopecontent |
			archdesc/phystech |
			archdesc/odd   |
			archdesc/arrangement">
		<xsl:if test="string(child::*)">	
			<xsl:apply-templates/>
			<hr/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="archdesc/bioghist/head  |
			archdesc/scopecontent/head |
			archdesc/arrangement/head |
			archdesc/phystech/head |
			archdesc/controlaccess/head |
			archdesc/odd/head">
		<h3><xsl:apply-templates/></h3>
	</xsl:template>

	<xsl:template match="archdesc/bioghist/p |
                        archdesc/bioghist/note/p |
			archdesc/scopecontent/p |
			archdesc/scopecontent/note/p |
			archdesc/arrangement/p |
			archdesc/arrangement/note/p |
			archdesc/phystech/p |
			archdesc/phystech/note/p |
			archdesc/controlaccess/p |
			archdesc/controlaccess/note/p |
			archdesc/odd/p |
			archdesc/odd/note/p">
		<p class="inv-1">
			<xsl:apply-templates/>
		</p>
	</xsl:template>


	<!-- The next three templates format a list within an arrangement
	statement whether it is directly within <archdesc> or embedded in
	<scopecontent>.-->
	
	<xsl:template match="archdesc/scopecontent/arrangement/list/head">
		<div style="margin-left:25pt">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="archdesc/arrangement/list/head">
		<div style="margin-left:25pt">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="archdesc/scopecontent/arrangement/list/item |
			     archdesc/arrangement/list/item">
		<div style="margin-left:50pt">
			<xsl:apply-templates/>
		</div>
	</xsl:template>



	<!-- ****************************************************************** -->
	<!-- RELATED MATERIAL, SEPARATED MATERIAL Processing			-->
	<!-- Formats the top-level related material elements by combining any 	-->
	<!-- related or separated materials elements. Test for RELATEDMATERIAL	-->
	<!-- or SEPARATEDMATERIAL elements with content; if present they are	-->
	<!-- combined.  Includes processing of any NOTE or LIST child elements.	-->
	<!-- ****************************************************************** -->
	
	<xsl:template name="archdesc-relatedmaterial">
		<xsl:if test="string(archdesc/relatedmaterial) or
		string(archdesc/*/relatedmaterial) or
		string(archdesc/separatedmaterial) or
		string(archdesc/*/separatedmaterial)">
			<h3>
				<b>
					<xsl:text>Related Material</xsl:text>
				</b>
			</h3>

			<xsl:apply-templates select="archdesc/separatedmaterial/p
				| archdesc/*/separatedmaterial/p
				| archdesc/separatedmaterial/blockquote
				| archdesc/separatedmaterial/note/p
				| archdesc/*/separatedmaterial/note/p
				| archdesc/separatedmaterial/list"/>

			<xsl:apply-templates select="archdesc/relatedmaterial/p
				| archdesc/relatedmaterial/blockquote
				| archdesc/*/relatedmaterial/p
				| archdesc/relatedmaterial/note/p
				| archdesc/*/relatedmaterial/note/p
				| archdesc/relatedmaterial/list"/>
			<hr/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="archdesc/relatedmaterial/p
		| archdesc/*/relatedmaterial/p
		| archdesc/separatedmaterial/p
		| archdesc/*/separatedmaterial/p
		| archdesc/relatedmaterial/note/p
		| archdesc/*/relatedmaterial/note/p
		| archdesc/separatedmaterial/note/p
		| archdesc/*/separatedmaterial/note/p
		| archdesc/separatedmaterial/list
		| archdesc/relatedmaterial/list">
		<p class="inv-1">
			<xsl:apply-templates/>
		</p>
	</xsl:template>


	<!-- ****************************************************************** -->
	<!-- Controlled Access headings 					-->
	<!-- Formats controlled access headings.  Does NOT handle recursive 	-->
	<!-- controlaccess elements. Does NOT require HEAD elements (makes for	-->
	<!-- easier tagging), instead captions are generated.  Subelements 	-->
	<!-- (genreform, etc) do not need to be alphabetized or sorted by type, -->
	<!-- the style sheet handles this.					-->
	<!-- ****************************************************************** -->
	
	<xsl:template match="archdesc/controlaccess">
		<xsl:if test="string(child::*)">
			<h3><b>Subject Headings</b></h3>
			<xsl:if test="persname | famname">
				<p class="subhead-1">Persons</p>
                                <p class="subhead-2">
				<xsl:for-each select="famname | persname">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:apply-templates/><br/>
				</xsl:for-each>
				</p>
			</xsl:if>
			<xsl:if test="corpname">
				<p class="subhead-1">Corporate Bodies</p>
                                <p class="subhead-2">
				<xsl:for-each select="corpname">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:apply-templates/><br/>
				</xsl:for-each>
				</p>
			</xsl:if>
			<xsl:if test="title">
				<p class="subhead-1">Associated Titles</p>
                                <p class="subhead-2">
				<xsl:for-each select="title">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:apply-templates/><br/>
				</xsl:for-each>
				</p>
			</xsl:if>
			<xsl:if test="subject">
				<p class="subhead-1">Subjects</p>
                                <p class="subhead-2">
				<xsl:for-each select="subject">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:apply-templates/><br/>
				</xsl:for-each>
				</p>
			</xsl:if>
			<xsl:if test="geogname">
				<p class="subhead-1">Places</p>
                                <p class="subhead-2">
				<xsl:for-each select="geogname">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:apply-templates/><br/>
				</xsl:for-each>
				</p>
			</xsl:if>
			<xsl:if test="genreform">
				<p class="subhead-1">Genres and Forms</p>
                                <p class="subhead-2">
				<xsl:for-each select="genreform">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:apply-templates/><br/>
				</xsl:for-each>
				</p>
			</xsl:if>
			<xsl:if test="occupation | function">
				<p class="subhead-1">Occupations</p>
                                <p class="subhead-2">
				<xsl:for-each select="occupation | function">
					<xsl:sort select="." data-type="text" order="ascending"/>
					<xsl:apply-templates/><br/>
				</xsl:for-each>
				</p>
			</xsl:if>
		</xsl:if>
	</xsl:template>


	<!-- ****************************************************************** -->
	<!-- Access and Use Restriction processing				-->
	<!-- Inclused processing of any NOTE child elements.			-->
	<!-- ****************************************************************** -->

	<xsl:template name="archdesc-restrict">
		<xsl:if test="string(archdesc/userestrict/*)
		or string(archdesc/accessrestrict/*)
		or string(archdesc/*/userestrict/*)
		or string(archdesc/*/accessrestrict/*)">
			<h3><b><xsl:text>Restrictions</xsl:text></b></h3>
                        
                        <p class="inv-1"> 
				<xsl:apply-templates select="archdesc/accessrestrict |
							     archdesc/*/accessrestrict"/>
			</p>
			<p class="inv-1">
				<xsl:apply-templates select="archdesc/userestrict | 
							     archdesc/*/userestrict"/>
			</p>
			<hr/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="archdesc/accessrestrict/head |
			     archdesc/userestrict/head">
		<b><xsl:apply-templates/></b>: 
	</xsl:template>


	<xsl:template match="archdesc/accessrestrict/p
	| archdesc/userestrict/p
	| archdesc/*/accessrestrict/p
	| archdesc/*/userestrict/p
	| archdesc/accessrestrict/note/p
	| archdesc/userestrict/note/p
	| archdesc/*/accessrestrict/note/p
	| archdesc/*/userestrict/note/p">
		<xsl:apply-templates/>
	</xsl:template>



	<!-- ****************************************************************** -->
	<!-- Other Admin Info processing					-->
	<!-- Inclused processing of any other administrative information	-->
	<!-- elements and consolidates them into one block under a common	-->
	<!-- heading, "Administrative Information."  If child elements contain	-->
	<!-- a HEAD element it is retained and used as the section title.	-->
	<!-- ****************************************************************** -->
	 
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
			<h3>
				<xsl:text>Administrative Information</xsl:text>
			</h3>
			<xsl:apply-templates select="archdesc/custodhist
				| archdesc/*/custodhist"/>
			<xsl:apply-templates select="archdesc/altformavail
				| archdesc/*/altformavail"/>
			<xsl:apply-templates select="archdesc/prefercite
				| archdesc/*/prefercite"/>
			<xsl:apply-templates select="archdesc/acqinfo
				| archdesc/*/acqinfo"/>
			<xsl:apply-templates select="archdesc/processinfo
				| archdesc/*/processinfo"/>
			<xsl:apply-templates select="archdesc/admininfo/appraisal
				| archdesc/*/appraisal"/>
			<xsl:apply-templates select="archdesc/admininfo/accruals
				| archdesc/*/accruals"/>

			<hr/>
		</xsl:if>
	</xsl:template>

        <xsl:template match="//eadheader/revisiondesc/list/item">
	     <xsl:choose>
                  <xsl:when test="not(position()=last())">
                       <xsl:apply-templates/>; 
                  </xsl:when>
		  <xsl:otherwise>
                       <xsl:apply-templates/>
                  </xsl:otherwise>
             </xsl:choose>             
        </xsl:template>

	
	<xsl:template match="custodhist/head
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
		<p class="subhead-1"><xsl:apply-templates/></p>
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
		<p class="subhead-2"><xsl:apply-templates/></p>
	</xsl:template>


	<!-- ****************************************************************** -->
	<!-- Other helpful elements processing					-->
	<!-- Processes OTHERFINDAID, BIBLIOGRAPHY, INDEX, FILEPLAN, PHYSTECH,	-->
	<!-- ORIGINALSLOC elements, including any NOT or HEAD child elements.	-->
	<!-- ****************************************************************** -->
		
	<xsl:template match="archdesc/otherfindaid
		| archdesc/*/otherfindaid
		| archdesc/bibliography
		| archdesc/*/bibliography
		| archdesc/originalsloc
		| archdesc/phystech">
			<xsl:apply-templates/>
			<hr/>
		</xsl:template>
		
	<xsl:template match="archdesc/otherfindaid/head
		| archdesc/*/otherfindaid/head
		| archdesc/bibliography/head
		| archdesc/*/bibliography/head
		| archdesc/fileplan/head
		| archdesc/*/fileplan/head
		| archdesc/phystech/head
		| archdesc/originalsloc/head">
		<h3>
			<b>
				<xsl:apply-templates/>
			</b>
		</h3>
	</xsl:template>

	<xsl:template match="archdesc/otherfindaid/p
		| archdesc/*/otherfindaid/p
		| archdesc/bibliography/p
		| archdesc/*/bibliography/p
		| archdesc/otherfindaid/note/p
		| archdesc/*/otherfindaid/note/p
		| archdesc/bibliography/note/p
		| archdesc/*/bibliography/note/p
		| archdesc/fileplan/p
		| archdesc/*/fileplan/p
		| archdesc/fileplan/note/p
		| archdesc/*/fileplan/note/p
		| archdesc/phystech/p
		| archdesc/phystech/note/p
		| archdesc/originalsloc/p
		| archdesc/originalsloc/note/p">
		<p class="inv-1">
			<xsl:apply-templates/>
		</p>
	</xsl:template>


	<xsl:template match="archdesc/index
		| archdesc/*/index">
			<table width="100%">
				<tr>
					<td width="5%"> </td>
					<td width="45%"> </td>
					<td width="50%"> </td>
				</tr>
				<tr>
					<td colspan="3">
						<h3>
							<b>
								<xsl:apply-templates select="head"/>
							</b>
						</h3>
					</td>
				</tr>
				<xsl:for-each select="p | note/p">
					<tr>
						<td></td>
						<td colspan="2">
							<xsl:apply-templates/>
						</td>
					</tr>
				</xsl:for-each>

				<!--Processes each index entry.-->
				<xsl:for-each select="indexentry">

				<!--Sorts each entry term.-->
					<xsl:sort select="corpname | famname | function | genreform | geogname | name | occupation | persname | subject"/>
					<tr>
						<td></td>
						<td>
							<xsl:apply-templates select="corpname | famname | function | genreform | geogname | name | occupation | persname | subject"/>
						</td>
						<!--Supplies whitespace and punctuation if there is a pointer
						group with multiple entries.-->

						<xsl:choose>
							<xsl:when test="ptrgrp">
								<td>
									<xsl:for-each select="ptrgrp">
										<xsl:for-each select="ref | ptr">
											<xsl:apply-templates/>
											<xsl:if test="preceding-sibling::ref or preceding-sibling::ptr">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</xsl:when>
							<!--If there is no pointer group, process each reference or pointer.-->
							<xsl:otherwise>
								<td>
									<xsl:for-each select="ref | ptr">
										<xsl:apply-templates/>
									</xsl:for-each>
								</td>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
					<!--Closes the indexentry.-->
				</xsl:for-each>
			</table>

			<hr/>
	</xsl:template>



	<!-- ****************************************************************** -->
	<!-- INVENTORY LIST PROCESSING						-->
	<!-- Now we get into the actual box/folder listings			-->
	<!-- ****************************************************************** -->


		<!-- ****************************************************************** -->
		<!-- This section of the stylesheet formats dsc, its head, and		-->
		<!-- other top-level elements						-->
		<!-- ****************************************************************** -->


	<xsl:template match="archdesc/dsc">
			<xsl:apply-templates/>
	</xsl:template>
	
	<!--Formats dsc/head and makes it a link target.-->
	<xsl:template match="dsc/head">
		<h3>
			<xsl:apply-templates/>
		</h3>
	</xsl:template>

	<xsl:template match="dsc/p | dsc/note/p">
		<p class="inv-1">
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	
		<!-- ****************************************************************** -->
		<!-- This section of the stylesheet contains named templates that are	-->
		<!-- used generically throughout the stylesheet.			-->
		<!-- ****************************************************************** -->

			<!-- This template formats the unitid, origination, unittitle, unitdate,-->
			<!-- and physdesc elements of components at all levels.  They appear on -->
			<!-- a separate line from other did elements. It is generic to all 	-->
			<!-- component levels.							-->

		<xsl:template name="component-did">
			<xsl:if test="unitid">
				<xsl:apply-templates select="unitid"/>
				<xsl:text>&#x20;</xsl:text>
			</xsl:if>


			<!-- Handles cases where unitdate is a child of unittitle or separate child of did.-->
			<xsl:choose>
				<!-- unitdate is a child of unittitle -->
				<xsl:when test="unittitle/unitdate">
					<xsl:apply-templates select="unittitle/text()| unittitle/*"/>
				</xsl:when>

				<!-- unitdate is not a child of untititle, date and title are processed 
				IN THE ORDER THEY OCCUR IN THE ORIGINAL, so we can have some series
				that are organized by date. -->
				<xsl:otherwise>
					<xsl:for-each select="unitdate|unittitle">
						<xsl:apply-templates/>
						<xsl:text>&#x20;</xsl:text>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>

			<!--Inserts abstract, on same line as date/title, separated with dash.-->
			<xsl:if test="abstract">
                       	 	- <xsl:apply-templates select="abstract"/>
				<xsl:text>&#x20;</xsl:text>
			</xsl:if>


			<!--Inserts origination and a space if it exists in the markup.-->
			<xsl:if test="origination">
				<xsl:if test="origination/@label">
					<br/><xsl:value-of select="origination/@label" />
				</xsl:if>
				<xsl:apply-templates select="origination"/>
				<xsl:text>&#x20;</xsl:text>
			</xsl:if>

                        <xsl:if test="../phystech">
                           (<xsl:value-of select="../phystech"/>)
                        </xsl:if>
        
	        	<xsl:apply-templates select="physdesc"/>
        
	        	<xsl:if test="physloc">
		        	<br/><xsl:apply-templates select="physloc"/>
        		</xsl:if>

		</xsl:template>


		<!-- These templates handle notes and tables within other elements.
                     Can be called from anywhere -->

		<xsl:template name="special-handling">
			<xsl:choose>
				<xsl:when test="self::head">
					<b><xsl:apply-templates/></b>
				</xsl:when>
				<xsl:when test="parent::note | self::note">
					<i><xsl:apply-templates/></i>
				</xsl:when>
				<xsl:when test="self::table">
					<xsl:call-template name="table"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:template>


		<xsl:template name="special-handling-did">
			<xsl:choose>
				<xsl:when test="parent::note">
					<i><xsl:apply-templates/></i>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:template>


                <!-- Adds parens around extent elements in inventory listing but not in archdesc/did -->
		<xsl:template match="extent">
			<xsl:choose>
				<xsl:when test="ancestor::c01|c02|co3|co4|co5|co6|c07|c08">
					(<xsl:apply-templates />)
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:template>


		<xsl:template match="lb">
			<br/>
		</xsl:template>


		<!-- This template handles the labeling of containers.  Note limitations on @type. -->

		<xsl:template name="container-label">
	
			<!--The next two variables define the set of container types that
			may appear in the first column of a two column container list.
			Add or subtract container types to fix institutional practice.-->
	
			<xsl:variable name="first" select="container[@type='Box' or 'Package' or 'SC' or @type='Oversize' or @type='Volume' or @type='Carton' or @type='Map-Case']"/>  
			<xsl:variable name="preceding" select="preceding::did[1]/container[@type='Box' or 'Package' or 'SC' or @type='Oversize' or @type='Volume' or @type='Carton' or @type='Map-Case']"/>
	
			<!--This variable defines the set of container types that
			may appear in the second column of a two column container list.
			Add or subtract container types to fix institutional practice.-->
	
			<xsl:variable name="second" select="container[@type='Folder' or @type='Frame' or @type='Tape' or @type='Page' or @type='Drawer']"/>
			<tr>
				<td valign="top">
					<b><font face="arial" size="-1"> 
						<xsl:if test="$first">
						   <xsl:value-of select="$first/@type"/>
						   <xsl:text> </xsl:text> 
						</xsl:if>
						<xsl:value-of select="$first"/>
						<xsl:if test="$second">
	                                           <xsl:if test="$first">
		                                      <xsl:text>, </xsl:text>
                                           	   </xsl:if>
						   <xsl:value-of select="$second/@type"/> 
						   <xsl:text> </xsl:text> 
						</xsl:if>
						<xsl:value-of select="$second"/>
					</font></b>
				</td>
				<xsl:variable name="c0parent" select="name(..)"/>
				<xsl:choose>
					<xsl:when test="$c0parent='c02'">
						<td></td>
						<td valign="top" colspan="10"><xsl:call-template name="component-did"/></td>
					</xsl:when>
					<xsl:when test="$c0parent='c03'">
						<td></td><td></td>
						<td valign="top" colspan="9"><xsl:call-template name="component-did"/></td>
					</xsl:when>
					<xsl:when test="$c0parent='c04'">
						<td></td><td></td><td></td>
						<td valign="top" colspan="8"><xsl:call-template name="component-did"/></td>
					</xsl:when>
					<xsl:when test="$c0parent='c05'">
						<td></td><td></td><td></td><td></td>
						<td valign="top" colspan="7"><xsl:call-template name="component-did"/></td>
					</xsl:when>
					<xsl:when test="$c0parent='c06'">
						<td></td><td></td><td></td><td></td><td></td>
						<td valign="top" colspan="6"><xsl:call-template name="component-did"/></td>
					</xsl:when>
					<xsl:when test="$c0parent='c07'">
						<td></td><td></td><td></td><td></td><td></td><td></td>
						<td valign="top" colspan="5"><xsl:call-template name="component-did"/></td>
					</xsl:when>
					<xsl:when test="$c0parent='c08'">
						<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
						<td valign="top" colspan="4"><xsl:call-template name="component-did"/></td>
					</xsl:when>
					<xsl:when test="$c0parent='c10'">
						<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
						<td valign="top" colspan="3"><xsl:call-template name="component-did"/></td>
					</xsl:when>
					<xsl:when test="$c0parent='c9'">
						<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
						<td valign="top" colspan="2"><xsl:call-template name="component-did"/></td>
					</xsl:when>
				</xsl:choose>
			</tr>
		</xsl:template>

		<!-- ****************************************************************** -->
		<!-- This section of the stylesheet creates an HTML table for each c01.	-->
		<!-- It then recursively processes each child component of the c01 by	-->
		<!-- calling a named template (next section) for that component level.	-->
		<!-- ****************************************************************** -->

	<xsl:template match="c01">
		<table class="c01-list">
			<tr>
				<td width="15%"></td>
				<td width="4%"></td>
				<td width="4%"></td>
				<td width="4%"></td>
				<td width="4%"></td>
				<td width="4%"></td>
				<td width="4%"></td>
				<td width="4%"></td>
				<td width="4%"></td>
				<td width="4%"></td>
				<td width="4%"></td>
				<td></td>
			</tr>
			<!-- If there should be miscellaneous c01 components that are
			actually file descriptions with associated container data,
			process them in the same way as a c02 is done.   This assumes
			that in these situations there is no c03.-->
			<xsl:choose>
				<xsl:when test="@level='file'">
					<xsl:call-template name="c02-level-container"/>	
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="c01-level"/>	
				</xsl:otherwise>
			</xsl:choose>
			
			<xsl:for-each select="c02">
				
				<xsl:choose>
					<xsl:when test="@level='subseries' or @level='series'">
						<xsl:call-template name="c02-level-subseries"/>	
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="c02-level-container"/>	
					</xsl:otherwise>	
				</xsl:choose>

				<xsl:for-each select="c03">
					<xsl:call-template name="c03-level"/>

					<xsl:for-each select="c04">
						<xsl:call-template name="c04-level"/>	

						<xsl:for-each select="c05">
							<xsl:call-template name="c05-level"/>	

							<xsl:for-each select="c06">
								<xsl:call-template name="c06-level"/>	

								<xsl:for-each select="c07">
									<xsl:call-template name="c07-level"/>	

									<xsl:for-each select="c08">
										<xsl:call-template name="c08-level"/>	

										<xsl:for-each select="c09">
											<xsl:call-template name="c09-level"/>	

											<xsl:for-each select="c10">
												<xsl:call-template name="c10-level"/>	
											</xsl:for-each><!--Closes c10-->
										</xsl:for-each><!--Closes c09-->
									</xsl:for-each><!--Closes c08-->
								</xsl:for-each><!--Closes c07-->
							</xsl:for-each><!--Closes c06-->
						</xsl:for-each><!--Closes c05-->
					</xsl:for-each><!--Closes c04-->
				</xsl:for-each><!--Closes c03-->
			</xsl:for-each><!--Closes c02-->
		</table>
	</xsl:template>

		<!-- ****************************************************************** -->
		<!-- This section of the stylesheet contains a separate named template	-->
		<!-- for each component level.  The contents of each is identical	-->
		<!-- except for the spacing that is inserted to create the proper 	-->
		<!-- column display in HTML for each level. 				-->
		<!-- ****************************************************************** -->

	<xsl:template name="c01-level">
		<xsl:for-each select="did">
			<tr>
				<td></td>
				<td colspan="11" class="c01-head">	
					<xsl:call-template name="component-did"/>
				</td>
			</tr>
			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td colspan="10" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each><!--Closes the did.-->

		<!--This template creates a separate row for each child of
		the listed elements.-->
		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan
			| userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note
			| descgrp/*">

			<xsl:for-each select="*">
				<tr>
					<td> </td>
					<td> </td>
					<td colspan="10">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<!--This template processes c02 elements that have associated containers, for
	example when c02 is a file.-->
	<xsl:template name="c02-level-container">
		<xsl:for-each select="did">

		<xsl:call-template name="container-label"/>

			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td> </td>
					<td colspan="9" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each><!--Closes the did.-->

		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan |
			userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note | descgrp/*">

			<xsl:for-each select="*">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="9">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<!--This template processes c02 level components that do not have
	associated containers, for example if the c02 is a subseries.  The
	various subelements are all indented one column to the right of c01.-->
	<xsl:template name="c02-level-subseries">
		<xsl:for-each select="did">
			<tr>
				<td valign="top"></td><td></td>
				<td valign="top" colspan="10" class="c02-head">
					<xsl:call-template name="component-did"/>
				</td>
			</tr>
			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td> </td>
					<td colspan="9" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan |
			descgrp/* | userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note">
			
			<xsl:for-each select="*">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="9">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="c03-level">
		<xsl:for-each select="did">

			<xsl:call-template name="container-label"/>

			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td colspan="8" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each><!--Closes the did.-->

		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan |
			userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note |
			descgrp/*">

			<xsl:for-each select="*">
				<tr>
					<td> </td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="8">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<!--This template processes c04 level components.-->
	<xsl:template name="c04-level">
		<xsl:for-each select="did">

			<xsl:call-template name="container-label"/>

			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td colspan="7" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each><!--Closes the did-->

		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan |
			descgrp/* | userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note">
	
				<xsl:for-each select="*">
				<tr>
					<td> </td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="7">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="c05-level">
		<xsl:for-each select="did">

			<xsl:call-template name="container-label"/>

			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td colspan="6" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each><!--Closes the did.-->

		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan |
			descgrp/* | userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note">

				<xsl:for-each select="*">
				<tr>
					<td> </td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="6">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<!--This template processes c06 components.-->
	<xsl:template name="c06-level">
		<xsl:for-each select="did">

			<xsl:call-template name="container-label"/>

			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td colspan="5" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each><!--Closes the did.-->

		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan |
			userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note |
			descgrp/*">
			
			<xsl:for-each select="*">
				<tr>
					<td> </td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="5">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="c07-level">
		<xsl:for-each select="did">

			<xsl:call-template name="container-label"/>


			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td colspan="4" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each> <!--Closes the did.-->

		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan |
			descgrp/* | userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note">

			<xsl:for-each select="*">
				<tr>
					<td> </td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="4">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="c08-level">
		<xsl:for-each select="did">

			<xsl:call-template name="container-label"/>

			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td colspan="3" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each><!--Closes the did.-->

		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan |
			descgrp/* | userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note">
			
			<xsl:for-each select="*">
				<tr>
					<td> </td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="3">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="c09-level">
		<xsl:for-each select="did">

			<xsl:call-template name="container-label"/>

			<xsl:for-each select="note/p | langmaterial | materialspec">
				<tr>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td> </td>
					<td colspan="2" valign="top">
						<xsl:call-template name="special-handling-did"/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:for-each><!--Closes the did.-->

		<xsl:for-each select="scopecontent | bioghist | arrangement | fileplan |
			descgrp/* | userestrict | accessrestrict | processinfo |
			acqinfo | custodhist | controlaccess/controlaccess | odd | note">
			
			<xsl:for-each select="*">
				<tr>
					<td> </td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="2">
						<xsl:call-template name="special-handling"/>
					</td>
				</tr>
			</xsl:for-each>			
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="c10-level">
		<xsl:for-each select="did">

			<xsl:call-template name="container-label"/>

		</xsl:for-each>	<!--Closes the did.-->
	</xsl:template>

</xsl:stylesheet>

   <!-- ******************************************************************* -->
   <!-- LINKS                                                               -->
   <!-- Converts REF, EXTREF, ARCHREF, DAO and PTR elements into HTML links -->
   <!-- Don't forget to add the callout to this template to the did         -->
   <!-- processing in your chosen dsc# style sheet!                         -->
   <!-- Known limitations: If you use an href value that has an             -->
   <!-- ampersand & in it, you will encounter problems.                     -->
   <!-- ******************************************************************* -->

   <xsl:template match="ref">
      <a href="#{@target}">
         <xsl:apply-templates/>
      </a>
   </xsl:template>


   <xsl:template match="extref | archref">
      <xsl:choose>
         <xsl:when test="self::extref[@show='new']">
            <a href="{@href}" target="_blank"><xsl:apply-templates/></a>
         </xsl:when>
         <xsl:otherwise>
            <a href="{@href}"><xsl:apply-templates/></a>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>


   <xsl:template match="ptr">
      <a href="{@href}">
         <xsl:value-of select="@href"/><xsl:apply-templates/>
      </a>
   </xsl:template>


   <xsl:template match="extptr">
      <xsl:choose>
         <xsl:when test="self::extptr[@show='embed']">
            <img src="{@xpointer}" alt="{@title}" align="{@altrender}"/>
         </xsl:when>
         <xsl:otherwise>
            <a href="{@xpointer}">"{@title}"</a>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>


    <xsl:template match="dao">
      <xsl:if test="preceding-sibling::dao">
          <br/>
	  </xsl:if>
      <xsl:choose>
         <xsl:when test="self::dao[@show='new']">
            <a href="{@href}" target="_blank">Digital object</a>
         </xsl:when>
         <xsl:otherwise>
            <a href="{@href}">Digital object</a>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
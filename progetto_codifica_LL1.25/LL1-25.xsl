<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" >


    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">

        <html>

            <head>
                <link rel="stylesheet" type="text/css" href="LL1-25.css" media="screen" />
                <script src="LL1-25.js"> </script>
                <title><xsl:value-of select="//tei:titleStmt/tei:title"/></title>
            </head>
            <body>
              <div class="navbar">
                <a href="#">Codifica lettera di Bellini a Filippo Santocanale - n.ro 25</a>
              </div>

              <div class="main">
                <br/>
                <span style="display: block; float: left; margin-top: 12px;">
                    <h2>Descrizione</h2>
                    <div>
                        <xsl:apply-templates select="//tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support"/>
                    </div>
                </span>

                <div id="immagini_lettera">
                    <xsl:apply-templates select="//tei:facsimile"/>
                </div>

                <div>
                    <xsl:apply-templates select="//tei:front" />
                </div>
                <h2 style="margin-bottom: 0px; height: 0px;">Corpo della lettera</h2>
                <div><xsl:apply-templates select="//tei:body/tei:div[@type='fronte-recto']" /></div>
                <div id="box_note">
                    <h4>Note</h4>
                    <ol>
                        <xsl:apply-templates select="//tei:div[@type='ann_notes']/tei:note" />
                    </ol>
                </div>



                <div>
                    <h4>Bibliografia</h4>
                    <ul>
                        <xsl:apply-templates select="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl" />
                    </ul>
                </div>
                <div>
                    <h4>Persone</h4>
                    <ul>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FS']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FS']" />
                             </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GSan']/@xml:id"/>
                                </xsl:attribute>

                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GSan']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FFlo']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FFlo']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LS']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='LS']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MM']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='MM']" />
                            </xsl:element>
                        </li>
                        <li>
                            <xsl:element name="a">
                                <xsl:attribute name="id">
                                    <xsl:value-of select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GR']/@xml:id"/>
                                </xsl:attribute>
                                <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GR']" />
                            </xsl:element>
                        </li>

                    </ul>
                </div>
                <div>
                    <h4>Luoghi</h4>
                    <ul>
                        <xsl:apply-templates select="//tei:div[@type='lists']/tei:listPlace/tei:place" />
                    </ul>
                </div>
              </div>
              <div class="footer">
                Codifica a cura di Angelica Zaccheria e Francesca Andreozzi
              </div>
            </body>

        </html>
    </xsl:template>

    <xsl:template match="*[@ref]">
        <xsl:apply-templates />
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <sub>(about)</sub>
        </xsl:element>

    </xsl:template>

    <xsl:template match="//tei:foreign">
        <xsl:apply-templates />
        <xsl:element name="i">
            <xsl:value-of select="."/>
        </xsl:element>

    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPlace/tei:place">
        <li>
            <xsl:variable name="list_place" select="tei:placeName/@ref"/>
            <xsl:element name="a">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:for-each select="*">
                    <xsl:choose>
                        <xsl:when test="tei:bibl">
                            pagina <xsl:value-of select="tei:bibl"/>: <xsl:value-of select="tei:p"/>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@source"/>
                                </xsl:attribute>
                                <sup>[nota]</sup>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:for-each>
                <xsl:element name="a">

                    <xsl:attribute name="href">
                        <xsl:value-of select="$list_place"/>
                    </xsl:attribute>
                    <sub>I fonte</sub>

                </xsl:element>
            </xsl:element>
        </li>

    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='VB']">
        <xsl:variable name="list" select="tei:persName[@role='composer']/tei:ref/@target"/>
        <xsl:for-each select="tei:persName">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        Compositore
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:element name="a">

            <xsl:attribute name="href">
                <xsl:value-of select="substring-before( $list, ' ' )"/>
            </xsl:attribute>
            <sub>I fonte</sub>

        </xsl:element>,
        <xsl:element name="a">

            <xsl:attribute name="href">
                <xsl:value-of select="substring-after( $list, ' ' )"/>
            </xsl:attribute>
            <sub>II fonte</sub>

        </xsl:element>
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:for-each select="tei:birth">
            <xsl:for-each select="*">
                <xsl:for-each select="*">
                    <xsl:value-of select="."/>
                    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
                </xsl:for-each>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        <xsl:for-each select="tei:death">
            <xsl:for-each select="*">
                <xsl:for-each select="*">
                    <xsl:value-of select="."/>
                    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
                </xsl:for-each>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FS']">
        <xsl:variable name="list2" select="tei:persName/tei:ref/@target"/>
        <xsl:for-each select="tei:persName">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>

        <xsl:element name="a">

            <xsl:attribute name="href">
                <xsl:value-of select="$list2"/>
            </xsl:attribute>
            <sub>fonte</sub>

        </xsl:element>
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>

        <xsl:for-each select="tei:birth">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        <xsl:for-each select="tei:death">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>



    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='GSan']">
        <xsl:for-each select="tei:persName">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
          fratello di Filippo Santocanale.
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:element name="a">

            <xsl:attribute name="href">
                <xsl:value-of select="tei:persName/tei:ref/@target"/>
            </xsl:attribute>
            <sub>fonte</sub>
        </xsl:element>.
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>

    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='FT']">
        <xsl:for-each select="tei:persName">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        possidente e produttore di seta
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        <xsl:element name="a">

            <xsl:attribute name="href">
                <xsl:value-of select="tei:persName/tei:ref/@target"/>
            </xsl:attribute>
            <sub>fonte</sub>
        </xsl:element>.
        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
        Marito di Giuditta Turina, fratello di Bartolomeo Turina e cognato di Rosa Bossi
    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='RBo']">
        <xsl:value-of select="tei:note/tei:p"/>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="tei:note/@source"/>
            </xsl:attribute>
            <sup>[nota]</sup>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listPerson/tei:person[@xml:id='BT']">
        <xsl:for-each select="tei:persName">
            <xsl:for-each select="*">
                <xsl:value-of select="."/>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            </xsl:for-each>
        </xsl:for-each>
        , marito di Rosa Bossi, fratello di Ferdinando Turina e cognato di Giuditta Turina
    </xsl:template>





    <xsl:template match="//tei:div[@type='lists']/tei:list[@type='terminology']">


        <xsl:for-each select="*">
                <xsl:if test="(position() mod 2)= 0">
                    <h5>
                    <xsl:element name="a">
                        <xsl:attribute name="id">
                            <xsl:value-of select="tei:term/@xml:id"/>
                        </xsl:attribute>
                        <xsl:value-of select="concat( current(), ':')"/>
                    </xsl:element>
                    </h5>
                </xsl:if>
                <xsl:if test="(position() mod 2)!= 0">
                    <xsl:if test="position()!=1">
                        <p><xsl:value-of select="concat( current(), '')"/></p>
                    </xsl:if>
                </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="//tei:div[@type='lists']/tei:listBibl">
        <xsl:for-each select="tei:bibl">

            <li>
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>

                    <xsl:for-each select="*">
                        <xsl:value-of select="current()"/>
                        <xsl:text>. </xsl:text>
                    </xsl:for-each>
                </xsl:element>
            </li>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="notes_template" match="//tei:ptr">
        <xsl:apply-templates/><xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="concat(@target, '')"/>
            </xsl:attribute>
            <sup>[nota]</sup>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//tei:div[@type='ann_notes']/tei:note">

        <xsl:element name="li">
            <xsl:attribute name="id">
                <xsl:value-of select="concat(@xml:id, '')"/>
            </xsl:attribute>

            <xsl:choose>
                <xsl:when test="@source">
                    <xsl:value-of select="tei:p"/>
                    Rimando alla
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat(@source, '')"/>
                        </xsl:attribute>
                        fonte (Seminara 2017)
                    </xsl:element>
                    , pagina <xsl:value-of select="tei:bibl/tei:citedRange"/>
                </xsl:when>
                <xsl:otherwise><xsl:value-of select="tei:p"/></xsl:otherwise>
            </xsl:choose>
        </xsl:element>

    </xsl:template>



    <xsl:template match="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl">
        <li>
            <xsl:element name="a">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:value-of select="tei:ref/tei:bibl/tei:author" />, anno <xsl:value-of select="tei:ref/tei:bibl/tei:date" />, pagina <xsl:value-of select="tei:ref/tei:bibl/tei:citedRange" />
            </xsl:element>
        </li>
    </xsl:template>


    <xsl:template match="//tei:front">
        <h2>Fronte verso</h2>
        <p>
            Sulla busta è indicato l'indirizzo del destinatario della lettera:
            <xsl:element name="a">
                <xsl:attribute name="name">
                    <xsl:value-of select="concat( 'ID', //tei:div[@type='destination']//tei:lb[1]/@facs)"/>
                </xsl:attribute>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;]]></xsl:text>
            </xsl:element>
            <i><xsl:value-of select="//tei:ab[@type='receiver']/tei:address/tei:addrLine[1]/tei:foreign[1]"/></i>
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            <i><xsl:value-of select="//tei:ab[@type='receiver']/tei:address/tei:addrLine[1]/tei:persName/*[1]"/></i>
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            <xsl:value-of select="//tei:ab[@type='receiver']/tei:address/tei:addrLine[1]/tei:persName/*[2]"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            <xsl:element name="a">
                <xsl:attribute name="name">
                    <xsl:value-of select="concat( 'ID', //tei:div[@type='destination']//tei:lb[2]/@facs)"/>
                </xsl:attribute>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;]]></xsl:text>
            </xsl:element>
            <i><xsl:value-of select="//tei:div[@type='destination']//tei:addrLine[2]/tei:foreign"/></i>
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
            <xsl:value-of select="//tei:div[@type='destination']//tei:addrLine[2]/tei:placeName"/>.
            <br/>
            Sulla busta è presente anche il timbro di partenza:
            <xsl:element name="a">
                <xsl:attribute name="name">
                    <xsl:value-of select="concat( 'ID', //tei:div[@type='sent']/tei:ab/@facs)"/>
                </xsl:attribute>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;]]></xsl:text>
            </xsl:element>
            <xsl:value-of select="//tei:stamp[@type='postmark']/tei:mentioned/tei:placeName"/>
        </p>
    </xsl:template>

    <xsl:template match="//tei:body/tei:div[@type='fronte-recto']">

        <div>
            <p style="line-height: 95%; width: 1328px;">
                <xsl:call-template name="facs_template_body"> </xsl:call-template>
                <xsl:call-template name="supplied_template"> </xsl:call-template>
            </p>
        </div>
    </xsl:template>

    <xsl:template name="sic_corr_template" match="//tei:choice[@xml:id='sic_corr']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:sic, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:sic, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:corr, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:corr, '')"/>
            </xsl:element>
        </select>
    </xsl:template>

    <xsl:template name="orig_reg_template" match="//tei:choice[@xml:id='orig_reg']">
        <select class="choice_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:orig, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:orig, '')"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:reg, '')"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:reg, '')"/>
            </xsl:element>
        </select>
    </xsl:template>

    <xsl:template name="abbr_template" match="//tei:expan">
        <select class="expan_class">
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:abbr[1], tei:abbr[2])"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:abbr[1], tei:abbr[2])"/>
            </xsl:element>
            <xsl:element name="option">
                <xsl:attribute name="value">
                    <xsl:value-of select="concat(tei:abbr[1], tei:ex, tei:abbr[2])"/>
                </xsl:attribute>
                <xsl:value-of select="concat(tei:abbr[1], tei:ex, tei:abbr[2])"/>
            </xsl:element>
        </select>
    </xsl:template>

    <xsl:template name="supplied_template" match="//tei:supplied">
        <xsl:if test="position() != last()">
            <mark class="supplied_class"><xsl:value-of select="."/></mark>
        </xsl:if>
    </xsl:template>

    <xsl:template name="facs_template_body" match="*[@facs]">
        <xsl:apply-templates/><br /><xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:value-of select="concat('ID',@facs)"/>
            </xsl:attribute>
            <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text>
        </xsl:element>
    </xsl:template>


    <xsl:template match="//tei:respStmt">
        <h3><xsl:value-of select="tei:resp"/></h3>
        <ul>
            <xsl:for-each select="tei:name">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="//tei:titleStmt">
        <h2><xsl:value-of select="tei:title"/></h2>
        <div><xsl:apply-templates select="tei:respStmt" /></div>

    </xsl:template>

    <xsl:template match="//tei:editionStmt">
        <h2><xsl:value-of select="tei:edition"/></h2>
        <h3><xsl:value-of select="tei:edition/date"/></h3>
        <div><xsl:apply-templates select="tei:respStmt" /></div>

    </xsl:template>

    <xsl:template match="//tei:publicationStmt">
        <h2><xsl:value-of select="tei:publisher"/></h2>
        Licenza: <a href="https://creativecommons.org/licenses/by/4.0/"><xsl:value-of select="tei:availability/tei:licence"/></a>
    </xsl:template>

    <xsl:template match="//tei:sourceDesc">
        <div>
            <h2>Collocazione</h2>
            <p>
               <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:country"/>, <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:settlement"/>; <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:altIdentifier/tei:idno"/>.
               <xsl:value-of select="//tei:adminInfo/tei:note"/>
            </p>
        </div>
    </xsl:template>

    <xsl:template match="//tei:support">
        <ul>
            <li><a> <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text>Materiale: <xsl:value-of select="tei:material"/> </a></li>
            <!-- Sigilli e timbri -->
            <xsl:element name="li">
                <xsl:element name="a">
                    <xsl:attribute name="name">
                    <xsl:value-of select="concat('ID',//tei:stamp/tei:hi/@facs)"/>
                    </xsl:attribute>
                    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;]]></xsl:text>
                </xsl:element>
                <xsl:element name="a">
                    <xsl:attribute name="name">
                    <xsl:value-of select="concat('ID',//tei:stamp/tei:hi[2]/@facs)"/>
                    </xsl:attribute>
                    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;]]></xsl:text>
                </xsl:element>
                <xsl:element name="a">
                    <xsl:attribute name="name">
                    <xsl:value-of select="concat('ID',//tei:stamp/tei:hi[3]/@facs)"/>
                    </xsl:attribute>
                    <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;]]></xsl:text>
                </xsl:element>
              <xsl:value-of select="concat('Sigilli e timbri: ',tei:stamp)"/>
            </xsl:element>
            <!-- Condizioni: -->
            <xsl:element name="li">
              <xsl:element name="a">
                <xsl:attribute name="name">
                  <xsl:value-of select="concat('ID',//tei:support/tei:p[1]/tei:hi/@facs)"/>
                </xsl:attribute>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text>
              </xsl:element>
              <xsl:element name="a">
                <xsl:attribute name="name">
                  <xsl:value-of select="concat('ID',//tei:support/tei:p[1]/tei:hi[2]/@facs)"/>
                </xsl:attribute>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text>
              </xsl:element>

              <xsl:value-of select="concat('Condizioni: ',//tei:support/tei:p[1])"/>
            </xsl:element>



            <li> <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text>Dimensioni: <xsl:value-of select="//tei:extent/tei:dimensions/tei:height"/> x <xsl:value-of select="//tei:extent/tei:dimensions/tei:width"/> </li>
            <li> <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text>Piegatura: <xsl:value-of select="//tei:foliation"/> </li>
            <!-- Annotazioni: -->
            <xsl:element name="li">
              <xsl:element name="a">
                <xsl:attribute name="name">
                  <xsl:value-of select="concat('ID',//tei:handNote/@facs)"/>
                </xsl:attribute>
                <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text>

              </xsl:element>
              <xsl:value-of select="concat('Annotazioni: ',//tei:handNote/tei:p)"/>
            </xsl:element>

        </ul>
    </xsl:template>

    <xsl:template match="//tei:facsimile">
        <xsl:for-each select="tei:surface/tei:graphic">
            <xsl:variable name="position" select="position()"/>
            <xsl:element name="img">
                <xsl:attribute name="usemap">
                    <xsl:value-of select="concat('#map',$position)"/>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('imglettera' , $position) "/>
                </xsl:attribute>
                <xsl:attribute name="src">
                    <xsl:value-of select="current()/@url "/>
                </xsl:attribute>
                <xsl:element name="map">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('map',$position)"/>
                    </xsl:attribute>

                    <xsl:for-each select="parent::tei:surface/tei:zone">
                        <xsl:element name="area">
                            <xsl:attribute name="class">
                                <xsl:value-of select="concat(parent::tei:surface/@xml:id, '_class')"/>
                            </xsl:attribute>
                            <xsl:attribute name="id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:attribute name="shape">
                                <xsl:value-of select="concat('rect','')"/>
                            </xsl:attribute>
                            <xsl:attribute name="coords">
                                <xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/>
                            </xsl:attribute>
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat('#ID#', @xml:id)"/>
                            </xsl:attribute>
                            <xsl:attribute name="onclick">
                                <xsl:value-of select="concat( 'resetLine(&quot;ID#', @xml:id, '&quot;)' )"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

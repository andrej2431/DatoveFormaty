<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ex="http://example.org/xsd" exclude-result-prefixes="ex">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/ex:database">
        <html>
            <head>
                <title>Transformed HTML</title>
            </head>
            <body>
                <h1>Továrny</h1>
                <xsl:apply-templates select="ex:továrny/ex:továrna"/>
                <xsl:apply-templates select="ex:zaměstnanci"/>
                <xsl:apply-templates select="ex:automaty"/>
                <xsl:apply-templates select="ex:sladkosti"/>
                <xsl:apply-templates select="ex:suroviny"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="ex:továrny/ex:továrna">
        <h3>Továrna</h3>
         <dl>
            <dt>Název</dt>
            <dd><xsl:value-of select="ex:název"/></dd>
            <dt>Rýchlost Výroby</dt>
            <dd><xsl:value-of select="ex:rýchlost-výroby"/></dd>
            <dt>Vyrábí</dt>
            <dd>
                <xsl:for-each select="ex:vyrábí/ex:sladkost-id">
                    <xsl:variable name="sladkost-id" select="."/>
                    <xsl:variable name="sladkost" select="/ex:database/ex:sladkosti/ex:sladkost[ex:id = $sladkost-id]"/>
                    <xsl:value-of select="$sladkost/ex:název"/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </dd>
            <dt>Zaměstnává</dt>
            <dd>
                <xsl:for-each select="ex:zaměstnává/ex:zaměstnanec-id">
                    <xsl:variable name="zaměstnanec-id" select="."/>
                    <xsl:variable name="zaměstnanec" select="/ex:database/ex:zaměstnanci/ex:zaměstnanec[ex:id = $zaměstnanec-id]"/>
                    <xsl:value-of select="$zaměstnanec/ex:jméno"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$zaměstnanec/ex:příjmení"/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </dd>
            <dt>Automaty</dt>
            <dd>
                <xsl:for-each select="/ex:database/ex:automaty/ex:automat[ex:nachází-se-v/ex:tovarna-id = current()/ex:id]">
                    <xsl:variable name="automat-id" select="ex:id"/>
                    <xsl:variable name="automat" select="."/>
                    <xsl:value-of select="$automat/ex:název"/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </dd>
         </dl>
    </xsl:template>

    <xsl:template match="ex:zaměstnanci">
        <h2>Zaměstnanci</h2>
        <table border="1">
            <tr>
                <th>Jméno</th>
                <th>Příjmení</th>
                <th>Titul</th>
                <th>Zaměstnáný v továrně</th>
            </tr>
            <xsl:apply-templates select="ex:zaměstnanec">
                <xsl:sort select="ex:příjmení"/>
                <xsl:sort select="ex:jméno"/>
            </xsl:apply-templates>
        </table>
    </xsl:template>

    <xsl:template match="ex:zaměstnanec">
        <tr>
            <td><xsl:value-of select="ex:jméno"/></td>
            <td><xsl:value-of select="ex:příjmení"/></td>
            <td><xsl:value-of select="ex:tituly/ex:titul"/></td>
            <td>
                <xsl:value-of select="/ex:database/ex:továrny/ex:továrna[ex:zaměstnává/ex:zaměstnanec-id = current()/ex:id]/ex:název"/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="ex:automaty">
        <h2>Automaty</h2>
        <table border="1">
            <tr>
                <th>Název</th>
                <th>Kapacita</th>
                <th>Šířkaířka</th>
                <th>Délka</th>
                <th>Výška</th>
                <th>Nachází se v továrně</th>
                <th>Počet sladkostí</th>
            </tr>
            <xsl:apply-templates select="ex:automat"/>
        </table>
    </xsl:template>

    <xsl:template match="ex:automat">
        <tr>
            <td><xsl:value-of select="ex:název"/></td>
            <td><xsl:value-of select="ex:kapacita"/></td>
            <td><xsl:value-of select="ex:šířka"/></td>
            <td><xsl:value-of select="ex:délka"/></td>
            <td><xsl:value-of select="ex:výška"/></td>
            <td>
                <xsl:variable name="tovarna-id" select="ex:nachází-se-v/ex:tovarna-id"/>
                <xsl:variable name="tovarna" select="/ex:database/ex:továrny/ex:továrna[ex:id = $tovarna-id]"/>
                <xsl:value-of select="$tovarna/ex:název"/>
            </td>
            <td>
                <xsl:value-of select="count(ex:nabízí/ex:sladkost-id)"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="ex:suroviny">
        <h2>Suroviny</h2>
        <table border="1">
            <tr>
                <th>Název</th>
                <th>Cena za kg</th>
                <th>Alergeny</th>
            </tr>
            <xsl:apply-templates select="ex:surovina"/>
        </table>
    </xsl:template>

    <xsl:template match="ex:surovina">
        <tr>
            <td><xsl:value-of select="ex:název"/></td>
            <td><xsl:value-of select="ex:cena-za-kg"/></td>
            <td>
                <xsl:apply-templates select="ex:obsahujeAlergen/ex:alergen-id">
                    <xsl:sort select="."/>
                </xsl:apply-templates>
            </td>

        </tr>
    </xsl:template>

    <xsl:template match="ex:alergen-id">
                    <xsl:variable name="alergen-id" select="."/>
                    <xsl:variable name="alergen" select="/ex:database/ex:alergeny/ex:alergen[ex:id = $alergen-id]"/>
                    <xsl:value-of select="$alergen/ex:název"/>
                    <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>

    <xsl:template match="ex:sladkosti">
        <h2>Sladkosti</h2>
        <table border="1">
            <tr>
                <th>Název</th>
                <th>Výrábě se</th>
                <th>Suroviny</th>
                <th>Alergeny</th>
                <th>Hmotnost</th>
                <th>Šířka</th>
                <th>Délka</th>
                <th>Výška</th>
                <th>Objem</th>
            </tr>
            <xsl:apply-templates select="ex:sladkost"/>
        </table>
    </xsl:template>

    <xsl:template match="ex:sladkost">
        <tr>
            <td><xsl:value-of select="ex:název"/></td>
            <td>
                <xsl:value-of select="/ex:database/ex:továrny/ex:továrna[ex:vyrábí/ex:sladkost-id = current()/ex:id]/ex:název"/>
            </td>
            <td>
                <xsl:for-each select="ex:obsahujeSurovinu/ex:surovina-id">
                    <xsl:variable name="surovina-id" select="."/>
                    <xsl:variable name="surovina" select="/ex:database/ex:suroviny/ex:surovina[ex:id = $surovina-id]"/>
                    <xsl:value-of select="$surovina/ex:název"/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </td>
            <td>
                <xsl:apply-templates select="ex:obsahujeSurovinu/ex:surovina-id">
                    <xsl:sort select="."/>
                </xsl:apply-templates>
            </td>
            <td><xsl:value-of select="ex:hmotnost"/></td>
            <td><xsl:value-of select="ex:šířka"/></td>
            <td><xsl:value-of select="ex:délka"/></td>
            <td><xsl:value-of select="ex:výška"/></td>
            <td>
                <xsl:value-of select="ex:délka * ex:šířka * ex:výška"/>
            </td>            
        </tr>
    </xsl:template>

    <xsl:template match="ex:surovina-id">
        <xsl:value-of select="."/>
        <xsl:variable name="alergen" select="/ex:database/ex:alergeny/ex:alergen[ex:id = current()]/ex:název"/>
        <br>
    </xsl:template>
</xsl:stylesheet>


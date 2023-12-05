<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xmlns:fn="http://www.w3.org/2005/xpath-functions"
		xmlns:ex="http://example.org/xsd" exclude-result-prefixes="ex">
    <xsl:output method="text" encoding="UTF-8" />
    
		<xsl:template match="/ex:database">
			#Prefixy
			@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
			@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
			@prefix ex: &lt;http://example.org/vocabulary/&gt; .
			@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
	
			# Data
			<xsl:apply-templates/>
    </xsl:template>

		<xsl:template match="ex:zaměstnanci">
			### Zaměstnanci
			<xsl:apply-templates select="ex:zaměstnanec"/>
		</xsl:template>

		<xsl:template match="ex:zaměstnanec">
			ex:<xsl:value-of select="ex:id"/> a ex:Zaměstnanec;
				ex:jméno &quot;<xsl:value-of select="ex:jméno"/>&quot;@cs;
				ex:příjmení &quot;<xsl:value-of select="ex:příjmení"/>&quot;@cs;
				<xsl:for-each select="ex:tituly/ex:titul">ex:tituly &quot;<xsl:value-of select="text()"/>&quot;@cs;</xsl:for-each>
				.
		</xsl:template>

		<xsl:template match="ex:továrny">
			### Továrne
			<xsl:apply-templates select="ex:továrna"/>
		</xsl:template>

		<xsl:template match="ex:továrna">
			<xsl:variable name="id-tovarny" select="ex:id"/>
			ex:<xsl:value-of select="ex:id"/> a ex:Továrna;
				ex:názevTovárny &quot;<xsl:value-of select="ex:název"/>&quot;@cs;
				ex:rychlostVýroby &quot;<xsl:value-of select="ex:rýchlost-výroby"/>&quot;^^xsd:integer;
				.
				<xsl:for-each select="ex:zaměstnává/ex:zaměstnanec-id"><!--
				-->ex:<xsl:value-of select="$id-tovarny"/> ex:zaměstnává ex:<xsl:value-of select="text()"/>.
				</xsl:for-each>
				<xsl:for-each select="ex:vyrábí/ex:sladkost-id"><!--
				-->ex:<xsl:value-of select="$id-tovarny"/> ex:vyrábí ex:<xsl:value-of select="text()"/>.
				</xsl:for-each>
		</xsl:template>
        
		<xsl:template match="ex:sladkosti">
			### Sladkosti
			<xsl:apply-templates select="ex:sladkost"/>
		</xsl:template>

		<xsl:template match="ex:sladkost">
			<xsl:variable name="id-sladkosti" select="ex:id"/>
			ex:<xsl:value-of select="ex:id"/> a ex:Sladkost;
				ex:názevSladkosti &quot;<xsl:value-of select="ex:název"/>&quot;@cs;
				ex:hmotnost &quot;<xsl:value-of select="ex:hmotnost"/>&quot;^^xsd:integer;
				ex:šířkaSladkosti &quot;<xsl:value-of select="ex:šířka"/>&quot;^^xsd:integer;
				ex:délkaSladkosti &quot;<xsl:value-of select="ex:délka"/>&quot;^^xsd:integer;
				ex:výškaSladkosti &quot;<xsl:value-of select="ex:výška"/>&quot;^^xsd:integer;
				.
				<xsl:for-each select="ex:obsahujeSurovinu/ex:surovina-id"><!--
				-->ex:<xsl:value-of select="$id-sladkosti"/> ex:obsahujeSurovinu ex:<xsl:value-of select="text()"/>.
				</xsl:for-each>
		</xsl:template>
		
		<xsl:template match="ex:automaty">
			### Automaty
			<xsl:apply-templates select="ex:automat"/>
		</xsl:template>

		<xsl:template match="ex:automat">
			<xsl:variable name="id-automatu" select="ex:id"/>
			ex:<xsl:value-of select="ex:id"/> a ex:Automat;
				ex:názevAutomatu &quot;<xsl:value-of select="ex:název"/>&quot;@cs;
				ex:kapacita &quot;<xsl:value-of select="ex:kapacita"/>&quot;^^xsd:integer;
				ex:šířkaAutomatu &quot;<xsl:value-of select="ex:šířka"/>&quot;^^xsd:integer;
				ex:délkaAutomatu &quot;<xsl:value-of select="ex:délka"/>&quot;^^xsd:integer;
				ex:výškaAutomatu &quot;<xsl:value-of select="ex:výška"/>&quot;^^xsd:integer;
				.
				<xsl:for-each select="ex:nabízí/ex:sladkost-id"><!--
				-->ex:<xsl:value-of select="$id-automatu"/> ex:nabízí ex:<xsl:value-of select="text()"/>.
				</xsl:for-each>
				<xsl:for-each select="ex:nachází-se-v/ex:tovarna-id"><!--
				-->ex:<xsl:value-of select="$id-automatu"/> ex:nacházíSeV ex:<xsl:value-of select="text()"/>.
				</xsl:for-each>
		</xsl:template>

		<xsl:template match="ex:suroviny">
			### Suroviny
			<xsl:apply-templates select="ex:surovina"/>
		</xsl:template>

		<xsl:template match="ex:surovina">
			<xsl:variable name="id-suroviny" select="ex:id"/>
			ex:<xsl:value-of select="ex:id"/> a ex:Surovina;
				ex:názevSuroviny &quot;<xsl:value-of select="ex:název"/>&quot;@cs;
				ex:cenaZaKg &quot;<xsl:value-of select="ex:cena-za-kg"/>&quot;^^xsd:decimal;
				.
				<xsl:for-each select="ex:obsahujeAlergen/ex:alergen-id"><!--
				-->ex:<xsl:value-of select="$id-suroviny"/> ex:obsahujeAlergen ex:<xsl:value-of select="text()"/>.
				</xsl:for-each>
		</xsl:template>

		<xsl:template match="ex:alergeny">
			### Alergeny
			<xsl:apply-templates select="ex:alergen"/>
		</xsl:template>

		<xsl:template match="ex:alergen">
			ex:<xsl:value-of select="ex:id"/> a ex:Alergen;
				ex:názevAlergenu &quot;<xsl:value-of select="ex:název"/>&quot;@cs;
				ex:číslo &quot;<xsl:value-of select="ex:číslo"/>&quot;^^xsd:integer;
				.
		</xsl:template>


    <xsl:template match="text()"/>
</xsl:stylesheet>


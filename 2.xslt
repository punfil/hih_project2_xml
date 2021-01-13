<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<html lang="pl">
			<head>
				<link rel="stylesheet" href="./style.css" />
				<meta charset="utf-8"/>
				<meta name="description" content="Strona fanów laptopów i akcesoriów IBM ThinkPad" />
				<meta name="generator" content="MS Visual Studio" />
				<meta name="viewport" content="width=device-width"/>
			</head>
			<body>
				<div class="center_div">
					<h1>
						Oto wszystkie modele
					</h1>
					<img class="laptop_miniature" src="IBM_logo2.jpeg" title="IBM ThinkPad Logo"/>
					<h1>
						jakie udało mi się zgromadzić
					</h1>
					<xsl:apply-templates select="laptopy_ibm_thinkpad/serie_liczbowe"/>
					<xsl:apply-templates select="laptopy_ibm_thinkpad/serie_literowe"/>
					<xsl:apply-templates select="laptopy_ibm_thinkpad/serie_epoki_Lenovo"/>
				</div>
				<footer>
					<xsl:apply-templates select="laptopy_ibm_thinkpad/dodatkowe"/>
				</footer>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="serie_liczbowe">
		<div class="table_div">
			<h1>Seria 300</h1>
			<xsl:apply-templates select="./seria_300"/>
			<h1>Seria 500</h1>
			<xsl:apply-templates select="./seria_500"/>
			<h1>Seria 600</h1>
			<xsl:apply-templates select="./seria_600"/>
			<h1>Seria 700</h1>
			<xsl:apply-templates select="./seria_700"/>
		</div>
	</xsl:template>
	<xsl:template match="serie_literowe">
		<div class="table_div">
			<h1>Seria T</h1>
			<xsl:apply-templates select="./seria_T"/>
			<h1>Seria R</h1>
			<xsl:apply-templates select="./seria_R"/>
			<h1>Seria A</h1>
			<xsl:apply-templates select="./seria_A"/>
			<h1>Seria Z</h1>
			<xsl:apply-templates select="./seria_Z"/>
			<h1>Seria i</h1>
			<xsl:apply-templates select="./seria_i"/>
			<h1>Seria X</h1>
			<xsl:apply-templates select="./seria_X"/>
		</div>
	</xsl:template>
	<xsl:template match="serie_epoki_Lenovo">
		<div class="table_div">
			<h1>Seria SL</h1>
			<xsl:apply-templates select="./seria_SL"/>
		</div>
	</xsl:template>
	<xsl:template match="dodatkowe">
		<p>
			Autor:
			<xsl:apply-templates select="text()"/> <br ></br>
			Wszystkie prawa zastrzeżone
		</p>
	</xsl:template>
	<xsl:template match="laptop">
		<div class="tabela_align_div">
			<table class="tabela_laptop">
				<tr>
					<xsl:apply-templates select="./model"/>
				</tr>
				<tr>
					<xsl:apply-templates select="./procesor"/>
				</tr>
				<tr>
					<xsl:apply-templates select="./RAM"/>
				</tr>
				<tr>
					<xsl:apply-templates select="./karta_graficzna"/>
				</tr>
				<tr>
					<xsl:apply-templates select="./dysk"/>
				</tr>
				<tr>
					<xsl:apply-templates select="./system_operacyjny"/>
				</tr>
				<tr>
					<xsl:apply-templates select="./pakiet_biurowy"/>
				</tr>
				<tr>
					<xsl:apply-templates select="./matryca"/>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="model">
		<th colspan="2">
			Model: IBM ThinkPad <xsl:value-of select="."/>
		</th>
	</xsl:template>
	<xsl:template match="procesor">
		<th>
			Procesor:
		</th>
		<td>
			<xsl:value-of select="./producent"/>
			<xsl:value-of select="./rodzina"/>
			<xsl:if test="@MMX = 'Tak'">
				with MMX
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:value-of select="./czestotliwosc"/>
		</td>
	</xsl:template>
	<xsl:template match="RAM">
		<th>RAM:</th>
		<td>
			<xsl:value-of select="./pojemnosc"/>
			<xsl:value-of select="./pojemnosc/@jednostka"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="./typ"/>
		</td>
	</xsl:template>
	<xsl:template match="karta_graficzna">
		<th>Karta graficzna:</th>
		<td>
			<xsl:value-of select="./producent"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="./model_gpu"/>
		</td>
	</xsl:template>
	<xsl:template match="dysk">
		<th>Dysk:</th>
		<td>
			<xsl:value-of select="./pojemnosc"/>
			<xsl:value-of select="./pojemnosc/@jednostka"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="@rodzaj_zlacza"/>
		</td>
	</xsl:template>
	<xsl:template match="system_operacyjny">
		<xsl:call-template name="programy"/>
	</xsl:template>
	<xsl:template match="pakiet_biurowy">
		<xsl:call-template name="programy"/>
	</xsl:template>
	<xsl:template name="programy">
		<xsl:variable name="nazwa_przed" select="substring-before(name(.),'_')"/>
		<xsl:variable name="nazwa_po" select="substring-after(name(.),'_')"/>
		<xsl:variable name="pierwsza_litera_przed" select="upper-case(substring($nazwa_przed,1,1))"/>
		<xsl:variable name="pierwsza_litera_po" select="upper-case(substring($nazwa_po,1,1))"/>
		<th>
			<xsl:value-of select="concat($pierwsza_litera_przed, substring($nazwa_przed,2), ' ', $pierwsza_litera_po, substring($nazwa_po,2), ':')"/>
		</th>
		<td>
			<xsl:value-of select="."/>
			<xsl:text> </xsl:text>
			<xsl:if test="@jezyk = 'Polski'">
				PL
			</xsl:if>
			<xsl:if test="@jezyk = 'Angielski'">
				ENG
			</xsl:if>
		</td>
	</xsl:template>
	<xsl:template match="matryca">
		<th>Matryca:</th>
		<td>
			<xsl:value-of select="./rozdzielczosc/ilosc_pikseli_poziom"/>
			<xsl:text>x</xsl:text>
			<xsl:value-of select="./rozdzielczosc/ilosc_pikseli_pion"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="./wielkosc"/>
			<xsl:text>'</xsl:text>
		</td>
	</xsl:template>
	<xsl:template match="dodatkowe_informacje">
		<div class="dodatkowe">
			<xsl:element name="img">
				<xsl:attribute name="src">
					<xsl:value-of select="./zdjecie/@source"/>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="name(..)"/>
				</xsl:attribute>
				<xsl:attribute name="class">laptop_miniature</xsl:attribute>
			</xsl:element>
			<xsl:apply-templates select="./link"/>

		</div>
	</xsl:template>
	<xsl:template match="link">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@source"/>
			</xsl:attribute>
			<xsl:attribute name="target">
				_blank
			</xsl:attribute>
			Więcej informacji o tej serii laptopów!
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
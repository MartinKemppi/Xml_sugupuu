<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">
		Kuvame 1. inimese nimi:
		<xsl:value-of select="sugupuu/inimene[1]/nimi"/>
		<h1>Kõik inimeste nimed:</h1>
		<table>
			<tr>
				<td>
					<xsl:for-each select="sugupuu/inimene">
						<td>
							<xsl:value-of select="nimi"/>,
							<xsl:value-of select="synniaasta"/>,
							<xsl:value-of select="synnikoht"/>
							<ul>
								Lapsed:
								<xsl:for-each select="lapsed/inimene">
									<li>
										<xsl:value-of select="nimi"/>,
										<xsl:value-of select="synniaasta"/>,
										<xsl:value-of select="synnikoht"/>
									</li>
								</xsl:for-each>
							</ul>
						</td>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
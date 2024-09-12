<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">

		<h2>
			H1: Kuvada iga reisi sihtkoht pealkirjana, kasutades h1.</h2>
		<table>
			<tr>
				<th>Kuupäev</th>
				<th>Alguskoht</th>
				<th>Lõppkoht</th>
				<th>Lennujaam</th>
				<th>Transport</th>
				<th>Hind</th>
				<th>Ettevõtte</th>
			</tr>
			<xsl:for-each select="reisid/reis">
				<tr>
					<td>
						<xsl:value-of select="kuupaev"/>
					</td>
					<td>
						<h1>
							<xsl:value-of select="suund/alguskoht"/>
						</h1>
					</td>
					<td>
						<h1>
							<xsl:value-of select="suund/loppkoht"/>
						</h1>
					</td>
					<td>
						<xsl:value-of select="lennujaam"/>
					</td>
					<td>
						<xsl:value-of select="transport"/>
					</td>
					<td>
						<xsl:value-of select="hind"/>
					</td>
					<td>
						<xsl:value-of select="ettevote"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

		<h2>H2: Komponendid peavad olema kuvatud täpploeteluna (ul).</h2>
		<xsl:for-each select="reisid/reis">
						<ul>
							Alguskoht<li>
								<xsl:value-of select="suund/alguskoht"/>
							</li>
							Lõppkoht<li>
								<xsl:value-of select="suund/loppkoht"/>
							</li>
							Lennujaam<li>
								<xsl:value-of select="lennujaam"/>
							</li>
							Transport<li>
								<xsl:value-of select="transport"/>
							</li>
							Hind<li>
								<xsl:value-of select="hind"/>
							</li>
							Ettevõtte<li>
								<xsl:value-of select="ettevote"/>
							</li>						
						</ul>
			</xsl:for-each>
		

		<h2>H3: Kolmanda taseme struktuuri andmed tuleb kuvada kollasel taustal.</h2>
		<table>
			<tr>
				<th>Kuupäev</th>
				<th>Alguskoht</th>
				<th>Lõppkoht</th>
				<th>Lennujaam</th>
				<th>Transport</th>
				<th>Hind</th>
				<th>Ettevõtte</th>
			</tr>
			<xsl:for-each select="reisid/reis">
				<tr>
					<td>
						<xsl:value-of select="kuupaev"/>
					</td>
					<td bgcolor="yellow">
						<xsl:value-of select="suund/alguskoht"/>
					</td>
					<td bgcolor="yellow">
						<xsl:value-of select="suund/loppkoht"/>
					</td>
					<td>
						<xsl:value-of select="lennujaam"/>
					</td>
					<td>
						<xsl:value-of select="transport"/>
					</td>
					<td>
						<xsl:value-of select="hind"/>
					</td>
					<td>
						<xsl:value-of select="ettevote"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

		<h2>H4: Lisada uus veerg, kui hind on vähem kui 500 siis tuleks sinna kirjutada odav ja kui on suurem siis kallis.</h2>
		<table>
			<tr>
				<th>Kuupäev</th>
				<th>Alguskoht</th>
				<th>Lõppkoht</th>
				<th>Lennujaam</th>
				<th>Transport</th>
				<th>Hind</th>
				<th>Ettevõtte</th>
				<th>Pakkumine</th>
			</tr>
			<xsl:for-each select="reisid/reis">
				<tr>
					<td>
						<xsl:value-of select="kuupaev"/>
					</td>
					<td>
						<xsl:value-of select="suund/alguskoht"/>
					</td>
					<td>
						<xsl:value-of select="suund/loppkoht"/>
					</td>
					<td>
						<xsl:value-of select="lennujaam"/>
					</td>
					<td>
						<xsl:value-of select="transport"/>
					</td>
					<td>
						<xsl:value-of select="hind"/>
					</td>
					<td>
						<xsl:value-of select="ettevote"/>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="hind &gt;= 500">
								Kallis
							</xsl:when>
							<xsl:otherwise>
								Odav
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:for-each>
		</table>

		<h2>H5: Kuva iga reisi kogumaksumuse, liites transport, majutuse, ekskursioonide ja muude kulude hinnad kokku.</h2>
		<table>
			<tr>
				<th>Kuupäev</th>
				<th>Alguskoht</th>
				<th>Lõppkoht</th>
				<th>Lennujaam</th>
				<th>Transport</th>
				<th>Hind</th>
				<th>Ettevõtte</th>
				<th>Koguhind</th>
			</tr>
			<xsl:for-each select="reisid/reis">
				<tr>
					<td>
						<xsl:value-of select="kuupaev"/>
					</td>
					<td>
						<xsl:value-of select="suund/alguskoht"/>
					</td>
					<td>
						<xsl:value-of select="suund/loppkoht"/>
					</td>
					<td>
						<xsl:value-of select="lennujaam"/>
					</td>
					<td>
						<xsl:value-of select="transport"/>
					</td>
					<td>
						<xsl:value-of select="hind"/>
					</td>
					<td>
						<xsl:value-of select="ettevote"/>
					</td>
					<td>
						<xsl:value-of select="hind"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

		<h2>H6: Filtreeri ja kuva ainult need reisid, mis pakkuvad reisi Skippad</h2>
		<table>
			<tr>
				<th>Kuupäev</th>
				<th>Alguskoht</th>
				<th>Lõppkoht</th>
				<th>Lennujaam</th>
				<th>Transport</th>
				<th>Hind</th>
				<th>Ettevõtte</th>
			</tr>
			<xsl:for-each select="reisid/reis[contains(ettevote, 'Skippad')]">
				<tr>
					<td>
						<xsl:value-of select="kuupaev"/>
					</td>
					<td>
						<xsl:value-of select="suund/alguskoht"/>
					</td>
					<td>
						<xsl:value-of select="suund/loppkoht"/>
					</td>
					<td>
						<xsl:value-of select="lennujaam"/>
					</td>
					<td>
						<xsl:value-of select="transport"/>
					</td>
					<td>
						<xsl:value-of select="hind"/>
					</td>
					<td>
						<xsl:value-of select="ettevote"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

		<h2>H7: Sorteeri kõik reisid vastavalt hinnangule (nt kliendihinnang, kui selline väli on olemas XML-is, kui ei ole kasuta teine numbriline väli).</h2>
		<table>
			<tr>
				<th>Kuupäev</th>
				<th>Alguskoht</th>
				<th>Lõppkoht</th>
				<th>Lennujaam</th>
				<th>Transport</th>
				<th>Hind</th>
				<th>Ettevõtte</th>
			</tr>
			<xsl:for-each select="reisid/reis">
				<xsl:sort select="hind" order="ascending"/>
				<tr>
					<td>
						<xsl:value-of select="kuupaev"/>
					</td>
					<td>
						<xsl:value-of select="suund/alguskoht"/>
					</td>
					<td>
						<xsl:value-of select="suund/loppkoht"/>
					</td>
					<td>
						<xsl:value-of select="lennujaam"/>
					</td>
					<td>
						<xsl:value-of select="transport"/>
					</td>
					<td>
						<xsl:value-of select="hind"/>
					</td>
					<td>
						<xsl:value-of select="ettevote"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

		<h2>H8: Kuva kõik xml andmed tabelina, kus read on üle rea erineva värviga.</h2>
		<table id="h8">
			<tr>
				<th>Kuupäev</th>
				<th>Alguskoht</th>
				<th>Lõppkoht</th>
				<th>Lennujaam</th>
				<th>Transport</th>
				<th>Hind</th>
				<th>Ettevõtte</th>
			</tr>
			<xsl:for-each select="reisid/reis">
				<tr>
					<td>
						<xsl:value-of select="kuupaev"/>
					</td>
					<td>
						<xsl:value-of select="suund/alguskoht"/>
					</td>
					<td>
						<xsl:value-of select="suund/loppkoht"/>
					</td>
					<td>
						<xsl:value-of select="lennujaam"/>
					</td>
					<td>
						<xsl:value-of select="transport"/>
					</td>
					<td>
						<xsl:value-of select="hind"/>
					</td>
					<td>
						<xsl:value-of select="ettevote"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

	</xsl:template>
</xsl:stylesheet>

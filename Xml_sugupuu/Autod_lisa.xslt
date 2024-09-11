<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes" encoding="utf-8"/>

    <xsl:template match="/">
		<h3>Autode üldkogus xml jadas</h3>
		Kasutame count() funktsiooni
		<br></br>		
		<xsl:value-of select="count(/autod/auto)"/>
		<h3>1. Trüki välja (eralda komaga) auto registrinumbri numbrite osa</h3>
		kasutame substring() eraldamiseks
		<br></br>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(registrinumber, 1, 3)"/>, 
		</xsl:for-each>

		<h3>2. Trüki välja (eralda komaga) omaniku nime viimane täht</h3>
		kasutame substring() eraldamiseks
		<br></br>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(omanik, string-length(omanik), 1)"/>,
		</xsl:for-each>

		<h3>3. Auto omanikud, mis sisaldavad A täht</h3>
		
		
		<h3>4. Leia, mitme auto registrimärgi numbritest viimane on 2</h3>
		<xsl:for-each select="autod/auto">
			<xsl:if test="substring(registrinumber, string-length(registrinumber), 1) = '2'">
				<li>
					<xsl:value-of select="registrinumber"/>
				</li>
			</xsl:if>
		</xsl:for-each>


		<h3>5. Teata iga registrinumbri puhul, millises kuus auto ülevaatus (nt: 5 on mai +2 tuleb ülevaatus)</h3>

		<h3>Autode üldkogus xml jadas</h3>
		Kasutame count() funktsiooni, mis leiab autod v_aastaga 2000
		<br></br>
		<xsl:value-of select="count(/autod/auto[v_aasta=2000])"/>
		
		<h3>Auto reg. numbrid mis algavad 2:</h3>
		<br></br>
		Kasutame starts-with funktsiooni
		<ul>
		<xsl:for-each select="autod/auto[starts-with(registrinumber, '2')]">
			<xsl:sort select="v_aasta" order="descending"/>
			<li>
				<xsl:value-of select="concat(mark,', ', registrinumber, ', ', v_aasta)"/>
			</li>
		</xsl:for-each>
		</ul>

		<h2>Autod tabelina</h2>
		<table>
			<tr>
				<th>Reg Number</th>
				<th>Mark</th>
				<th>Väljastamise aasta</th>
				<th>Omanik</th>
				<th>Ülevaatuse kuu</th>
			</tr>
			<xsl:for-each select="autod/auto">
				<tr>
					<td>
						<xsl:value-of select="registrinumber"/>
					</td>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="v_aasta"/>
					</td>
						<xsl:choose>
							<xsl:when test="contains(omanik, 'a')">
								<td bgcolor="yellow">
									<xsl:value-of select="omanik"/>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td>
									<xsl:value-of select="omanik"/>
								</td>
							</xsl:otherwise>
						</xsl:choose>
					<xsl:choose>
						<xsl:when test="(number(substring(registrinumber, 3, 1)) + 2) >= 9">
							<td bgcolor="red">
								<xsl:value-of select="number(substring(registrinumber, 3, 1)) + 2"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td bgcolor="green">
								<xsl:value-of select="number(substring(registrinumber, 3, 1)) + 2"/>
							</td>
						</xsl:otherwise>
					</xsl:choose>
				</tr>
			</xsl:for-each>
		</table>


		<h3>Luca harjutus 1: Lisa uus veerg, kus kuvatakse tekst "Uus" (kui auto on uuem kui 2015) või "Vana" (kui auto on 2015 või vanem).</h3>

		<table>
			<tr>
				<th>Reg Number</th>
				<th>Mark</th>
				<th>Väljastamise aasta</th>
				<th>Omanik</th>
				<th>Ülevaatuse kuu</th>
				<th>Seisukord</th>
			</tr>
			<xsl:for-each select="autod/auto">
				<tr>
					<td>
						<xsl:value-of select="registrinumber"/>
					</td>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="v_aasta"/>
					</td>
					<xsl:choose>
						<xsl:when test="contains(omanik, 'a')">
							<td bgcolor="yellow">
								<xsl:value-of select="omanik"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:value-of select="omanik"/>
							</td>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="(number(substring(registrinumber, 3, 1)) + 2) >= 9">
							<td bgcolor="red">
								<xsl:value-of select="number(substring(registrinumber, 3, 1)) + 2"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td bgcolor="green">
								<xsl:value-of select="number(substring(registrinumber, 3, 1)) + 2"/>
							</td>
						</xsl:otherwise>
					</xsl:choose>
					<td>
						<xsl:choose>
							<xsl:when test="v_aasta &gt;= 2015">
								Uus
							</xsl:when>
							<xsl:otherwise>
								Vana
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:for-each>
		</table>


		<h3>Luca harjutus 2: Muuda tabeli ridade värvi nii, et autod, mille vaasta on 2010 või hilisem, kuvatakse sinise taustaga.</h3>
		<table>
			<tr>
				<th>Reg Number</th>
				<th>Mark</th>
				<th>Väljastamise aasta</th>
				<th>Omanik</th>
				<th>Ülevaatuse kuu</th>
				<th>Seisukord</th>
			</tr>
			<xsl:for-each select="autod/auto">
				<tr>
					<td>
						<xsl:value-of select="registrinumber"/>
					</td>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="v_aasta"/>
					</td>
					<xsl:choose>
						<xsl:when test="contains(omanik, 'a')">
							<td bgcolor="yellow">
								<xsl:value-of select="omanik"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:value-of select="omanik"/>
							</td>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="(number(substring(registrinumber, 3, 1)) + 2) >= 9">
							<td bgcolor="red">
								<xsl:value-of select="number(substring(registrinumber, 3, 1)) + 2"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td bgcolor="green">
								<xsl:value-of select="number(substring(registrinumber, 3, 1)) + 2"/>
							</td>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="v_aasta &gt;= 2010">
							<td bgcolor="blue">Uus</td>
						</xsl:when>
						<xsl:otherwise>
							<td>Vana</td>
						</xsl:otherwise>
					</xsl:choose>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>

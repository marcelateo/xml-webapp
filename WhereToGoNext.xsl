<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
    <html>
        <head>
		
            <title>Welcome to where to go next</title>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <style>
            	XML {
					display:none;
				}
				body {
					font-family: Arial, Helvetica, sans-serif;
					background-color: #FFFFFF;
					margin: 5px;
					text-align: left;
					color:#ffe6e6 ;
				}
				h2 {
					font-size: 140%;
					color: #000000;
					margin-top: 10px;
				}
				p {
					font-size: 80%;
					color: #000000;
				}
				table {
					background-color: #ff99ff;
					border-color: #000000;
					border-width: thin;
					border-collapse: collapse;
					width: 75%;
				}
				th {
					border-color: #000000;
					font-size: 120%;
					color: #000000;
				}
				td {
					border-color: #000000;
					font-size: 100%;
					color: #000000;
					padding: 5px;
				}
				img {
					float: left;
					margin-left: 10px;
					margin-right: 10px;
					border: 0px;
				}
				.indent {
					margin-left: 78px;
				}
			</style>
        </head>
            <body>
		    <form method="post" action="edittool.asp">
                <h2><img src= "https://www.logodesignlove.com/images/classic/next-logo-paul-rand.jpg" alt="WhereToGoNext" width="58" height="100"/> Welcome to Where to go next</h2>
                <p>Select if you are traveling by yourself or enjoying someones company. All resorts are VIP ready-to-go packages and just dates are able to be changed.</p>
                <table id="menuplace" border="1" class="indent">
                    <thead>
                        <tr>
                            <th colspan="3">Below are the options for next season</th>
                        </tr>
                        <tr>
                            <th>Packages for</th>
                            <th>Places</th>
                            <th>type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/mainplaces/section">
                          <tr>
                                <td colspan="3">
                                    <xsl:value-of select="@name" />
                                </td>
                            </tr>
                            <xsl:for-each select="place">
                                <tr>
                                    <xsl:value-of select="name" />
                                    <td align="center">
                                        <input name="item0" type="checkbox" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="item" />
                                    </td>
                                    <td align="right">
                                        <xsl:value-of select="type" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table>
		     <br />
  <input type="submit" id="btn_sub" name="btn_sub" value="Submit" />
  <input type="reset" id="btn_res" name="btn_res" value="Reset" />
  </form>
                        </body>
        </html>
</xsl:template>
</xsl:transform>

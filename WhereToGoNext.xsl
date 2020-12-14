<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
    <html>
        <head>
		
            <title>Welcome to where to go next</title>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <link rel="stylesheet" href="css/WhereToGoNext.css"></link>>
            <script type="text/javascript" src="js/WhereToGoNext.js"></script>>
        </head>
            <body>
	            <h2><img src= "img/next-logo.jpg" alt="WhereToGoNext" width="58" height="100"/> Welcome to Where to go next</h2>
                <p>Select if you are traveling by yourself or enjoying someones company. All resorts are VIP ready-to-go packages and just dates are able to be changed.</p>
                <p1>*The prices below for the packages cover hotel half meal and city tour.</p1>
                <table id="menuPlace" border="1" class="indent">
                    <thead>
                        <tr>
                            <th colspan="3">Below are the options for next season</th>
                        </tr>
                        <tr>
                            <th>Packages for</th>
                            <th>Places</th>
                            <th>price</th>
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
                                        <xsl:value-of select="price" />
                                   </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table>
                <form class="indent">
                    <p>
                        <input type="button" name="btnCalcBill" value="Calculate Bill" id="calcBill" />
                Total: €
                <input type="text" name="txtBillAmt" /></p>
                </form>
 
                
            </body>
        </html>
    </xsl:template>
</xsl:transform>
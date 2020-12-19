<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
                <table id="menuPlants" border="1" class="indent">
                    <thead>
                        <tr>
                            <th colspan="4" style="font-size:18px">BELOW ARE THE OPTIONS FOR NEXT SEASON</th>
                        </tr>
                        <tr>
                            <th>Select</th>
                            <th>Item</th>
                            <th>Specie</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/catalog/section">
                          <tr>
                                <td colspan="4">
                                    <xsl:value-of select="@name" />
                                </td>
                            </tr>
                            <xsl:for-each select="plant">
                                <tr>
                                    <xsl:value-of select="name" />
                                    <td align="center">
                                        <input name="item0" type="checkbox" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="item" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="specie" />
                                    </td>
                                    <td align="right">
                                        <xsl:value-of select="price" />
                                   </td>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>

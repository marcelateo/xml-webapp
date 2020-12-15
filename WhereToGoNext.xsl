<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
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
    </xsl:template>
</xsl:stylesheet>
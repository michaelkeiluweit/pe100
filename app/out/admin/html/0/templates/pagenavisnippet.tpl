[{ if $pagenavi}]<table cellspacing="0" cellpadding="0" border="0" width="760">
    <tr>
        <td class="pagenavigation" height="20" valign="middle" width="33%" align="left">
        [{ if $pagenavi->backlink != ""}]
            <a href="[{ $pagenavi->backlink}]" target="list" class="pagenavigation">zur&uuml;ck</a>&nbsp;<img src="[{$shop->imagedir}]/arrow_left.gif" width="9" height="9" alt="" border="0" align="absmiddle">
        [{ /if}]
        </td>
        <td class="pagenavigation" height="20" valign="middle" width="33%" align="middle">
        Seite [{ $pagenavi->actpage}] von [{ $pagenavi->pages}] ([{ $listsize }] Einträge)
        </td>
        <td class="pagenavigation" height="20" valign="middle" align="right">
        [{ if $pagenavi->nextlink != ""}]
            <img src="[{$shop->imagedir}]/arrow_right.gif" width="9" height="9" alt="" border="0" align="absmiddle">&nbsp;<a href="[{ $pagenavi->nextlink}]" target="list" class="pagenavigation">weiter</a>
        [{ /if}]
        </td>
    </tr>
    </table>
[{ /if}]

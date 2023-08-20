<td align="left" class="detailcontent" width="220">
	[{ if $crossselllist || $similarlist }]
    <span class="detailheader">Weitere interessante Angebote :</span><br>
    <br>
	[{/if}]
	[{ if $crossselllist }]
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td class="detailsales" align="left" height="15">&nbsp;&nbsp;Kennen Sie schon... ?</td>
		</tr>
		[{ assign var="blSep" value=""}]
		[{foreach from=$crossselllist item=crossproduct}]  
		    [{ if $blSep == "y"}]
				<tr>
				<td height="5"></td>
				</tr>
				<tr>
				<td height="1" bgcolor="#BEBEBE"></td>
				</tr>
				<tr>
				<td height="5"></td>
				</tr>
		    [{/if}]
			<tr>
			<td>
			[{include file="crosssellproductItem.tpl" product=$crossproduct}]
			</td>
			</tr>
	    [{ assign var="blSep" value="y"}]
		[{/foreach}] 
		</table>
	[{/if}]

	[{ if $similarlist }]
	    <br>
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td class="detailsales" align="left" height="15">&nbsp;&nbsp;&Auml;hnliche Produkte :</td>
		</tr>
		[{ assign var="blSep" value=""}]
		[{foreach from=$similarlist item=simproduct}]  
		    [{ if $blSep == "y"}]
				<tr>
				<td height="5"></td>
				</tr>
				<tr>
				<td height="1" bgcolor="#BEBEBE"></td>
				</tr>
				<tr>
				<td height="5"></td>
				</tr>
		    [{/if}]
			<tr>
			<td>
			[{include file="crosssellproductItem.tpl" product=$simproduct}]
			</td>
			</tr>
	    [{ assign var="blSep" value="y"}]
		[{/foreach}] 
		</table>
	[{/if}]

    </td>

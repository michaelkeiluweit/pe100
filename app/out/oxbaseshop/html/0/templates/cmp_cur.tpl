[{ assign var="blSep" value=""}]
[{foreach from=$oxcmp_cur item=cur}]
    [{ if $blSep == "y"}]
    &nbsp;|&nbsp;
    [{/if}]
    <a href="[{ $cur->link }]" class="[{if $cur->selected}]currency_activ[{else}]currency[{/if}]">[{ $cur->name }]</a>
    [{ assign var="blSep" value="y"}]
[{/foreach}]

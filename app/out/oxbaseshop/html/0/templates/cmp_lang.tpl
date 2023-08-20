[{ assign var="blSep" value=""}]
[{foreach from=$oxcmp_lang item=lang}]
    [{ if $blSep == "y"}]
    &nbsp;|&nbsp;
    [{/if}]
    <a href="[{ $lang->link }]" class="[{if $lang->selected}]language_activ[{else}]language[{/if}]">[{ $lang->name }]</a>
    [{ assign var="blSep" value="y"}]
[{/foreach}]

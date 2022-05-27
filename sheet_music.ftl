<#--
    Template Name: music
-->
<#include "header.ftl">
<@header title="${sheet.title!} - ${blog_title!}">
	<#if (settings.patternimg!true) && (sheet.thumbnail?? && sheet.thumbnail!='')>
        <div class="pattern-center-blank"></div>
		<div class="pattern-center">
			<div class="pattern-attachment-img">
				<img data-src="${sheet.thumbnail!}" src="https://cdn.jsdelivr.net/gh/LIlGG/cdn@1.0.2/img/svg/loader/orange.progress-bar-stripe-loader.svg" class="lazyload" onerror="imgError(this, IMG_Type.DEFAULT)">
			</div>
			<header class="pattern-header">
				<h1 class="entry-title">${sheet.title!}</h1>
			</header>
		</div>
	<#else>
		<div class="blank"></div>
		<style>
            .toc-container {
                top: 210px;
            }
		</style>
	</#if>
</@header>

	<article>
        <#if !(settings.patternimg!true) || (!(settings.links_patternimg?? && settings.links_patternimg!='') && !(is_sheet?? && sheet.thumbnail?? && sheet.thumbnail!=''))>
            <header class="entry-header">
                <h1 class="entry-title">${sheet.title!}</h1>
            </header><!-- .entry-header -->
        </#if>
        <#if is_sheet??>
            ${sheet.formatContent!}
        </#if>

        <#if (metas.toc?boolean)!true>
            <div class="toc-container">
                <div class="toc"></div>
            </div>
        </#if>

        <div class="entry-content">
        > The neway to music .

        <div id="aplayer-music" style="z-index: 100;" class="aplayer aplayer-withlrc aplayer-withlist" data-id="40419567" data-server="netease" data-type="playlist" data-fixed="false" data-preload="auto" data-order="list" data-theme="orange">
        </div>
    </article>
<#include "footer.ftl">
<script>
new APlayer({
    container: document.getElementById('aplayer-music')
})
</script>
<@footer />

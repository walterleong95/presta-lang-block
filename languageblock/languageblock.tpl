{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- Block languages module -->
{if count($languages) > 1}
<div id="languages_block_top pull-right hidden-xs">
	<div id="countries">
	{* @todo fix display current languages, removing the first foreach loop *}
{foreach from=$languages key=k item=language name="languages"}
	{if $language.iso_code == $lang_iso}
		<p class="selected_language">
			{* <img src="{$img_lang_dir}{$language.id_lang}.jpg" alt="{$language.iso_code|escape:'html':'UTF-8'}" width="34" height="31" /> *}
			<span class="selected_language_title hide_xs">{$language.iso_code|upper}</span>
			<span class="caret"></span>
		</p>
	{/if}
{/foreach}
		<ul id="first-languages" class="countries_ul">
		{foreach from=$languages key=k item=language name="languages"}
			<li {if $language.iso_code == $lang_iso}class="selected_language"{else}class="non_selected_language"{/if}>
			{if $language.iso_code != $lang_iso}
				{assign var=indice_lang value=$language.id_lang}
				{if isset($lang_rewrite_urls.$indice_lang)}
					<a href="{$lang_rewrite_urls.$indice_lang|escape:htmlall}" title="{$language.name|escape:'html':'UTF-8'}" rel="alternate" hreflang="{$language.iso_code|escape:'html':'UTF-8'}">
				{else}
					<a href="{$link->getLanguageLink($language.id_lang)|escape:htmlall}" title="{$language.name|escape:'html':'UTF-8'}" rel="alternate" hreflang="{$language.iso_code|escape:'html':'UTF-8'}">

				{/if}
			{/if}
					<div>
						<img src="{$img_lang_dir}{$language.id_lang}.jpg" alt="{$language.iso_code|escape:'html':'UTF-8'}" width="16" height="11" />
						{if $language.iso_code == $lang_iso}
						<span class="selected_language_title hide_xs pull-right">{$language.name}</span>
						{else}
						<span class="non_selected_language_title hide_xs pull-right">{$language.name}</span>
						{/if}
					</div>
			{if $language.iso_code != $lang_iso}
				</a>
			{/if}
			</li>
		{/foreach}
		</ul>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function () {
	$("#countries").click(function(){
		if($(this).hasClass("countries_hover")){
			$(this).removeClass("countries_hover");
			$(".countries_ul").removeClass("countries_ul_hover");
		}else{
			$(this).addClass("countries_hover");
			$(".countries_ul").addClass("countries_ul_hover");
		}
	});
	$("#setCurrency").click(function(){
		if($("#countries").hasClass("countries_hover")){
			$("#countries").removeClass("countries_hover");
			$(".countries_ul").removeClass("countries_ul_hover");
		}
	});

	$("#user_info_acc").click(function(){
		if($("#countries").hasClass("countries_hover")){
			$("#countries").removeClass("countries_hover");
			$(".countries_ul").removeClass("countries_ul_hover");
		}
	});

	$(".nav_toggle").click(function(){
		if($("#countries").hasClass("countries_hover")){
			$("#countries").removeClass("countries_hover");
			$(".countries_ul").removeClass("countries_ul_hover");
		}
	});

	$("ul#first-languages li:not(.selected_language)").mouseover(function(){
		$(this).find(".non_selected_language_title").css("color", "white");
	});

	$("ul#first-languages li:not(.selected_language)").mouseout(function(){
		$(this).find(".non_selected_language_title").css("color", "");
	});

});
</script>
{/if}
<!-- /Block languages module -->
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

<!-- Block currencies module -->
<script type="text/javascript">
$(document).ready(function () {
	$("#setCurrency").click(function(){
		if($(this).hasClass("currencies_hover")){
			$(this).removeClass("currencies_hover");
			$(".currencies_ul").removeClass("currencies_ul_hover");
		}else{
			$(this).addClass("currencies_hover");
			$(".currencies_ul").addClass("currencies_ul_hover");
		}	
	});

    $("#countries").click(function(){
        if($("#setCurrency").hasClass("currencies_hover")){
            $("#setCurrency").removeClass("currencies_hover");
            $(".currencies_ul").removeClass("currencies_ul_hover");
        }
    });

    $("#user_info_acc").click(function(){
        if($("#setCurrency").hasClass("currencies_hover")){
            $("#setCurrency").removeClass("currencies_hover");
            $(".currencies_ul").removeClass("currencies_ul_hover");
        }
    });

    $(".nav_toggle").click(function(){
        if($("#setCurrency").hasClass("currencies_hover")){
            $("#setCurrency").removeClass("currencies_hover");
            $(".currencies_ul").removeClass("currencies_ul_hover");
        }
    });

	{* $("#setCurrency").mouseout(function(){
		
	}); *}

	$('ul#first-currencies li:not(.selected)').css('opacity', 0.3);
	$('ul#first-currencies li:not(.selected)').hover(function(){
		$(this).css('opacity', 1);
	}, function(){
		$(this).css('opacity', 0.3);
	});
});
</script>

<div id="currencies_block_top">
	<form id="setCurrency" action="{$request_uri}" method="post">
		<p class="selected_currency">
			<input type="hidden" name="id_currency" id="id_currency" value=""/>
			<input type="hidden" name="SubmitCurrency" value="" />
			<span class="selected_currency_title">{$blockcurrencies_sign}</span>
			<span class="caret"></span>
		</p>
		<ul id="first-currencies" class="currencies_ul">
			{foreach from=$currencies key=k item=f_currency}
				<li {if $cookie->id_currency == $f_currency.id_currency}class="selected"{/if}>
					<a href="javascript:setCurrency({$f_currency.id_currency});" title="{$f_currency.name}" rel="nofollow">{$f_currency.name}</a>
				</li>
				{* {$f_currency|var_dump} *}
			{/foreach}
		</ul>
	</form>
</div>
<!-- /Block currencies module -->

{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Site-wide header; includes journal logo, user menu, and primary menu
 *
 *}

{strip}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
	{/if}

	{capture assign="homeUrl"}
		{url page="index" router=$smarty.const.ROUTE_PAGE}
	{/capture}
{/strip}

{capture assign="journalLogo"}
	{if $displayPageHeaderLogo}
		<img class="journal-logo" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"
		     {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"
		     {else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if}>
	{elseif $displayPageHeaderTitle}
		<div class="journal-logo-text">{$displayPageHeaderTitle|escape}</div>
	{else}
		<img class="journal-logo" src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}">
	{/if}
{/capture}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}
	{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}
{/if}
{include file="frontend/components/headerHead.tpl"}
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Libre+Bodoni:ital,wght@0,400..700;1,400..700&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	
<body>
<header>
	<div id="header">
		<div class="container">
			<div class="row">
				<div class="col-6 col-md-6">
					<div class="logo-wrap">
						<a href="{$homeUrl}"><img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle|escape}"></a>
						<div class="logo-text">Anti-Corruption Studies and Research</div>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="auth-wrap">
						<div class="user-nav-wrap">
							{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user"}
						</div>
						{include file="frontend/components/languageSwitcher.tpl" id="languageNav"}
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-lg-9">
					<div class="nav-wrap">
						{capture assign="primaryMenu"}
							{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
						{/capture}
						{$primaryMenu}
					</div>
				</div>
				<div class="col-12 col-lg-3">
					<div class="header-line-wrap">
						<div class="mobile-menu">
							<div id="nav-icon">
								<span></span>
								<span></span>
								<span></span>
								<span></span>
							</div>
							<span>MENU</span>
						</div>
						<div class="search-wrap">
							{* <input type="text" placeholder="Search"> *}
							{include file="frontend/components/searchForm_simple.tpl"}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</header>

{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 * @uses $issueIdentificationString string issue identification that relies on user's settings
 *}

{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}


	<div id="main" class="main">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="main-content">
						<div class="txt issn">(ISSN 0000-1111)</div>
						<div class="txt title t1">Anti-Corruption</div>
						<div class="txt title t2">Studies and</div>
						<div class="txt title t3">Research</div>
						<div class="desc-block">
							<div class="txt desc">(ACSAR) is a peer-reviewed scientific journal dedicated to enhancing cross-disciplinarity investigations on the capabilities of digitalization and sustainability for development management at regional, and national level</div>
							<a href="#" class="btn btn-full">Read more</a>
						</div>
					</div>

				</div>
				<div class="col-md-3">
					<div class="cover-block-wrap">
						<div class="txt current">Current Issue</div>
						<div class="cover-img"><img src="{$baseUrl}/plugins/themes/classic/img/cover.jpg" alt="Curren Issue"></div>
						<div class="txt vol">Vol.1 №1 (2025)</div>
						<div class="txt pub-date"><b>Published:</b> 2025-03-28</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="articles" class="articles">
		<div class="container">
			<div class="row top">
				<div class="col-md-9">
					<div class="block">
						<div class="title">Articles</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="block">
						<a href="#" class="btn btn-all-issues">View All Issues</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="article-block">
						<div class="txt num">7-24</div>
						<div class="title-article">The Role of the Pareto Principle in Quality Management within Industry 4.0: A Comprehensive Bibliometric Analysis</div>
						<div class="txt authors">Aleksy Kwilinski, Maciej Kardas</div>
						<a href="#" class="btn btn-pdf">PDF</a>
					</div>
				</div>
				<div class="col-md-6">
					<div class="article-block">
						<div class="txt num">7-24</div>
						<div class="title-article">The Role of the Pareto Principle in Quality Management within Industry 4.0: A Comprehensive Bibliometric Analysis</div>
						<div class="txt authors">Aleksy Kwilinski, Maciej Kardas</div>
						<a href="#" class="btn btn-pdf">PDF</a>
					</div>
				</div>
			</div>
		</div>
	</div>


<main class="page_index_journal">
	{* Display homepage image if set, and wrap around journal summary if use chooses to display it *}
	{if $homepageImage}
		<div
			class="homepage_image"
			style="background-image: url('{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}'){if $showJournalSummary}, linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)){/if}">
	{/if}

	{if $showJournalSummary && $currentJournal->getLocalizedDescription()}
		<section class="container journal_summary"{if $homepageImage}style="color: #FFF"{/if}>
			<h2>{translate key="navigation.about"}</h2>
			{$currentJournal->getLocalizedDescription()}
		</section>
	{/if}

	{if $homepageImage}
		</div>
	{/if}

	<div class="container-fluid container-page">

		{* Announcements *}
		{if $announcements}
			<section class="announcements">
				<h2>{translate key="announcement.announcements"}</h2>
				<div class="row">
					{foreach from=$announcements item=announcement}
						<article class="col-md-4 announcement">
							<p class="announcement_date">{$announcement->getDatePosted()|date_format:$dateFormatShort|escape}</p>
							<h3 class="announcement_title">
								<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()|escape}">
									{$announcement->getLocalizedTitle()|escape}
								</a>
							</h3>
						</article>
					{/foreach}
				</div>
			</section>
		{/if}

		{call_hook name="Templates::Index::journal"}

		{* Latest issue *}
		{if $issue}
			<section class="current_issue">
				<header>
					{strip}
						<h2 class="current_issue_title">
							<span class="current_issue_label">{translate key="journal.currentIssue"}</span>
							{if $issueIdentificationString}
						 		<span class="current_issue_identification">{$issueIdentificationString|escape}</span>
							{/if}
						</h2>
					{/strip}

					{* Published date *}
					{if $issue->getDatePublished()}
						<p class="published">
							<span class="date_label">
								{translate key="submissions.published"}
							</span>
							<span class="date_format">
									{$issue->getDatePublished()|date_format:$dateFormatLong}
							</span>
						</p>
					{/if}
				</header>
				{include file="frontend/objects/issue_toc.tpl"}
			</section>
		{/if}

		{* Additional Homepage Content *}
		{if $additionalHomeContent}
			<section class="additional_content">
				{$additionalHomeContent}
			</section>
		{/if}
	</div>
</main><!-- .page -->

{include file="frontend/components/footer.tpl"}

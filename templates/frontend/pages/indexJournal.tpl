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
				<div class="col-12 col-md-8">
					<div class="main-content">
						<div class="txt issn">{*(ISSN 0000-1111)*}</div>
						<div class="txt title t1">Anti-Corruption</div>
						<div class="txt title t2">Studies and</div>
						<div class="txt title t3">Research</div>
						<div class="desc-block">
							{* Additional Homepage Content *}
							{if $additionalHomeContent}
								<div class="txt desc">
									{$additionalHomeContent}
								</div>
							{/if}
						</div>
					</div>

				</div>
				<div class="col-12 col-md-4">
					<div class="cover-block-wrap">
						{* Latest issue *}
						{if $issue}
							<div class="txt current">{translate key="journal.currentIssue"}</div>
							{* Issue cover image *}
							{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
							{if $issueCover}
								<div class="cover-img">
									<a href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
										<img src="{$issueCover|escape}" {if $issue->getLocalizedCoverImageAltText() != ''}alt="{$issue->getLocalizedCoverImageAltText()|escape}"{else}alt=""{/if}></a></div>
							{/if}

							{strip}
							{if $issueIdentificationString}
								<div class="txt vol">{$issueIdentificationString|escape}</div>
							{/if}
							{/strip}
							{* Published date *}
							{if $issue->getDatePublished()}
								<div class="txt pub-date"><b>{translate key="submissions.published"}:</b> {$issue->getDatePublished()|date_format:$dateFormatLong}</div>
							{/if}
						{/if}

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
						<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="btn btn-all-issues">{translate key="journal.viewAllIssues"}</a>
					</div>
				</div>
			</div>

			{include file="frontend/objects/issue_toc.tpl"}

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

	</div>
</main><!-- .page -->

{include file="frontend/components/footer.tpl"}

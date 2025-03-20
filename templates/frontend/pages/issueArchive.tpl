{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}

{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<main class="page page_issue_archive" id="main">
	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2 page-wrap issues-wrap">

		{include file="frontend/components/headings.tpl" currentTitle=$pageTitle}

		{* No issues have been published *}
		{if empty($issues)}
			<div class="no_issues">
				<p>{translate key="current.noCurrentIssueDesc"}</p>
			</div>

		{* List issues *}
		{else}
			<div class="flex_container issues_list page-content">
				<div class="block-wrap">
					{foreach from=$issues item=issue}
						<div class="issue_item block">
							{include file="frontend/objects/issue_summary.tpl"}
						</div>
					{/foreach}
				</div>
				</div>

			{* Pagination *}
			{capture assign="prevUrl"}
				{if $prevPage > 1}
					{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$prevPage}
				{elseif $prevPage === 1}
					{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}
				{/if}
			{/capture}
			{capture assign="nextUrl"}
				{if $nextPage}
					{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$nextPage}
				{/if}
			{/capture}
			{include
				file="frontend/components/pagination.tpl"
				prevUrl=$prevUrl|trim
				nextUrl=$nextUrl|trim
				showingStart=$showingStart
				showingEnd=$showingEnd
				total=$total
			}
		{/if}

			</div>
		</div>
	</div>
</main>


{include file="frontend/components/footer.tpl"}

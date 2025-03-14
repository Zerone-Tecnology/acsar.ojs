{**
 * templates/frontend/components/pagination.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common template for displaying pagination
 *
 * @uses $prevUrl string URL to the previous page
 * @uses $nextUrl string URL to the next page
 * @uses $showingStart int The number of the first item shown on this page
 * @uses $showingEnd int The number of the last item shown on this page
 * @uses $total int The total number of items available
 *}

{if $prevUrl || $nextUrl}
	<nav class="pagination_navigation" aria-label="{translate|escape key="common.pagination.label"}">
		<h2 class="visually-hidden">{translate key="issue.pagination"}</h2>
		<ul class="pagination justify-content-center">
			<li class="page-item{if !$prevUrl} disabled{/if}">
				<a class="page-link" href="{$prevUrl}">
					<i class="fas fa-arrow-left"></i>
					{translate key="help.previous"}
				</a>
			</li>
			<li class="page-item active">
				<span class="page-link">
					{translate key="common.pagination" start=$showingStart end=$showingEnd total=$total}
				</span>
			</li>
			<li class="page-item{if !$nextUrl} disabled{/if}">
				<a class="page-link" href="{$nextUrl}">
					{translate key="help.next"}
					<i class="fas fa-arrow-right"></i>
				</a>
			</li>
		</ul>
	</nav>
{/if}

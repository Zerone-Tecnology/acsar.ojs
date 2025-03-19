{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Template for primary and user menus
 *
 *}

{if $navigationMenu}
	{if $id == "navigationPrimary"}
		<ul>
			{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
				{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
					{continue}
				{/if}
				{if !empty($navigationMenuItemAssignment->children)}
					{assign var=navItemType value=$navigationMenuItemAssignment->navigationMenuItem->getType()|escape}
					<li class="{$liClass|escape} has-child">
						<a{if $navItemType === "NMI_TYPE_USER_DASHBOARD"} id="user-dashboard-link"{/if}
								href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">
							{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						</a>
						<ul>
							<div class="container">
								<div class="row">
							<div class="col-md-12">
							{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
								{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
									<li><a
									   href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
										{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
									</a></li>
								{/if}
							{/foreach}
							</div></div>
						</div>
						</ul>
						
					</li>
				{else}
					<li>
						<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}</a>
					</li>
				{/if}
			{/foreach}
		</ul>
	{elseif $id == "navigationUser"}
		<ul>
			{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
				{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
					{continue}
				{/if}
				{if !empty($navigationMenuItemAssignment->children)}
					{assign var=navItemType value=$navigationMenuItemAssignment->navigationMenuItem->getType()|escape}
					<li class="{$liClass|escape} has-child">
						<a{if $navItemType === "NMI_TYPE_USER_DASHBOARD"} id="user-dashboard-link"{/if}
								href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">
							{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						</a>
						<ul>
							{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
								{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
									<li><a
									   href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
										{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
									</a></li>
								{/if}
							{/foreach}
						</ul>
					</li>
				{else}
					<li class="btn">
						<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}</a>
					</li>
				{/if}
			{/foreach}
		</ul>
	{/if}
{/if}

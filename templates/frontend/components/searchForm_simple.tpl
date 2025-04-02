{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}

<form role="search" method="post" action="{url page="search" op="search"}">
    <input class="form-control" id="search" name="query" value="{$searchQuery|escape}" type="search" aria-label="{translate|escape key="common.searchQuery"}" placeholder="{translate|escape key="common.searchQuery"}">
  <!-- <button type="submit" class="btn btn-default">{translate key="common.search"}</button> -->
</form>
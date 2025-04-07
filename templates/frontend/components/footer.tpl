{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Site-wide footer; designed to contain a sidebar hook
 *
 *}

{* <footer class="site-footer">
	<div class="container-fluid container-footer">
		{if $hasSidebar}
			<div class="sidebar_wrapper" role="complementary">
				{call_hook name="Templates::Common::Sidebar"}
			</div>
		{/if}
		<div class="additional-footer-info">
			{if $pageFooter}
				<div class="user-page-footer">
					{$pageFooter}
				</div>
			{/if}
			<div class="pkpbrand-wrapper" role="complementary">
				<a href="{url page="about" op="aboutThisPublishingSystem"}">
					<img class="footer-brand-image" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
				</a>
			</div>
		</div>
	</div>
</footer> *}

<div id="footer" class="footer">
		<div class="container">
			<div class="row top">
				<div class="col-6 col-md-6 col-lg-4">
					<div class="block menu-wrap">
						{load_menu name="footer1" id="navigationFooter1" ulClass="pkp_navigation_footer"}						
					</div>
				</div>
				<div class="col-6 col-md-6 col-lg-4">
					<div class="block menu-wrap">
						{load_menu name="footer2" id="navigationFooter1" ulClass="pkp_navigation_footer"}
					</div>
				</div>
				<div class="col-12 col-md-12 col-lg-4">
					<div class="block menu-wrap">
						{load_menu name="footer3" id="navigationFooter1" ulClass="pkp_navigation_footer"}
					</div>
				</div>
			</div>
			<div class="row center">
				<div class="col-12 col-md-6 col-lg-4">
					<div class="block">
						<div class="logo-wrap">
							<img src="{$baseUrl}/plugins/themes/classic/img/acsar-logo.png" alt="ACSAR">
							<div class="logo-text">{$displayPageHeaderTitle|escape}</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="block">
						{if $pageFooter}
							{$pageFooter}
						{/if}
					</div>
				</div>
				<div class="col-12 col-md-12 col-lg-4">
					<div class="block">
						<div class="search-wrap">
							{include file="frontend/components/searchForm_simple.tpl"}
							<a href="#up" class="btn btn-up"></a>
						</div>
						<div class="partners-wrap">
							<div class="block">
								<a href="https://www.strikeplagiarism.com/en/" target="_block"><img src="{$baseUrl}/plugins/themes/classic/img/strikeplagiarism-logo.png" alt="strikeplagiarism"></a>
							</div>
							<div class="block">
								<a href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_block"><img src="{$baseUrl}/plugins/themes/classic/img/cc-logo.png" alt="CC"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row bottom">
				<div class="col-md-6">
					<div class="block left copy">© 2025 {$displayPageHeaderTitle|escape}</div>
				</div>
				<div class="col-md-6">
					<div class="block right zerone"><a href="https://zeronetech.kz/services/razrabatyvaem/sayty-nauchnykh-zhurnalov/" target="_blank">Разработка сайта — Zerone Technology <img src="{$baseUrl}/plugins/themes/classic/img/zerone-logo.jpg" alt="Zerone"></a></div>
				</div>
			</div>
		</div>
	</div>

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}

</body>
</html>

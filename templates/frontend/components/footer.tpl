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
						<ul>
							<li><a href="#">About</a>
								<ul>
									<li><a href="#">History of the Journal</a>
									<li><a href="#">Journal Publisher</a>
									<li><a href="#">International Editorial Board</a>
									<li><a href="#">Editorial Correspondence</a>
									<li><a href="#">Contacts</a>
								</ul>
							</li>
							<li><a href="#">Current</a></li>
							<li><a href="#">Issues</a></li>
							<li><a href="#">Information</a>
								<ul>
									<li><a href="#">For Readers</a></li>
									<li><a href="#">For Authors</a></li>
									<li><a href="#">For Librarians</a></li>
								</ul>
							</li>
						</ul>
						
					</div>
				</div>
				<div class="col-6 col-md-6 col-lg-4">
					<div class="block menu-wrap">
						<ul>
							<li><a href="#">Journal Policy</a>
								<ul>
									<li><a href="#">Aims and scope</a>
									<li><a href="#">Review process</a>
									<li><a href="#">Publication Frequency</a>
									<li><a href="#">Indexing and DOI</a>
									<li><a href="#">Open access</a>
									<li><a href="#">Publication Ethics</a>
									<li><a href="#">Retraction Policy</a>
									<li><a href="#">Author Policy</a>
									<li><a href="#">Plagiarism</a>
									<li><a href="#">Rejection of Publication: Reasons</a>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-12 col-md-12 col-lg-4">
					<div class="block menu-wrap">
						<ul>
							<li><a href="#">Reviewers</a>
								<ul>
									<li><a href="#">Editorial Review Board 2025</a></li>
								</ul>
							</li>
							<li><a href="#">GDPR (General Data Protection Regulation)</a></li>
							<li><a href="#">Announcements</a>
								<ul>
									<li><a href="#">Information</a>
									<li><a href="#">Resources for Authors</a>
									<li><a href="#">Navigation and Data Management</a>
									<li><a href="#">Support and Training</a>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row center">
				<div class="col-12 col-md-6 col-lg-4">
					<div class="block">
						<div class="logo-wrap">
							<img src="{$baseUrl}/plugins/themes/classic/img/acsar-logo.png" alt="ACSAR">
							<div class="logo-text">Anti-Corruption Studies and Research</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="block">
						<p>Anti-corruption studies and research, ISSN 0000-1111
							International Semiannual Publication of Scholarly Papers</p>
						<p>Founded and published by <br>
							<a href="#">Law Enforcement Academy of the Republic of Uzbekistan</a>
							9, Rixsiliy street, Tashkent, Uzbekistan 100190</p>
						<p>Email: <a href="#">editor@acsar.uz</a> <br>
							Home page: <a href="#">https://acsar.uz</a></p>
					</div>
				</div>
				<div class="col-12 col-md-12 col-lg-4">
					<div class="block">
						<div class="search-wrap">
							<input type="text" placeholder="Search">
							<input type="button" value="Find">
							<a href="#up" class="btn btn-up"></a>
						</div>
						<div class="partners-wrap">
							<div class="block">
								<a href="https://www.turnitin.com/" target="_block"><img src="{$baseUrl}/plugins/themes/classic/img/turnitin-logo.png" alt="Turnitin"></a>
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
					<div class="block left copy">© 2025 Anti-corruption studies and research</div>
				</div>
				<div class="col-md-6">
					<div class="block right zerone"><a href="#">Разработка сайта — Zerone Technology <img src="{$baseUrl}/plugins/themes/classic/img/zerone-logo.jpg" alt="Zerone"></a></div>
				</div>
			</div>
		</div>
	</div>

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}

</body>
</html>

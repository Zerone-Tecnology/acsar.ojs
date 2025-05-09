{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}

{include file="frontend/components/header.tpl" pageTitle="user.login"}

<div class="page page_login">
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3 page-wrap login-wrap">

				{include file="frontend/components/headings.tpl" currentTitleKey="user.login"}

				{* A login message may be displayed if the user was redireceted to the
				   login page from another request. Examples include if login is required
				   before dowloading a file. *}
				{if $loginMessage}
					<p>
						{translate key=$loginMessage}
					</p>
				{/if}

				<form class="cmp_form login" id="login" method="post" action="{$loginUrl}">
					{csrf}

					{if $error}
						<div class="row">
							<div class="pkp_form_error col-md-6 offset-md-3">
								<div class="alert alert-danger" role="alert">{translate key=$error reason=$reason}</div>
							</div>
						</div>
					{/if}

					<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

					<fieldset class="fields">
						<div class="row">
							<div class="form-group col-md-6">
								<label for="username" class="form-label">
									{translate key="user.username"}
								</label>
								<input type="text" class="form-input form-control" name="username" id="username" value="{$username|default:""|escape}" maxlength="32" placeholder="{translate key="user.username"}" required>
								<small class="form-text text-muted"><span class="required">*</span>{translate key="common.required"}</small>
							</div>

							<div class="form-group col-md-6">
								<label for="password" class="form-label">
									{translate key="user.password"}
								</label>
								<input type="password" class="form-input form-control" name="password" id="password" value="{$password|default:""|escape}" password="true" maxlength="32" placeholder="{translate key="user.password"}" required>
								<small class="form-text text-muted"><span class="required">*</span>{translate key="common.required"}</small>
								<p>
									<small>
										<a href="{url page="login" op="lostPassword"}">
											{translate key="user.login.forgotPassword"}
										</a>
									</small>
								</p>
							</div>

							<div class="col-md-6 custom-control custom-checkbox checkbox-remember">
								<input type="checkbox" class="custom-control-input" name="remember" id="remember" value="1" checked>
								<label class="custom-control-label" for="remember">{translate key="user.login.rememberUsernameAndPassword"}</label>
							</div>

							{* recaptcha spam blocker *}
							{if $recaptchaPublicKey}
								<div class="col-md-6">
									<fieldset class="recaptcha_wrapper">
										<div class="fields">
											<div class="recaptcha">
												<div class="g-recaptcha" data-sitekey="{$recaptchaPublicKey|escape}">
												</div><label for="g-recaptcha-response" style="display:none;" hidden>Recaptcha response</label>
											</div>
										</div>
									</fieldset>
								</div>
							{/if}

							<div class="col-md-6 offset-md-3 buttons">
								<button class="submit btn btn-primary" type="submit">
									{translate key="user.login"}
								</button>

								{if !$disableUserReg}
									{capture assign="registerUrl"}{url page="user" op="register" source=$source}{/capture}
									<a href="{$registerUrl}" class="register btn">
										{translate key="user.login.registerNewAccount"}
									</a>
								{/if}
							</div>

					</fieldset>
				</form>
			</div>
		</div><!-- .page -->
	</div><!-- .page -->
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}

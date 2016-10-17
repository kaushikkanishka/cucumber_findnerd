class Login < Base
  include RSpec::Matchers

  def initialize(session)
    @session = session
  end

  def select_remember_me_checkbox
    @session.find('#user_session_remember_me').click
    self
  end

  def click_signin_button
    @session.find('#user_session_submit').click
    expect(@session).to have_css('.welcomeMsgBlock')
    detail_page = ShowDetailsPage.new(@session)
    navigation = LeftNavigation.new(@session)
    email_page = EmailTasks.new(@session)
    top_nav = TopNavigation.new(@session)
    [detail_page, navigation, email_page, top_nav]
  end

  def enter_login_username(username1)
    #@session.fill_in '#user_session_login', with:username
    @session.find('#user_session_login').set(username1)
    self
  end

  def enter_login_password(password1)
    #@session.fill_in '#user_session_password', with:password
    @session.find('#user_session_password').set(password1)
    self
  end

  def click_linkedIn_signIn_button
    @session.find('.oauthButton.linkedin.clr').click
    self
  end

  def enter_linkedIn_username(linkedIn_username)
    #@session.fill_in '#session_key-oauth2SAuthorizeForm', with:""
    @session.find('#session_key-oauth2SAuthorizeForm').set(linkedIn_username)
    self
  end

  def enter_linkedIn_password(linkedIn_password)
    #@session.fill_in '#session_password-oauth2SAuthorizeForm', with: ""
    @session.find('#session_password-oauth2SAuthorizeForm').set(linkedIn_password)
    self
  end

  def click_linkedIn_allow_access_button
    @session.find('.allow').click
    ShowDetailsPage.new(@session)
  end

  def switched_to_linkedin_popup
    main_window = @session.driver.browser.window_handles.first
    linkedin_window = @session.driver.browser.window_handles.last
    @session.driver.browser.switch_to.window(linkedin_window)
    self
  end

  def click_forgot_password_link
    @session.find('.forgotPswdSignIn').click
    self
  end

  def enter_forgot_pwd_email(email)
    # @session.fill_in 'email', with: email
    @session.find('#email').set(email)
     self
    # EmailTasks.new(@session)
  end

  def click_reset_pwd_button
    @session.find('.btn-primary').click
    # EmailTasks.new(@session)
    self
  end

  def assert_forgot_password_message(msg)
    jq = "$('#forgotpassfrmNotice').text();"
    expect(@session.evaluate_script(jq).gsub(/\A[[:space:]]+|[[:space:]]+\z/, '').downcase).to(be == msg.downcase.strip)
    EmailTasks.new(@session)
  end

  def enter_new_password(arg)
    @session.find(:xpath, "//*[@id='resetPassFrm']//input[@id='user_password']").set(arg)
    @session.find(:xpath, "//*[@id='resetPassFrm']//input[@id='user_password_confirmation']").set(arg)
    @session.find(:xpath, "//*[@id='resetPassFrm']//*[@id='user_submit']").click
    self
  end

  def assert_password_change(arg)
    expect(@session.find(:xpath, "//*[@class='welcomeMessage']//a").text.strip).to eq(arg)
    self
  end

  def assert_signin_overlay
    expect(@session).to have_css('#signinoverlay')
    self
  end

  def close_signin_overlay
    @session.find(:xpath, "//*[@id='signinoverlay']//span[@class='closeblog']").click
    NerdDigest.new(@session)
  end
end
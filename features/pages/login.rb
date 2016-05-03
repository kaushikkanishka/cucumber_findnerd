class Login < Base
  include RSpec::Matchers

  def initialize(session)
    puts "before #{session}"
    @session = session
    puts "after #{@session}"
  end

  def select_remember_me_checkbox
    @session.find('#user_session_remember_me').click
    self
  end

  def click_signin_button
    @session.find('#user_session_submit').click
    ShowDetailsPage.new(@session)
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
    puts expect(@session).to have_css('#session_password-oauth2SAuthorizeForm')
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
    puts "'main window' #{main_window}"
    linkedin_window = @session.driver.browser.window_handles.last
    puts "'linkedin window' #{linkedin_window}"
    @session.driver.browser.switch_to.window(linkedin_window)
    self
  end
end
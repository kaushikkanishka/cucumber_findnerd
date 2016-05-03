class Login < Base

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
end
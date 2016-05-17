class Homepage < Base
  def initialize(session)
    @session = session
  end
  def assert_homepage_links(navigation_link)
    case navigation_link
      when 'Findnerd Logo'
        expect(@session).to(have_css('.homelogo'))
      when 'Nerd Digest'
        expect(@session).to(have_css('.clr>li>a', text: 'Nerd Digest'))
      when 'Tech QnA'
        expect(@session).to(have_css('.clr>li>a', text: 'Tech Q&A'))
      when 'Find Projects'
        expect(@session).to(have_css('.clr>li>a', text: 'Find Projects'))
      when 'Sign In'
        expect(@session).to(have_css('.sign>a'))
      when 'Register'
        expect(@session).to(have_css('.register>a'))
    end
    self
  end

  def click_registration_link
    @session.find('.register>a').click
    self
  end

  def enter_username(username)
    @session.fill_in '#user_login', with: username
    self
  end

  def enter_email(email)
    @session.fill_in '#user_email', with: email
    self
  end

  def enter_password(password)
    @session.fill_in '#user_email', with: password
    self
  end

  def enter_confirm_password(confirm_pwd)
    @session.fill_in '#user_email', with: confirm_pwd
    self
  end

  def click_signin_link
    @session.find('.sign>a').click
    Login.new(@session)
  end

end
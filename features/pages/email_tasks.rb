class EmailTasks < Base
  include RSpec::Matchers
  include Capybara::DSL
  include Capybara::Email::DSL

  def initialize(session)
    @session = session
  end

  def open_reset_pwd_email(forgot_pwd_email)
    clear_emails
    open_email(forgot_pwd_email)
    puts "Mail content #{open_email(forgot_pwd_email)}"
    current_email.click_link 'Reset Password!'
    puts "Open email"
    sleep 20
    self
  end

end
class EmailTasks < Base
  include RSpec::Matchers

  def initialize(session)
    @session = session
  end

  def open_reset_pwd_email()
    gmail = Gmail.connect('qatest.kkaushik','Computer10')
    puts "Messages count: #{gmail.inbox.count}"
    self
  end

end
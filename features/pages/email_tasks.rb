class EmailTasks < Base
  include RSpec::Matchers

  def initialize(session)
    @session = session
  end

  # def open_reset_pwd_email()
  #   gmail = Gmail.connect('qatest.kkaushik','Computer10')
  #   puts "Messages count: #{gmail.inbox.count}"
  #   self
  # end

  def open_reset_pwd_email()
    gmail = Gmail.connect('qatest.kkaushik','Computer10')
    sleep 3
    puts "Messages count: #{gmail.inbox.count}"
    a = gmail.inbox.find(:from => 'dineshmgkvp@gmail.com').last
    puts a.message.to
    puts a.message.body
    puts a.message.subject
    puts "Link: #{a.message.try_link0 'Reset Password!'}"
    puts "Clicked link"
    @session.open_email("qatest.kkaushik@gmail.com")
    @session.current_email.click_link 'Reset Password!'
    # open_email("some@gmail.com")
    # @current_email = a.message

    #current_email.click_link 'Reset Password!'
    puts "First email: #{gmail.inbox.find(:from => 'dineshmgkvp@gmail.com').first}"
    a
  end


end
class EmailTasks < Base
  include RSpec::Matchers

  def initialize(session)
    @session = session
  end

  def open_reset_pwd_email()
    gmail = Gmail.connect('qatest.kkaushik','Computer10')
    sleep 2
    @a = gmail.inbox.find(:from => 'dineshmgkvp@gmail.com').last
    # puts @a.message.to
    # puts @a.message.body
    @subject = @a.message.subject
    content = @a.message.body
    @links = content.to_s.scan(/<a.+?href="(.+?)"/).flatten[0]
    puts "link  = #{@links}"
    self
  end

  def assert_forgot_pwd_email_subject(arg)
    expect(@subject.strip).to eq(arg.strip)
    self
  end

  def click_email_link
    @session.visit @links
    sleep 3
    Login.new(@session)
  end
end
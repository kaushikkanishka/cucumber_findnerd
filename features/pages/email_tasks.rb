class EmailTasks < Base
  include RSpec::Matchers

  def initialize(session)
    @session = session
  end

  def open_gmail_email(username, password)
    gmail = Gmail.connect(username, password)
    sleep 2
    sender_email = fetch_value_from_config("Sender_Mail_id")
    @a = gmail.inbox.find(:from => sender_email).last
    # puts @a.message.to
    # puts @a.message.body
    @subject = @a.message.subject
    content = @a.message.body
    @links = content.to_s.scan(/<a.+?href="(.+?)"/).flatten[0]
    self
  end

  def assert_forgot_pwd_email_subject(arg)
    expect(@subject).to eq(arg)
    self
  end

  def click_email_link
    @session.visit @links
    sleep 3
    Login.new(@session)
  end
end
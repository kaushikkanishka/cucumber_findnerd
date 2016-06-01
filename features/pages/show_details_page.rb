class ShowDetailsPage < Base

  def initialize(session)
    @session = session
  end

  def assert_activities_breadcrumb
     jq = "$(\"#mainiframe\").contents().find('.breadcrumb li:last-child').text();"
     puts "jq = #{@session.evaluate_script(jq)}"
     expect(@session.evaluate_script(jq).gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')).to(be == '>> Activities')
    self
  end


  # def open_reset_pwd_email()
  #   gmail = Gmail.connect('qatest.kkaushik','Computer10')
  #   sleep 3
  #   puts "Messages count: #{gmail.inbox.count}"
  #   self
  # end
end
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

  def click_company_updates
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='nav nav-tabs']//li/a[contains(text(),'Company Updates')]").click
    end
    self
  end

  def assert_message_company_updates_tab(text)
    @session.within_frame 'mainiframe' do
      a = "//*[@class='userprofilecover']/div[1]//div[@class='statusMessage']"
      expect(@session.find(:xpath, a).text.strip).to eq(text)
    end
    self
  end
end
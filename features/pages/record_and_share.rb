class RecordAndShare < Base
  def initialize(session)
    @session = session
  end

  def assert_record_and_share_text(content)
    @session.within_frame 'mainiframe' do
      case content
        when 'Record Desktop & Share'
          expect(@session).to have_xpath("//*[@class='techQuery']//h2[contains(text(),'Record Desktop & Share.')]")
        when 'Keep the recording private and share the link or make it public'
          xpath = "//*[@class='techQuery']//p[contains(text(),'Keep the recording private and share')]"
          expect(@session).to have_xpath(xpath)
        when 'Type in your tech analysis, product insights and tech solutions'
          expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(),'Type in your tech analysis')]")
        when 'Record your Desktop for better insights'
          expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(),'Desktop for better insights')]")
        when 'The recording is saved on cloud'
          expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(),'recording is saved on cloud')]")
        when 'Share the link'
          expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(),'Share the link')]")
      end
    end
    self
  end

  def assert_category_default_value
    @session.within_frame 'mainiframe' do
      expect(@session).to(have_xpath("//*[@id='node_category_id']/option[1][contains(text(),'Select Category')]"))
    end
    PostProject.new(@session)
  end
end
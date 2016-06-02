class PublishNodePage < Base
  def initialize(session)
    @session = session
  end

  def assert_publish_confirmation_message(message)
    @session.within_frame 'mainiframe' do
      actual_message = @session.find('.alert').text
      expect(actual_message.strip).to eq(message.strip)
    end
    self
  end

  def assert_no_publish_button
    @session.within_frame 'mainiframe' do
      #expect(@session).not_to have_xpath(:xpath, "//*[@id='blog8']//div[@class='itemOptions'][1]//a[@id='publish']")
      expect(@session).not_to have_css('#publish')
    end
    self
  end

  def assert_no_back_button
    @session.within_frame 'mainiframe' do
      #expect(@session).not_to have_xpath(:xpath, "//*[@id='blog8']//div[@class='itemOptions'][1]//else[@id='back']")
      expect(@session).not_to have_css('#back')
    end
    self
  end

  def assert_admin_approval_message
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('.alert')
    end
    self
  end

  def assert_published_project
    @session.within_frame 'mainiframe' do
      title = @session.find('.titleList.nodeTitle').text
      @session.find('.alert>a').click
      expect(@session.find(:xpath, ".//*[@class='span4'][1]//div[@class='itemContent']/h4/a").text.strip).to eq(title)
    end
    self
  end
end
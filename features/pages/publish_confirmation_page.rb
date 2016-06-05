class PublishConfirmationPage < Base
  def initialize(session)
    @session = session
  end

  def assert_publish_confirmation_page
    @session.within_frame 'mainiframe' do
      expect(@session).to(have_css('#publish'))
    end
    self
  end

  def assert_publish_confirmation_breadcrumb(breadcrumb)
    @session.within_frame 'mainiframe' do
      bcrumb_last = @session.find(:xpath, ".//*[@class='breadcrumb']/li[last()]").text
      actual_bcrumb = 'Home<< FindProjects' + bcrumb_last
      expect(actual_bcrumb).to eq(breadcrumb)
    end
    self
  end

  def assert_publish_confirmation_fields(assert_fields)
    @session.within_frame 'mainiframe' do
      case assert_fields
        when 'Publish Button'
          expect(@session).to have_css('#publish')
        when 'Back button'
          expect(@session).to have_css('#back')
        when 'Title'
          expect(@session.find(:xpath, "//*[@class='titleList nodeTitle']").text.strip).to be(@blog_title)
        when 'Publish Tenure day'
          expect(@session.find(:xpath, "//*[@class='blogInfo']/p[1]").text.strip).to eq('0 days ago')
        when 'Hiring Open'
          expect(@session.find(:xpath, "//*[@id='projectStatus']").text.strip).to eq('(Hiring Open)')
        when 'Budget selected'
          expect(@session.find(:xpath, "//*[@class='fixedPrice']/../span").text.strip).to be(@budget_value)
        when 'Selected Duration'
          expect(@session.find(:xpath, "//*[@class='durationProject']/../span").text.strip).to be(@duration_value)
        when 'User Id Link'
          expect(@session.find(:xpath, "//*[@class='userShareCover']/a").text.strip).to be("'@'#{@uname}")
        when 'Tags'
          expect(@session.find(:xpath, "//*[@class='tagName']/span").text.strip).to be(@dummy_tags)
        when 'Comments Section'
          expect(@session).to have_css('.itemStatus')
        when 'Content'
          expect(@session.find(:xpath, "//*[@class='p']/p").text.strip).to be(@dummy_text)
      end
      self
    end
  end

  def assert_project_title(title)
    @session.within_frame 'mainiframe' do
      expect(@session.find(:xpath, "//*[@class='titleList nodeTitle']").text.strip).to eq(title)
    end
    self
  end

  def assert_project_duration(duration)
    @session.within_frame 'mainiframe' do
      expect(@session.find(:xpath, "//*[@class='durationProject']/../span").text.strip).to eq(duration)
    end
    self
  end

  def assert_project_budget(budget)
    @session.within_frame 'mainiframe' do
      expect(@session.find(:xpath, "//*[@class='fixedPrice']/../span").text.strip).to eq(budget)
    end
    self
  end

  def assert_project_content(content)
    @session.within_frame 'mainiframe' do
      expect(@session.find(:xpath, "//*[@class='p']/p").text.strip).to eq(content)
    end
    self
  end

  def assert_project_tags(tags)
    @session.within_frame 'mainiframe' do
      expect(@session.find(:xpath, "//*[@class='tagName']/span").text.strip).to eq(tags)
    end
    self
  end

  def click_publish_button
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@id='blog8']//div[@class='itemOptions'][1]//a[@id='publish']").click
    end
    PublishNodePage.new(@session)
  end


end
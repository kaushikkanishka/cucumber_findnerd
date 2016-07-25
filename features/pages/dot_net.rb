class DotNet < Base
  def initialize(session)
    @session = session
  end


  def get_dotnet_first_blog_title
    @session.within_frame 'mainiframe' do
      @@blog_title = @session.find(:xpath, "//*[@class='itemContent']/../../div[1]/div[@class='itemContent']/h4/a").text.strip
    end
    self
  end


  def add_blog_to_tuteset
    @session.within_frame 'mainiframe' do
      @xpath1 = "//*[@class='span4']//a[contains"
      xpath2 = "#{@xpath1}(text(),'#{@@blog_title}')]/../../ul[@class='itemStatus']//a[@class='tute']"
      xpath3 = "#{@xpath1}(text(),'#{@@blog_title}')]/../../ul[@class='itemStatus']//span[@class = 'userTuteCount']"
      @@userTuteCount = @session.find(:xpath, xpath3).text
      @session.find(:xpath, xpath2).click
    end
    self
  end

  def select_tuteset_from_overlay(arg)
    @session.within_frame 'mainiframe' do
      @session.find('#searchTuteTab').set(arg)
      sleep 0.25
      xpath1 = "//*[@class='searchedContent']//a[contains(text(),'#{arg}')]/../../span[@title='Add to tuteset']"
      @session.find(:xpath, xpath1).click
      @session.find('.crossOver').click
    end
    self
  end

  def assert_userTuteCount_after_deletion
    @session.within_frame 'mainiframe' do
      a = "//*[@class='span4']//a[contains"
      xpath4 = "#{a}(text(),'#{@@blog_title}')]/../../ul[@class='itemStatus']//span[@class = 'userTuteCount']"
      sleep 1
      update_count = @session.find(:xpath, xpath4).text
      expect(update_count.to_i).to eq(@@userTuteCount.to_i)
    end
    self
  end

  def assert_userTuteCount_after_addition
    @session.within_frame 'mainiframe' do
      xpath4 = "#{@xpath1}(text(),'#{@@blog_title}')]/../../ul[@class='itemStatus']//span[@class = 'userTuteCount']"
      sleep 1
      update_count = @session.find(:xpath, xpath4).text
      expect(update_count.to_i).to eq(@@userTuteCount.to_i + 1)

    end
    LeftNavigation.new(@session)
  end
end
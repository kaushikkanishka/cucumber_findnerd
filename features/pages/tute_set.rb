class TuteSet < Base
  def initialize(session)
    @session = session
  end

  def assert_zero_tuteset_message
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@id='leftContent']/p[contains(text(), 'No Tuteset found !!')]")
    end
    self
  end

  def assert_tuteset_presence
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@class='tuteContainer']//div[@class='span4']")
    end
    self
  end

  def assert_tuteset_items(item)
    @session.within_frame 'mainiframe' do
      tute = "//*[@class='tuteContainer']//a[@class='itemHeading tuteItem'][contains(text(),'tute_kaushik')]"
      case item
        when 'Tute Set Name as title'
          expect(@session).to have_xpath(tute)
        when 'Count of blogs in the tute set'
          blog_count = @session.find(:xpath,"#{tute}/../following-sibling::div/div[@class='tuteCount']/span").text
          is_numeric = true if Float(blog_count) rescue false
          expect(is_numeric).to be(true)
        when 'Share icon'
          expect(@session).to have_xpath("#{tute}/../following-sibling::div/ul[@class='itemStatus']//a[@class='share']")
        when 'View icon'
          expect(@session).to have_xpath("#{tute}/../following-sibling::div/ul[@class='itemStatus']//a[@class='share']")
      end
    end
    self
  end

  def click_tuteset_title
    @session.within_frame 'mainiframe' do
      tute = "//*[@class='tuteContainer']//a[@class='itemHeading tuteItem'][contains(text(),'tute_kaushik')]"
      @session.find(:xpath, tute).click
    end
    self
  end

  def assert_tute_overlay_items(item)
    # @session.within_frame 'mainiframe' do
      case item
        when 'Tute Set name'
          expect(@session).to have_xpath("//*[@class='tuteTitleHead'][contains(text(),'tute_kaushik')]")
        when 'Blog titles added in Tute Set'
          expect(@session).to have_xpath("//*[@class='listTutes']/li")
        when 'Up arrow link'
          expect(@session).to have_xpath("//*[@class='listTutes']/li/div[@class='arrowsGroup']/a[@class='listUp']")
        when 'Down arrow Link'
          expect(@session).to have_xpath("//*[@class='listTutes']/li/div[@class='arrowsGroup']/a[@class='listDown']")
        when 'Delete icon links'
          expect(@session).to have_xpath("//*[@class='listTutes']/li/div[@class='arrowsGroup']/a[@class='listDelete']")
        when 'Close(X) icon'
          expect(@session).to have_xpath("//*[@class='blogListing']//span[@class='crossOver']")
      end
    # end
    self
  end

  def close_tute_overlay
    @session.find(:xpath, "//*[@class='blogListing']//span[@class='crossOver']").click
    self
  end
end
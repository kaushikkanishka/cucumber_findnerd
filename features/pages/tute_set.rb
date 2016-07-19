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
end
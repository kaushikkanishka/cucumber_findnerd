class NerdDigest < Base
  def initialize(session)
    @session = session
  end

  def assert_nerd_digest_breadcrumb
    @session.within_frame 'mainiframe' do
      breadcrumb = Array.new
      @session.all(:xpath, "//*[@class='breadcrumb']/li").each do |value|
        breadcrumb.push value.text.strip
      end
      expect(breadcrumb.join(" ")).to eq("Home >> Nerd Digest >> Automation")
    end
    self
  end

  def assert_nerd_digest_page
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('#no_bid')
    end
    self
  end

  def click_tag(tag)
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@id='tagDisplay']//span[text()='#{tag}']").click
      sleep 3
    end
    self
  end

  def assert_tags_above_featured_section(arg)
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@id='selTags']/div[text()='#{arg}']")
    end
    self
  end

  def assert_selected_tag_posts(arg)
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@class='tagName']//a/span[text()=' #{arg} ']")
    end
    self
  end

  def select_first_post
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='row']/div[1]//a[@class='itemHeading']").click
    end
    self
  end

  def click_tag_cross_button(arg)
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@id='selTags']/div[text()='#{arg}']/a").click
    end
    self
  end

  # def open_respective_tag_post(arg)
  #   @session.within_frame 'mainiframe' do
  #     @session.all(:xpath, "//*[@id='leftContent']//div[@class='itemContent']//a[text()='Automation']/../../../..[1]")
  #   end
  #   self
  # end
end
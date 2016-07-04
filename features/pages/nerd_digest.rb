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
end
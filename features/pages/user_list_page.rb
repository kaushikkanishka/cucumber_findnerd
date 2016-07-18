class UserListPage < Base
  include RSpec::Matchers

  def initialize(session)
    @session = session
  end

  def search_user(arg)
    @session.find('#q').set(arg)
    @session.within_frame 'mainiframe' do
      #@session.select 'u', :from => '#searchOption'
    end
    sleep 2
    @session.find('#submitbutton').click
    self
  end

  def assert_user_id_from_name(nerd_name)
    sleep 5
    # name = nerd_name.split(' ')
    # id = "@#{name.first}.#{name.last}"
    # jq = "$(\"#mainiframe\").contents().find('.heading').text();"
    # expect(@session.evaluate_script(jq).gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')).to(be == id.downcase.strip)
    @session.within_frame 'mainiframe' do
      a = "//*[@class='userProfileList']//div[@class='itemContent']/a[contains(text(),'#{nerd_name}')]"
      xpath = "#{a}/../../div[@class='userList']//div[@class='userShareCover']/a"
      expect(@session).to have_xpath(xpath)
    end
    self
  end

  def assert_user_name(nerd_name)
    # jq = "$(\"#mainiframe\").contents().find('.itemHeading:first').text();"
    # expect(@session.evaluate_script(jq).gsub(/\A[[:space:]]+|[[:space:]]+\z/, '').downcase).to(be == nerd_name.downcase.strip)
    @session.within_frame 'mainiframe' do
      a = "//*[@class='userProfileList']//div[@class='itemContent']/a[contains(text(),'#{nerd_name}')]"
      expect(@session.find(:xpath, a).text.strip).to eq(nerd_name)
    end

    self
  end
end
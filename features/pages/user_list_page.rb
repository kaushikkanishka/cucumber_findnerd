class UserListPage < Base
  include RSpec::Matchers

  def initialize(session)
    @session = session
  end

  def search_user(arg)
    @session.find('#q').set(arg)
    sleep 5
    @session.within_frame 'mainiframe' do
      #@session.select 'u', :from => '#searchOption'
    end
    sleep 5
    @session.find('#submitbutton').click
    sleep 5
    self
  end

  def assert_user_id(nerd_name)
    sleep 5
    name = nerd_name.split(' ')
    id = "@#{name.first}.#{name.last}"
    jq = "$(\"#mainiframe\").contents().find('.heading').text();"
    expect(@session.evaluate_script(jq).gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')).to(be == id.downcase.strip)
    self
  end

  def assert_user_name(nerd_name)
    jq = "$(\"#mainiframe\").contents().find('.itemHeading:first').text();"
    expect(@session.evaluate_script(jq).gsub(/\A[[:space:]]+|[[:space:]]+\z/, '').downcase).to(be == nerd_name.downcase.strip)
    self
  end
end
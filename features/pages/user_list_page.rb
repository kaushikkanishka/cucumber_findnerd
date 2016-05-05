class UserListPage < Base
  include RSpec::Matchers

  def initialize(session)
    @session = session
  end

  def search_user(arg)
    @session.find('#q').set(arg)
    sleep 5
    @session.within_frame 'mainiframe' do
      puts "inside iframe"
      @session.select 'u', :from => '#searchOption'
      puts "iframe ends"
    end
    sleep 5
    @session.find('#submitbutton').click
    sleep 5
    self
  end

  def assert_user_id(nerd_name)
    name = nerd_name.split(' ')
    id = "@#{name.first}.#{name.last}"
    jq = "$(\"#mainiframe\").contents().find('.heading').text();"
    expect(@session.evaluate_script(jq).gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')).to(be == id.downcase.strip)
    self
  end
end
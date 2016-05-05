class ShowDetailsPage < Base

  def initialize(session)
    @session = session
  end

  def assert_activities_breadcrumb
    jq = "$(\"#mainiframe\").contents().find('.breadcrumb li:last-child').text();"
    expect(@session.evaluate_script(jq).gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')).to(be == '>> Activities')
    self
  end
end
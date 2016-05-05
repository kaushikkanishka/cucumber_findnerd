class LeftNavigation < Base
  def initialize(session)
    @session = session
  end

  def click_browse_nerds_link
    @session.find('.postTechJob.shiftingRight', text: 'Browse Nerds').click
    UserListPage.new(@session)
  end
end
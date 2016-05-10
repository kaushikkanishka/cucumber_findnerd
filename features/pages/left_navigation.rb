class LeftNavigation < Base
  def initialize(session)
    @session = session
  end

  def click_browse_nerds_link
    @session.find('.postTechJob.shiftingRight', text: 'Browse Nerds').click
    UserListPage.new(@session)
  end

  def click_post_project_link
    @session.find('.recordDesktopShare.postProjects.shiftingRight', text: 'Post Project').click
    sleep 15
    PostProject.new(@session)
  end
end
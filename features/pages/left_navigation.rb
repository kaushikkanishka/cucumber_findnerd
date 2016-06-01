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
    #sleep 10
    PostProject.new(@session)
  end

  def click_draft_link
    content = ".postTechJob.myContent.shiftingRight.subMenuList"
    @session.find(content).hover
    @session.find(:xpath, "//*[@class='askTech' and @title = 'Draft']").click
    @session.within_frame 'mainiframe' do
      @session.find('.span4:first-child > .itemContent > h4 > a').click
    end
    PublishConfirmationPage.new(@session)
  end
end
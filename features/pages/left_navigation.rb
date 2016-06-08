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
    Draft.new(@session)
  end

  def click_published_link
    content = ".postBlogsTech.myContent.active"
    @session.find(content).hover
    @session.find('.list-content>li:first-child>a').click
    PublishNodePage.new(@session)
  end

  def edit_company_profile_link
    content = '.manageCompany.shiftingRight.subMenuList'
    @session.find(content).hover
    @session.find('.list-content>li:first-child>a').click
    CompanyProfile.new(@session)
  end
end
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
    PostProject.new(@session)
  end

  def click_draft_link
    content = ".postTechJob.myContent.shiftingRight.subMenuList"
    @session.find(content).hover
    @session.find(:xpath, "//*[@class='askTech' and @title = 'Draft']").click
    Draft.new(@session)
  end

  def click_published_link
    content = "//*[@class='postTechJob myContent shiftingRight subMenuList']"
    @session.find(:xpath, content).hover
    @session.find(:xpath, "//*[@class='list-content']/li/a[contains(text(),'Published')]").click
    PublishNodePage.new(@session)
  end

  def edit_company_profile_link
    content = "//*[@class='manageCompany shiftingRight subMenuList']"
    @session.find(:xpath, content).hover
    @session.find(:xpath, "//*[@class='list-content']/li/a[contains(text(),'Edit Company Profile')]").click
    CompanyProfile.new(@session)
  end

  def click_company_link
    @session.find('.manageCompany.shiftingRight.subMenuList').click
    CompanyProfile.new(@session)
  end

  def click_company_chat_link
    content = "//*[@class='manageCompany shiftingRight subMenuList']"
    @session.find(:xpath, content).hover
    @session.find(:xpath, "//*[@class='list-content']/li/a[contains(text(),'Company Chat')]").click
    CompanyProfile.new(@session)
  end

  def click_manage_reports_link
    content = "//*[@class='manageCompany shiftingRight subMenuList']"
    @session.find(:xpath, content).hover
    @session.find(:xpath, "//*[@class='list-content']/li/a[contains(text(),'Report')]").click
    Reports.new(@session)
  end

  def click_record_share_link
    @session.find(:xpath, "//*[@class='recordDesktopShare shiftingRight'][@title='Record & Share']").click
    record_share = RecordAndShare.new(@session)
    post_project = PostProject.new(@session)
    [record_share, post_project]
  end
end
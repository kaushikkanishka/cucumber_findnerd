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

  def
  click_record_share_link
    @session.find(:xpath, "//*[@class='recordDesktopShare shiftingRight'][@title='Record & Share']").click
    post_project = PostProject.new(@session)
    record_share = RecordAndShare.new(@session)
    [post_project, record_share]
  end

  def click_automation_link
    nerdDigest = "//*[@class='learnNerdDigest shiftingRight subMenuList']"
    @session.find(:xpath, nerdDigest).hover
    @session.find(:xpath, "//*[@class='list-content']/li/a[contains(text(),'Automation')]").click
    NerdDigest.new(@session)
  end

  def click_active_projects_link
    xpath = "//*[@class='recordDesktopShare activeProjects shiftingRight'][@title='My Active Projects']"
    @session.find(:xpath, xpath).click
    ActiveProjects.new(@session)
  end

  def click_tute_sets_link
    content = "//*[@class='postTechJob myContent shiftingRight subMenuList']"
    @session.find(:xpath, content).hover
    @session.find(:xpath, "//*[@class='list-content']/li/a[contains(text(),'Tute Sets')]").click
    tute_set = TuteSet.new(@session)
    nerd_digest = NerdDigest.new(@session)
    [tute_set, nerd_digest]
  end

  def click_dot_net_link
    nerdDigest = "//*[@class='learnNerdDigest shiftingRight subMenuList']"
    @session.find(:xpath, nerdDigest).hover
    @session.find(:xpath, "//*[@class='list-content']/li/a[contains(text(),'.Net')]").click
    DotNet.new(@session)
  end

  def click_site_testing_link
    findProject = "//*[@class='findProject shiftingRight subMenuList']"
    @session.find(:xpath, findProject).hover
    @session.find(:xpath, "//*[@class='list-content']/li/a[contains(text(),'Site Testing')]").click
    ActiveProjects.new(@session)
  end

  def click_nerd_digest_link
    @session.find(:xpath, "//*[@class='nerd-digest']").click
    NerdDigest.new(@session)
  end
end
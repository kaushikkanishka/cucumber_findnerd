class ActiveProjects < Base
  def initialize(session)
    @session = session
  end

  def assert_new_project_title_placeholder
    @session.within_frame 'mainiframe' do
      placeholder = @session.find(:xpath, "//*[@id='node_title']")['placeholder']
      expect(placeholder.strip).to eq("Enter Project Title....")
    end
    self
  end

  def click_setup_project_button
    @session.within_frame 'mainiframe' do
      @session.find('#node_title').click
    end
    self
  end

  def assert_new_proj_save_close_btn
    @session.within_frame 'mainiframe' do
      @session.find('#node_title').set('Test new Proj Tiltle')
      expect(@session).to have_css('#saveContent')
      expect(@session).to have_css('.inner_closebtn')
    end
    self
  end

  def enter_new_project_proj_title
    @session.within_frame 'mainiframe' do
      @session.find('#node_title').set('Test new Project Title')
    end
    self
  end

  def click_new_proj_save_btn
    @session.within_frame 'mainiframe' do
      @session.find('#saveContent').click
    end
    self
  end

  def assert_proj_dashboard
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('.dashboard')
    end
    self
  end
end
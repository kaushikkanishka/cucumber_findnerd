class PostProject < Base
  def initialize(session)
    @session = session
  end

  def assert_post_project_elements(table)
    @session.within_frame 'mainiframe' do
    case table
      when 'Hire a freelancer or Tech team!'
        expect(@session).to(have_xpath("//*[@class='techQuery']/h2[contains(text(), 'Hire a freelancer')]"))
      when 'Get instant applications from our database of companies and freelancers.'
        # a = 'Get instant applications from our database of companies and freelancers.'
        expect(@session).to(have_xpath("//*[@class='techQuery']/p[contains(text(), 'Get instant applications')]"))
      when 'Post your requirements.'
        expect(@session).to(have_xpath("//*[@class='techQuery']/ul/li[contains(text(), 'Post your requirements')]"))
      when 'Select teams based on our revolutionary ranking algorithm.'
        # b = 'Select teams based on our revolutionary ranking algorithm.'
        expect(@session).to(have_xpath("//*[@class='techQuery']/ul/li[contains(text(), 'teams based on our revolutionary')]"))
      when 'Manage project sprint, task, bugs through our PM tool.'
        expect(@session).to(have_xpath("//*[@class='techQuery']/ul/li[contains(text(), 'Manage project sprint')]"))
      when 'Manage Team members & Improve productivity using our session tracker.'
        expect(@session).to(have_xpath("//*[@class='techQuery']/ul/li[contains(text(), 'Manage Team members')]"))
      when 'Pay them through safe pay.'
        expect(@session).to(have_xpath("//*[@class='techQuery']/ul/li[contains(text(), 'Pay them through safe pay')]"))
      when 'All of the above @ 0 cost for the first 100 projects.'
        expect(@session).to(have_xpath("//*[@class='techQuery']/ul/li[contains(text(), 'first 100 projects')]"))
      when 'Post Tech Blogs, Tutorials, Reviews or News.'
        expect(@session).to have_xpath("//*[@class='techQuery']/h2[contains(text(), 'Post Tech Blogs, Tutorials')]")
      when 'Earn reputation and improve your web wide tech rank.'
        expect(@session).to have_xpath("//*[@class='techQuery']/p[contains(text(), 'Earn reputation and improve')]")
      when 'Type in your tech analysis, product insights and tech solutions.'
        expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(), 'Type in your tech analysis')]")
      when 'Record your Desktop for better insights.'
        expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(), 'Record your Desktop')]")
      when 'Improve your nerd rank with views and positive vote.'
        expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(), 'Improve your nerd rank with')]")
      when 'More likes get you on our more featured section.'
        expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(), 'More likes get you on')]")
      when 'Nerd points help you engage with perspective employers and earn respect in developer community.'
        expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(), 'Nerd points help you engage')]")
      when 'Stuck In a Tech Issue?'
        expect(@session).to have_xpath("//*[@class='techQuery']/h1[contains(text(),'Stuck In a Tech Issue')]")
      when 'Our community of developers answer them for you.'
        expect(@session).to have_xpath("//*[@class='techQuery']/p[contains(text(),'developers answer them for you')]")
      when 'Type your query & post the code.'
        expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(),'Type your query & post the')]")
      when 'Record Your Desktop to explain better.'
        expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(),'Record Your Desktop')]")
      when 'Upload files.'
        expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(),'Upload files')]")
      when 'Or Simply search through our own search engine.'
        expect(@session).to have_xpath("//*[@class='techQuery']//li[contains(text(),'through our own search engine')]")
      when 'Title'
        expect(@session).to(have_xpath("//*[@class='fields clearfix']/label[contains(@for,'node_title')]"))
      when 'Testing Help icon '
        expect(@session).to(have_css('.helpIcon'))
      when 'Attach Files, Zip etc'
        expect(@session).to(have_xpath("//*[@id='last']/span[contains(text(),'Attach')]"))
      when 'Record From Desktop '
        expect(@session).to(have_xpath("//*[@id='middle']/span[contains(text(),'Record')]"))
      when 'Record From Webcam'
        expect(@session).to(have_xpath("//*[@id='first']/span[contains(text(),'Record')]"))
      when 'Preview Area'
        expect(@session).to(have_css('#wmd-preview'))
      when 'Tags'
        expect(@session).to(have_css('#as-selections-tag'))
      when 'You can create new content after 2 minutes gap of last created content.'
        expect(@session).to(have_xpath("//*[@id='data_err'][contains(text(),'create new content after 2 minutes')]"))
      when 'Preview Button'
        expect(@session).to(have_css('#previewContent'))
      when 'Budget'
        expect(@session).to(have_css('#node_estimatedbudget_id'))
      when 'Duration'
        expect(@session).to(have_css('#node_estimatedduration_id'))
      when 'Hourly Rate'
        expect(@session).to(have_css('#node_estimatedhour_id'))
      when 'Workload'
        expect(@session).to(have_css('#node_estimatedworkload_id'))
      when 'Featured Questions'
        sleep 1
        expect(@session).to have_xpath("//*[@id='disp_questions']/ul")
      when 'Ask Nerds'
        expect(@session).to have_xpath("//*[@id='ask_nerds']/ul")
    end
    end
    self
  end

  def assert_category_dropdown_default_value
    @session.within_frame 'mainiframe' do
    expect(@session).to(have_xpath("//*[@id='node_category_id']/option[1][contains(text(),'Select Category')]"))
    self
      end
  end

  def click_fixed_price_radio_btn
    @session.within_frame 'mainiframe' do
    @session.find('#node_projectype_fixed').click
    self
      end
  end

  def click_hourly_price_radio_btn
    @session.within_frame 'mainiframe' do
    @session.find('#node_projectype_hourly').click
    self
      end
  end

  def assert_company_status_information(value)
    case value
      when 'Our team with No. of developers'
        assert_developers_count
      when 'Who we work with No. of companies'
        assert_companies_count
      when 'Our work No. of projects'
        assert_projects_count
    end
    self
  end

  def assert_developers_count
      @session.within_frame 'mainiframe' do
      expect(@session).to(have_xpath("//*[@class='ourTeam']/h5[contains(text(), 'Our Team')]"))
      dev_count = @session.find('.ourTeam>h4').text.strip
      is_numeric = true if Float(dev_count) rescue false
      expect(is_numeric).to be(true)
      expect(@session).to(have_xpath("//*[@class='ourTeam']/p[contains(text(), 'Developers')]"))
      end
    self
  end

  def assert_companies_count
      @session.within_frame 'mainiframe' do
      expect(@session).to(have_xpath("//*[@class='whoWeWorkWith']/h5[contains(text(), 'Who we work with')]"))
      company_count = @session.find('.whoWeWorkWith>h4').text
      is_numeric = true if Float(company_count) rescue false
      expect(is_numeric).to be(true)
      expect(@session).to(have_xpath("//*[@class='whoWeWorkWith']/p[contains(text(), 'Companies')]"))
      end
    self
  end

  def assert_projects_count
      @session.within_frame 'mainiframe' do
      expect(@session).to(have_xpath("//*[@class='ourWork']/h5[contains(text(), 'Our Work')]"))
      proj_count = @session.find('.ourWork>h4').text
      is_numeric = true if Float(proj_count) rescue false
      expect(is_numeric).to be(true)
      expect(@session).to(have_xpath("//*[@class='ourWork']/p[contains(text(), 'Projects')]"))
      end
    self
  end

  def select_category_from_dropdown(option)
    @session.within_frame 'mainiframe' do
    @session.select option, :from=> 'node_category_id'
    end
    self
  end

  def enter_blog_title(blog_title)

    @session.within_frame 'mainiframe' do
    @session.fill_in 'node_title', :with=> blog_title
    end
    self
  end

  def enter_blog_content(dummy_text)
    jq = "$(\"#mainiframe\").contents().find('.cke_wysiwyg_frame').contents().find('html').find('.cke_contents_ltr');"
    text = @session.evaluate_script(jq)
    @session.within_frame 'mainiframe' do
      @session.within_frame(@session.find('.cke_wysiwyg_frame')) do
        text['0'].send_keys(dummy_text)
      end
    end
    self
  end

  def enter_blog_tags(dummy_tags)
    @session.within_frame 'mainiframe' do
    @session.fill_in 'tag', :with=> dummy_tags
    @session.find('#tag').native.send_keys(:tab)
    end
    self
  end

  def click_preview_button
    @session.within_frame 'mainiframe' do
    @session.find('#previewContent').click
    end
    PublishConfirmationPage.new(@session)
  end

  def select_duration_value(duration_value)
    @session.within_frame 'mainiframe' do
      @session.select duration_value, :from=> 'node_estimatedduration_id'
    end
    self
  end

  def select_budget_value(budget_value)
    @session.within_frame 'mainiframe' do
      @session.select budget_value, :from=> 'node_estimatedbudget_id'
    end
    self
  end

end
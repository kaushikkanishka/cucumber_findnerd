class PostProject < Base
  def initialize(session)
    @session = session
  end

  def assert_post_project_elements(table)
    case table
      when 'Hire a freelancer or Tech team!'
        expect(@session).to(have_css('.techQuery>h2', text: 'Hire a freelancer or Tech team!'))
      when 'Get instant applications from our database of companies and freelancers.'
        a = 'Get instant applications from our database of companies and freelancers.'
        expect(@session).to(have_css('.techQuery>p'), text: a)
      when 'Post your requirements.'
        expect(@session).to(have_css('.techQuery>ul>li:nth-child(1)'), text: 'Post your requirements.')
      when 'Select teams based on our revolutionary ranking algorithm.'
        b = 'Select teams based on our revolutionary ranking algorithm.'
        expect(@session).to(have_css('.techQuery>ul>li:nth-child(2)'), text: b)
      when 'Manage project sprint, task, bugs through our PM tool.'
        c = 'Manage project sprint, task, bugs through our PM tool.'
        expect(@session).to(have_css('.techQuery>ul>li:nth-child(3)'), text: c)
      when 'Manage Team members & Improve productivity using our session tracker.'
        d = 'Manage Team members & Improve productivity using our session tracker.'
        expect(@session).to(have_css('.techQuery>ul>li:nth-child(4)'), text: d)
      when 'Pay them through safe pay.'
        e = 'Pay them through safe pay.'
        expect(@session).to(have_css('.techQuery>ul>li:nth-child(5)'), text: e)
      when 'All of the above @ 0 cost for the first 100 projects.'
        f = 'All of the above @ 0 cost for the first 100 projects.'
        expect(@session).to(have_css('.techQuery>ul>li:nth-child(6)'), text: f)
      when 'Title'
        expect(@session).to(have_css('.fields.clearfix>label'), text: 'Title')
      when 'Testing Help icon '
        expect(@session).to(have_css('.helpIcon'))
      when 'Attach Files, Zip etc'
        expect(@session).to(have_css('#last>span'), text: 'Attach')
      when 'Record From Desktop '
        expect(@session).to(have_css('#middle>span'), text: 'Record')
      when 'Record From Webcam'
        expect(@session).to(have_css('#first>strong'), text: 'From Webcam')
      when 'Preview Area'
        expect(@session).to(have_css('#wmd-preview'))
      when 'Tags'
        expect(@session).to(have_css('#as-selections-tag'))
      when 'You can create new content after 2 minutes gap of last created content.'
        g = '* You can create new content after 2 minutes gap of last created content.'
        expect(@session).to(have_css('#data_err'), text: g.strip)
      when 'Preview Button'
        expect(@session).to(have_css('#previewContent'), text: 'Preview')
      when 'Budget'
        expect(@session).to(have_css('#node_estimatedbudget_id'))
      when 'Duration'
        expect(@session).to(have_css('#node_estimatedduration_id'))
      when 'Hourly Rate'
        expect(@session).to(have_css('#node_estimatedhour_id'))
      when 'Workload'
        expect(@session).to(have_css('#node_estimatedworkload_id'))
    end
    self
  end

  def assert_category_dropdown_default_value
    expect(@session).to(have_css('#node_category_id>option:nth-child(1)'), text: 'Select Category')
    self
  end

  def click_fixed_price_radio_btn
    find('#node_projectype_fixed').click
    self
  end

  def click_hourly_price_radio_btn
    find('#node_projectype_hourly').click
    self
  end

  def assert_company_status_information(value)
    case value
      when 'Our team with No. of developers'
        @session.assert_developers_count
      when 'Who we work with No. of companies'
        @session.assert_companies_count
      when 'Our work No. of projects'
        @session.assert_projects_count
    end
    self
  end
end
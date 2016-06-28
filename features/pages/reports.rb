class Reports < Base
  def initialize(session)
    @session = session
  end

  def select_report_year(arg)
    arg1 = arg.to_i
    @session.within_frame 'mainiframe' do
      year = @session.find(:xpath, "//*[@class='calenderReport']/h2/strong").text.to_i
      if year != arg1.to_i
        while year != arg1 do
          if year < arg1
            @session.find(:xpath, "//*[@class='calenderReport']/h2/span[@class='rightArrow']").click
            year += 1
          else
            @session.find(:xpath, "//*[@class='calenderReport']/h2/span[@class='leftArrow']").click
            year -= 1
          end
        end
      end
    end
    self
  end

  def select_report_month(arg2)
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, ".//*[@class='calenderReport']//td[contains(text(),'#{arg2}')]").click
    end
    self
  end

  def search_project_reports_page(project)
    @session.within_frame 'mainiframe' do
      @session.find('#searchProject').set(project)
    end
    self
  end

  def select_project_reports_page(project)
    @session.within_frame 'mainiframe' do
      @session.find(:xpath, "//*[@class='sideBarUserListing']//li/input[@name='#{project}']").set(true)
    end
    self
  end

  def assert_tabular_view
    jq = "$(\"#mainiframe\").contents().find('#tabularCalendar.active').text();"
    expect(@session.evaluate_script(jq).gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')).to(be == 'Tabular View')
    self
  end

  def assert_report_first_row(option)
    @session.within_frame 'mainiframe' do
      case option
        when 'selected Month with Dark Grey Background'
          a = @session.find(:xpath, "//*[@id='tabCalendar']/div[@class='month']/p").text.strip
          b = @session.find(:xpath, "//*[@class='calenderReport']//td[@class='active']").text.strip
          expect(a).to eq(b)
          path = "//*[@id='tabCalendar']/div[@class='month']/p"
          #put delimiter infront use split(/(?=[,])/)
          #put delimiter at end use split(/(?<=[,])/)
          css = @session.find(:xpath, path).native.css_value('background-color').split(/(?=[(])/)
          new_color = css[1].tr('()', '').split(",")
          bg_color = "#%02X%02X%02X" % new_color
          expect(bg_color).to eq('#666666')
        when 'Date of selected month'
          expect(@session).to have_xpath("//*[@class='calList']//table//tr[1]/td[@colspan = '1']")
        when 'Total in last'
          sleep 1
          expect(@session).to have_xpath("//*[@class='totalHoursCal']/p", visible: false)
      end
    end
    self
  end

  def assert_project_members
    @session.within_frame 'mainiframe' do
      @array1 = Array.new
      @array2 = Array.new
      sleep 1
      c = "input[@type='checkbox'][@checked='checked'][not(contains(@name, 'allUsers'))]"
      @session.all(:xpath, "//*[@id='projUserListing']//#{c}/following-sibling::span").each do |a|
        @array1.push a.text
      end
      sleep 3
      @session.all(:xpath, ".//*[@id='tabCalendar']//ul[@class='tabReportUl']/li[@class='empName']").each do |b|
        @array2.push b.text
      end
    end
    expect(@array1).to match_array(@array2)
    self
  end

  def assert_weekly_hours_block
    @session.within_frame 'mainiframe' do
      expect(@session).to have_css('.weeklyHrs')
    end
    self
  end

  def assert_calander_middle_section(option)
    @session.within_frame 'mainiframe' do
      case option
        when 'Effort Hours in every Date block with zero as default'
          year = @session.find(:xpath, "//*[@class='calenderReport']/h2/strong").text.to_i
          while year != (Time.now.year + 1) do
            @session.find(:xpath, "//*[@class='calenderReport']/h2/span[@class='rightArrow']").click
            year += 1
          end
          @session.all('.weekHours').each do |a|
            expect(a.text).to eq('0.0')
          end
        when 'Date block background colour as Green for working day'
          path = "//*[@class='hoursDayCal']/td[@colspan='1'][not(contains(@class,'weekend'))]"
          @session.all(:xpath, path).each do |a|
            css = a.native.css_value('background-color').split(/(?=[(])/)
            new_color = css[1].tr('()', '').split(",")
            bg_color = "#%02X%02X%02X" % new_color
            expect(bg_color).to eq('#C8E8CA')
          end
        when 'Date block background colour as Grey for weekends'
          path = "//*[@class='hoursDayCal']/td[@class='weekend']"
          @session.all(:xpath, path).each do |a|
            css = a.native.css_value('background-color').split(/(?=[(])/)
            new_color = css[1].tr('()', '').split(",")
            bg_color = "#%02X%02X%02X" % new_color
            expect(bg_color).to eq('#858585')
          end
        when 'Sa and Su abbreviations for weekends'
          @array1 = Array.new
          path = "//*[@class='hoursDayCal']/td[@class='weekend'][contains(text(),'Sa') or contains(text(),'Su')]"
          @session.all(:xpath, path).each do |a|
            @array1.push a.text
          end
          expect(@array1).to include('Sa', 'Su')
        when 'Total effort for each block in front of Weekly Hours'

          @array4 = Array.new
          @array3 = Array.new
          @session.all('.weeklyHrs').each do |a|
            @array3.push a.text
          end
          @employee_count = @array3.count
          while @employee_count > 0 do
            xpath = "//*[@class='hoursDayCal'][#{@employee_count}]/following-sibling::tr[1]/td[@class='weekHours']"
            @session.all(:xpath, xpath).each do |a|
              counter = 0.0
              @weekHours = counter + a.text.to_f
            end
            weekHoursCount_xpath = "//*[@class='hoursCal']/ul/li[#{@employee_count}]"
            weekHoursCount = @session.find(:xpath, weekHoursCount_xpath, visible: false).text.to_f
            expect(@weekHours).to eq(weekHoursCount)
            @employee_count -= 1
          end
        when 'Week default value should be 0.0'
          year = @session.find(:xpath, "//*[@class='calenderReport']/h2/strong").text.to_i
          while year != (Time.now.year + 1) do
              @session.find(:xpath, "//*[@class='calenderReport']/h2/span[@class='rightArrow']").click
              year += 1
          end
          @array3 = Array.new
          @session.all('.weeklyHrs').each do |a|
            @array3.push a.text
          end
          @emp_count = @array3.count
          @session.all(:xpath, "//*[@class='hoursCal']//li[#{@emp_count}]").each do |a|
            expect(a.text).to eq('0.0')
          end
      end
    end
    self
  end

  def assert_total_worked_hours
    @session.within_frame 'mainiframe' do
      hours_sum = 0
      @session.all(:xpath, "//*[@class='totalMonthlyHours']/preceding-sibling::li", visible: false).each do |a|
        hours_sum = hours_sum + a.text.to_f
      end
      expect(hours_sum).to eq(@session.find('.totalMonthlyHours', visible: false).text.to_f)
    end
    self
  end

  def assert_default_total_worked_hours
    @session.within_frame 'mainiframe' do
      year = @session.find(:xpath, "//*[@class='calenderReport']/h2/strong").text.to_i
      while year != (Time.now.year + 1) do
        @session.find(:xpath, "//*[@class='calenderReport']/h2/span[@class='rightArrow']").click
        year += 1
      end
      expect(@session.find('.totalMonthlyHours', visible: false).text).to eq('0.0')
    end
    self
  end
end
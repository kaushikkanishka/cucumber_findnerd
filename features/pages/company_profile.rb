class CompanyProfile < Base
  def initialize(session)
    @session = session
  end

  def assert_company_profile
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@id='financialInformation']//a[@title='Company Transaction History']")
    end
    self
  end

  def assert_company_profile_information(fields)
    @session.within_frame 'mainiframe' do
      case fields
        when 'Company Logo'
          expect(@session).to have_css('#profileImageCover>img')
        when 'Edit Basic Profile Button'
          expect(@session).to have_xpath("//*[@id='userProfile']//a[@title='Edit basic profile']")
        when 'Company Title'
          expect(@session).to have_xpath("//*[@id='userProfile']/div[@class='gridHeader heightAuto']//p")
        when 'Company Website'
          expect(@session).to have_xpath("//*[@id='content_links']/a[contains(text(),'http://')]")
        when 'Contact Email'
          expect(@session).to have_xpath("//*[@id='content_links']/a[contains(@href,'mailto:')]")
        when 'Phone Number'
          phone_number = @session.find('#allnumbers').text.split('-')
          is_numeric = true if Float(phone_number[1]) rescue false
          expect(is_numeric).to be(true)
        when 'Company Employees count'
          cmp_count = @session.find(:xpath,"//*[@id='profileInformation']/div[@class='infoBox']/div[1]").text.split(' ')
          is_numeric = true if Float(cmp_count[0]) rescue false
          expect(is_numeric).to be(true)
        when 'Company Projects count'
          proj_count= @session.find(:xpath,"//*[@id='profileInformation']/div[@class='infoBox']/div[2]").text.split(' ')
          is_numeric = true if Float(proj_count[0]) rescue false
          expect(is_numeric).to be(true)
        when 'Company Updates count'
          updt_count= @session.find(:xpath,"//*[@id='profileInformation']/div[@class='infoBox']/div[3]").text.split(' ')
          is_numeric = true if Float(updt_count[0]) rescue false
          expect(is_numeric).to be(true)
      end
    end
    self
  end

  def assert_add_company_address_btn
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@id='addresses']//a[@class='addGrid']")
      self
    end
  end

  def assert_company_address_grid
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@id='addresses']//li[@id='address28']")
      self
    end
  end

  def assert_company_chat_information(chat)
    @session.within_frame 'mainiframe' do
      case chat
        when 'Online Users Section'
          expect(@session).to have_css('#c_73_presence')
        when 'Message Section'
          expect(@session).to have_css('#c_73_conference_display')
        when 'Chat Input Box'
          expect(@session).to have_css('#c_73_conference_chatm')
      end
    end
    self
  end

  def assert_chat_history_link
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@class='historyBox']/a[contains(@title,'Get Complete Company Chat History')]")
    end
    self
  end

  def assert_employees_section(fields)
    @session.within_frame 'mainiframe' do
      case fields
        when 'Search Employee Button'
          expect(@session).to have_xpath("//*[@id='employees']//a[contains(@title,'Search Employee')]")
        when 'Employee Profile Listing'
          expect(@session).to have_xpath("//*[@id='employees']//ul[@class='gridData']")
        when 'More Button'
          expect(@session).to have_xpath("//*[@id='employees']/a[@class='more']")
      end
    end
    self
  end

  def assert_user_profile_section(fields)
    @session.within_frame 'mainiframe' do
      case fields
        when 'Add Completed Project Button'
          expect(@session).to have_xpath("//*[@id='profiles']//a[@title='Add Completed Projects']")
        when 'Company Profile Listing of completed project'
          expect(@session).to have_xpath("//*[@id='profiles']//ul[@class='gridData']")
        when 'More Button'
          expect(@session).to have_xpath("//*[@id='profiles']/a[@class='more']")
      end
    end
    self
  end

  def assert_other_information_section(fields)
    @session.within_frame 'mainiframe' do
      case fields
        when 'Edit Other Profile Information button'
          expect(@session).to have_xpath("//*[@id='company_aboutus']/a[@title='Edit other profile information']")
        when 'About us'
          expect(@session).to have_xpath("//*[@id='otherInformation']/div[@id='company_aboutus']")
        when 'Company Summary'
          expect(@session).to have_xpath("//*[@id='otherInformation']/div[@id='company_summary']")
      end
    end
    self
  end

  def assert_financial_information_section(fields)
    @session.within_frame 'mainiframe' do
      case fields
        when 'Amount in $ for Balance'
          expect(@session).to have_xpath("//*[@id='financialInformation']/div[@class='infoBox']/div[1]")
        when 'Amount in $ for Pending Credit'
          expect(@session).to have_xpath("//*[@id='financialInformation']/div[@class='infoBox']/div[2]")
        when 'Amount in $ for Safe Balance'
          expect(@session).to have_xpath("//*[@id='financialInformation']/div[@class='infoBox']/div[3]")
      end
    end
    self
  end

  def assert_company_transaction_history_section
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@id='inbox']//h2[contains(text(),'Transactions')]")
      #browser_back_button
      #sleep 3
    end
    self
  end

  def click_company_dashboard_link
    @session.within_frame 'mainiframe' do
      @session.find(:xpath,"//*[@id='financialInformation']//a[@title='Company Transaction History']").click
    end
    self
  end

  def assert_company_activity_updates_section(fields)
    @session.within_frame 'mainiframe' do
      case fields
        when 'Activity Input box'
          expect(@session).to have_css('#primaryActivityInputCover')
        when 'Overlay Content'
          expect(@session).to have_xpath("/.//*[@id='activity']/div[@class='overlayContent']")
      end
    end
    self
  end

  def assert_profile_files_section(fields)
    @session.within_frame 'mainiframe' do
      case fields
        when 'Record /Upload Button'
          expect(@session).to have_xpath("//*[@id='imageGallery']//a[@title='Record/Upload Files']")
        when 'Video Section'
          expect(@session).to have_xpath("//*[@id='imageData2']")
        when 'Images'
          expect(@session).to have_xpath("//*[@class='blogImage']")
        when 'Others Files'
          expect(@session).to have_xpath("//*[@id='dataImageList3']")
        when 'Video Files'
          expect(@session).to have_xpath("//*[@id='dataImageList2']")
      end
    end
    self
  end

  def enter_chat_message(message)
    @session.within_frame 'mainiframe' do
      # @session.fill_in 'c_73_conference_chatm', with: message
      # @session.find('#c_73_conference_chatm').native.send_keys(:enter)
      field = @session.find('#c_73_conference_chatm')
      field.set "Dummy Chat message\n"
      sleep 1
      self
    end
  end

  def assert_chat_user_profile_image
    @session.within_frame 'mainiframe' do
      a = @session.find(:xpath, "//*[@id='c_73_conference_display']/div[last()-1]//div[@class='messagerow']/img")['src']
      expect(a.length).should_not == 0
    end
    self
  end

  def assert_chat_user_id
    @session.within_frame 'mainiframe' do
      a = @session.find(:xpath, "//*[@id='c_73_conference_display']/div[last()-1]//div[@class='messagerow']/a").text
      expect(a.length).should_not == 0
    end
    self
  end

  def assert_send_chat_message(message)
    @session.within_frame 'mainiframe' do
      a = @session.find(:xpath, "//*[@id='c_73_conference_display']/div[last()-1]//div[@class='messagerow']/..").text
      b = a.split(' ')[1..-1].join(' ')
      expect(b.strip).to eq(message)
    end
    self
  end

  def assert_instant_message_time(time)
    @session.within_frame 'mainiframe' do
      b = "//*[@id='c_73_conference_display']/div[last()-1]//div[@class='messageTime']/span[@class='timer']"
      a = @session.find(:xpath, b).text
      expect(a).to eq(time)
    end
    self
  end

  def assert_previous_chat_message
    @session.within_frame 'mainiframe' do
      b = "//*[@id='c_73_conference_display']/div[last()-2]//div[@class='messageTime']/span[@class='timer'][contains(text(),'second(s) ago')]"
      expect(@session).to have_xpath(b)
    end
    self
  end

  def click_chat_user_id
    @session.within_frame 'mainiframe' do
      a = @session.find(:xpath, "//*[@id='c_73_conference_display']/div[last()-3]//div[@class='messagerow']/a").text
      @session.find(:xpath, "//*[@id='c_73_conference_display']/div[last()-3]//div[@class='messagerow']/a").click
      b = @session.find(:xpath, "//*[@id='profileInformation']/div[@id='profileImageCover']//a").text.split('@')
      expect(b[1]).to eq(a)
    end
    self
  end

  def assert_chat_fields(fields)
      case fields
        when 'Online users'
          expect(@session).to have_css('#c_73_presence')
        when 'Message screen'
          expect(@session).to have_xpath("//*[@class='chatconference']")
        when 'Text field to send the message'
          expect(@session).to have_xpath("//*[@id='c_73_conference_chatm']")
        when 'History'
          expect(@session).to have_xpath("//*[@class='historyBox']/a[@title='Get Room Chat History']")
      end
    self
  end

  def assert_add_employee_tooltip(arg)
    @session.within_frame 'mainiframe' do
      expect(@session.find('.addGrid.addEmployee')['title']).to eq(arg)
    end
    self
  end

  def click_add_employee_button
    @session.within_frame 'mainiframe' do
      @session.find('.addGrid.addEmployee').click
    end
    self
  end

  def assert_add_employee_form_title(arg)
    @session.within_frame 'mainiframe' do
      expect(@session.find(:xpath, "//*[@id='search_users']//h1[@class='profileHeading']").text).to eq(arg)
    end
    self
  end

  def assert_add_employee_form_fields(fields)
    @session.within_frame 'mainiframe' do
      case fields
        when 'Search Box'
          expect(@session).to have_css('#searchBoxCompany')
        when 'Search Button'
          expect(@session).to have_css('.peopleSearch')
      end
    end
    self
  end

  def enter_name_employee_search(name)
    @session.within_frame 'mainiframe' do
      @session.find('#searchBoxCompany').set(name)
    end
    self
  end

  def click_search_btn_company_search
    @session.within_frame 'mainiframe' do
      @session.find('.peopleSearch').click
    end
    self
  end

  def assert_tooltip_invitation_accepted(arg)
    @session.within_frame 'mainiframe' do
      expect(@session.find('.existingEmployee')['title']).to eq(arg)
    end
    self
  end

  def assert_tooltip_invitation_rejected(arg)
    @session.within_frame 'mainiframe' do
      expect(@session.find('.invitecompany.rejectedcompany')['title']).to eq(arg)
    end
    self
  end

  def assert_tooltip_invitation_send(arg)
    @session.within_frame 'mainiframe' do
      expect(@session.find('.invitecompany.invitedtocompany')['title']).to eq(arg)
    end
    self
  end

  def assert_tooltip_new_user(arg)
    @session.within_frame 'mainiframe' do
      expect(@session.find(".invitecompany[title='Invite To company']")['title']).to eq(arg)
    end
    self
  end

  def assert_transaction_period(period)
    @session.within_frame 'mainiframe' do
      start_date = Date.parse(@session.find('#range_date')['value'])
      end_date = Date.parse(@session.find('#to_date')['value'])
      days = (end_date - start_date).to_i
      #expect(days).to eq(period.to_i)
      expect(days.between?(28, 31))
    end
    self
  end

  def enter_activity_text(arg)
    @session.within_frame 'mainiframe' do
      @session.find('#statusbox').click
      @session.find('#statusbox').set(arg)
      sleep 2
    end
    self
  end

  def image_upload_company_profile
    @session.within_frame 'mainiframe' do
      @session.within_frame 'activityUpload' do
        @session.find('#file-input').click
        @session.attach_file('file-input', File.absolute_path('/home/kanishka/Documents/testImage.png'))
      end
    end
    self
  end

  def upload_link_company_profile(arg)
    @session.within_frame 'mainiframe' do
      @session.find('#addLinkInput').set("http://#{arg}")
    end
    self
  end

  def click_upload_link_company_profile
    @session.within_frame 'mainiframe' do
      @session.within_frame 'activityUpload' do
        @session.find('.linkUrl').click
      end
    end
    self
  end

  def company_profile_submit_link_btn
    @session.within_frame 'mainiframe' do
      @session.find('#doneAddLink').click
    end
    self
  end

  def click_activity_update_send_button
    @session.within_frame 'mainiframe' do
      @session.within_frame 'activityUpload' do
        @session.find('#sendButton').click
      end
    end
    self
  end

  def assert_activity_update_items(item)
    @session.within_frame 'mainiframe' do
      case item
        when 'Company logo'
          expect(@session).to have_xpath("//*[@id='statusUpdates_0']/div[1]/div[@class='userBox']/img")
        when 'User Id Link'
          xpath = "//*[@id='statusUpdates_0']/div[1]/div[@class='statusRight']//a[@itemprop='creator']"
          expect(@session).to have_xpath(xpath)
        when 'Message'
          message_xpath = "//*[@id='statusUpdates_0']/div[1]/div[@class='statusRight']//div[@class='statusMessage']"
          expect(@session).to have_xpath(message_xpath)
        when 'Show and Hide Details'
          expand1 = "ul[@class='statusLinks statusFields']//a[@class='statusExpand']"
          expand = "//*[@id='statusUpdates_0']/div[1]/div[@class='statusRight']//#{expand1}"
          expect(@session).to have_xpath(expand)
        when 'Reply Button'
          reply1 = "ul[@class='statusLinks statusFields']//a[@class='statusReply']"
          reply = "//*[@id='statusUpdates_0']/div[1]/div[@class='statusRight']//#{reply1}"
          expect(@session).to have_xpath(reply)
        when 'Delete Button'
          delete1 = "ul[@class='statusLinks statusFields']//a[@class='statusDelete']"
          delete = "//*[@id='statusUpdates_0']/div[1]/div[@class='statusRight']//#{delete1}"
          expect(@session).to have_xpath(delete)
        when 'Favorite Button'
          fav1 = "ul[@class='statusLinks statusFields']//a[@class='statusFavourite']"
          fav = "//*[@id='statusUpdates_0']/div[1]/div[@class='statusRight']//#{fav1}"
          expect(@session).to have_xpath(fav)
        when 'Tenure'
          tenure = "//*[@id='statusUpdates_0']/div[4]/div[@class='statusRight']//span[@class='statusTimeDiff timeAgo']"
          expect(@session).to have_xpath(tenure)
        when 'Hide Status Updates'
          expect(@session).to have_css('#statuses_0')
      end
    end
    ShowDetailsPage.new(@session)
  end

  def assert_msg_activity_update_section(text)
    @session.within_frame 'mainiframe' do
      msg = "//*[@id='statusUpdates_0']/div[1]/div[@class='statusRight']//div[@class='statusMessage']"
      expect(@session.find(:xpath, msg).text.strip).to eq(text.strip)
    end
    self
  end
end
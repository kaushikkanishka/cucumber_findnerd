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
      @session.find(:xpath,"//*[@id='financialInformation']//a[@title='Company Transaction History']").click
      expect(@session).to have_xpath("//*[@id='inbox']//h2[contains(text(),'Transactions')]")
      browser_back_button
      sleep 3
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
end
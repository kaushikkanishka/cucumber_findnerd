class Draft < Base
  def initialize(session)
    @session = session
  end

  def click_recent_project
    @session.within_frame 'mainiframe' do
      @session.find('.span4:first-child > .itemContent > h4 > a').click
    end
    PublishConfirmationPage.new(@session)
  end
end
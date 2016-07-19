class TuteSet < Base
  def initialize(session)
    @session = session
  end

  def assert_zero_tuteset_message
    @session.within_frame 'mainiframe' do
      expect(@session).to have_xpath("//*[@id='leftContent']/p[contains(text(), 'No Tuteset found !!')]")
    end
    self
  end
end
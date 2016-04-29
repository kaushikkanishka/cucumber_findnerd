class Homepage < Base
  def initialize(session)
    @session = session
  end
  def assert_homepage_links(navigation_link)
    case navigation_link
      when 'Findnerd Logo'
        expect(@session).to(have_css('.homelogo'))
      when 'Nerd Digest'
        expect(@session).to(have_css('.clr>li>a', text: 'Nerd Digest'))
      when 'Tech QnA'
        expect(@session).to(have_css('.clr>li>a', text: 'Tech Q&A'))
      when 'Find Projects'
        expect(@session).to(have_css('.clr>li>a', text: 'Find Projects'))
      when 'Sign In'
        expect(@session).to(have_css('.sign>a'))
      when 'Register'
        expect(@session).to(have_css('.register>a'))
    end
    self
  end
end
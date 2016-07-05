class TopNavigation < Base
  def initialize(session)
    @session = session
  end

  def click_post_blog_link
    @session.find(:xpath, "//*[@class='postBlogs']/..").click
    PostProject.new(@session)
  end


end
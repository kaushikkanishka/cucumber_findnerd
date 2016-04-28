class Login < Base

  def initialize(session)
    puts "before #{session}"
    @session = session
    puts "after #{@session}"
  end
end
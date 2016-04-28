class Base

  def open_site

    puts read_url ENV['ENVIRONMENT']
    puts "Inside open site #{@session.class}"
    @session.visit read_url ENV['ENVIRONMENT']
  end

  def read_url(env)
    urls = YAML.load_file(File.dirname(__FILE__) + '/../../lib/urls.yml')
    urls['URLS'][env]
  end
end
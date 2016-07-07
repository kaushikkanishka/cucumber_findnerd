require 'require_all'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'sauce/cucumber'
require 'yaml'
require 'capybara-screenshot/cucumber'
require 'capybara/rspec'
require 'net/imap'
require 'mail'
require 'capybara/email'
require 'capybara/email/rspec'
require 'gmail'
require 'date'
require 'parallel_tests'

#require_rel './../mixins/*.rb'
require_rel './../pages/*.rb'

ENV['BROWSER'] ||= 'firefox'
ENV['ENVIRONMENT'] ||= 'stage'
ENV['SCREENSHOTS'] ||= 'NO'




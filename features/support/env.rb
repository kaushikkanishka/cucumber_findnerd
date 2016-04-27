require 'require_all'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'yaml'
require 'capybara/rspec'
require 'capybara-screenshot/cucumber'

require_rel './../pages/*.rb'
require_all './../mixins/*.rb'

ENV['BROWSER'] ||= 'firefox'
ENV['ENVIRONMENT'] ||= 'staging'
ENV['SCREENSHOTS'] ||= 'NO'

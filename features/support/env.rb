require "appium_lib"
require "cucumber"
require "pry"
require "rspec"
require "rake"
require "allure-cucumber"
require_relative "../interface/interfaceFramework"
require_relative "page_helper"

include AllureCucumber::DSL

AllureCucumber.configure do |c|
  c.output_dir = "allure"
end

Cucumber::Core::Test::Step.module_eval do
  def name
    return text if text == "Before hook"
    return text if text == "After hook"

    "#{source.last.keyword}#{text}"
  end
end

def caps
  {
    caps: {
      deviceName: "0036129605",
      platformName: "Android",
      appPackage: "br.com.icarros.androidapp",
      appActivity: "br.com.icarros.androidapp.ui.SplashActivity",
      automationName: "UiAutomator2",
      autoGrantPermissions: true,
      autoAcceptAlerts: true,
      newCommandTimeout: 2000,
      autoWebviewTimeout: 4000,
      skipServerInstallation: true,
      skipDeviceInitialization: true,
      disableWindowAnimation: true,
      ignoreUnimportantViews: true,
      disableAndroidWatchers: true,
      noReset: true,
      fullReset: false,
    },
    appium_lib: {
      wait_timeout: 60,
    },
  }
end

$ambiente = ENV["AMBIENTE"]

$driver = Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
$timeout = 120

# carrega os dados do login
$login = YAML.load_file("data/login.yml")

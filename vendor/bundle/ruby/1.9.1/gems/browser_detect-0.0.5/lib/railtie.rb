# lib/browser_detect/railtie.rb
module BrowserDetectHelper
	class Railtie < Rails::Railtie
    initializer "browser_detect.configure_rails_initialization" do
      ApplicationController.send(:include, BrowserDetect)
    end

	end
end

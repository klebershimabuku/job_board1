if Rails::VERSION::MAJOR == 2
	ActionView::Base.send(:include, BrowserDetect)
else
	require "railtie" if defined?(Rails)
end

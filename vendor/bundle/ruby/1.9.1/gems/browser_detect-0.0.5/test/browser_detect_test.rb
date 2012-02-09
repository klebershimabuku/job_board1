require File.expand_path(File.dirname(__FILE__)+'/test_helper')
require '../lib/browser_detect'

class BrowserDetectTest < Test::Unit::TestCase
  fixtures :user_agents
  
  def mock_browser(ua=nil)
    BrowserDetectMock.new(ua)
  end
  
  must "deal with nil user agent gracefully" do
    assert_nothing_raised do
      mock_browser.browser_is?('something')
    end
  end
  
  must "correctly mock a user agent string" do
    mock = mock_browser("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)")
    assert_equal("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)", mock.request.env['HTTP_USER_AGENT'])
  end
  
  must "identify googlebot" do
    mock = mock_browser("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)")
    assert(mock.browser_is?('googlebot'))
  end
  
  must "correctly identify known user agents" do
    user_agents(:browsers).each do |browser|
      mock = mock_browser(browser['ua'])
      browser['name'].each do |name|
        assert(mock.browser_is?(name), "Browser '#{browser['nickname']}' did not match name '#{name}'!")
      end
    end
  end
  
  must "correctly identify webkit versions" do
    mock = mock_browser("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_7; en-us) AppleWebKit/533.4 (KHTML, like Gecko) Version/4.1 Safari/533.4")
    assert(mock.browser_is?('webkit'))
    assert_equal(533.4, mock.browser_webkit_version)
  end
  
  must "not identify chrome as safari" do
    mock = mock_browser("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_1) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.81 Safari/535.2")
    assert(mock.browser_is?('webkit'))
    assert_equal(false, mock.browser_is?('safari'))
    assert(mock.browser_is?('chrome'))
    
    assert_equal(535.2, mock.browser_webkit_version)
  end

  must "handle strange user agent strings for iOS apps" do
    mock = mock_browser("Times/(null) (iPad; http://www.acrylicapps.com/pulp/)")
    assert(mock.browser_is?('ios'))
    assert(mock.browser_is?('webkit'))
    assert_equal(0, mock.browser_webkit_version)
  end
end

class BrowserDetectMock
  include BrowserDetect

  def initialize(user_agent=nil)
    @user_agent = user_agent
  end

  def request
    @req ||= mock_req
  end

  def mock_req
    req = Object.new
    metaclass = class << req; self; end
    user_agent = @user_agent
    metaclass.send :define_method, :env, Proc.new { {'HTTP_USER_AGENT' => user_agent} }
    req
  end  
end

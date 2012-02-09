# Browser Detect
_It's like a crystal ball for user agents._

Browser Detect identifies the client browser using the user agent string that was supplied in the page request. Browser Detect searches the user agent string for any string you provide, and it also supports some special groupings and shortcuts:

  * ie (Any version of IE, excluding browsers like Opera and WebTV that identify themselves as IE)
  * ie{integer} (A specific major version of IE — "ie6", "ie7", "ie8", etc.)
  * robot (Google bot, MSN bot, Yahoo! bot)
  * ios (iPhone, iPod, iPad)
  * webkit (Any WebKit based browser)
  * mobile (Any modern mobile browser — iOS, Android, Palm webOS)

## Install it.

Using Bundler, all you need to do is add the source to your Gemfile:

	gem "browser_detect"

Then run:

	bundle install

or, install it as a plugin using Rails 2:

	script/plugin install git://github.com/traction/browser_detect.git

## Wield it.

To check if a particular browser made the request, use browser_is?(name)

	def index
		if browser_is?("chrome")
			# load some chrome-specific content
		end
	end

or in a view:

	<%= browser_is?(:chrome) ? "secrets" : "buzz off" %>

Don't forget you can use the special groupings listed above to target IE, robots, iOS, etc.

	<%= stylesheet_link_tag "ugly_styles" if browser_is?('ie') %>
	<%= stylesheet_link_tag "even_uglier_styles" if browser_is?('ie6') %>
	<%= render "seo_spam_content" if browser_is?('robot') %>

There's also a convenience method `browser_is_mobile?` which is just a shortcut to `browser_is?('mobile')`

	def index
		if browser_is_mobile?
			# redirect to the mobile site
		end
	end

For WebKit-based browsers, you can also check the WebKit version using `browser_webkit_version`. This can be useful for determining what rendering capabilities the browser has. For instance, early versions of Mobile WebKit crash intermittently when you use multiple faces or weights of web fonts. So you might prevent your web fonts from rendering on old WebKit versions:

	<%= stylesheet_link_tag "fonts" unless (browser_is?('ios') and browser_webkit_version < 532) %>

## Contribute!

Additions to the text fixtures (list of user agent strings for testing) are always welcome, as are new definitions of browser groupings. Please fork and submit a pull request!

## Authors

Originally based on work by [rlivsey](http://github.com/rlivsey). Current contributors:

  * [faunzy](http://github.com/faunzy)
  * [ggilder](http://github.com/ggilder)
  * [tmlee](http://github.com/tmlee)

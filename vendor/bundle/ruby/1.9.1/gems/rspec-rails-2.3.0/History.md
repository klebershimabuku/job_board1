## rspec-rails-2 release history

### 2.3.0 / 2010-12-12

[full changelog](http://github.com/rspec/rspec-rails/compare/v2.2.1...v2.3.0)

* Changes
  * Generator no longer generates autotest/autodiscover.rb, as it is no longer
    needed (as of rspec-core-2.3.0)

### 2.2.1 / 2010-12-01

[full changelog](http://github.com/rspec/rspec-rails/compare/v2.2.0...v2.2.1)

* Bug fixes
  * Depend on railties, activesupport, and actionpack instead of rails (Piotr
    Solnica)
  * Got webrat integration working properly across different types of specs

* Deprecations
  * --webrat-matchers flag for generators is deprecated. use --webrat instead.

### 2.2.0 / 2010-11-28

[full changelog](http://github.com/rspec/rspec-rails/compare/v2.1.0...v2.2.0)

* Enhancements
  * Added stub_template in view specs

* Bug fixes
  * Properly include helpers in views (Jonathan del Strother)
  * Fix bug in which method missing led to a stack overflow
  * Fix stack overflow in request specs with open_session
  * Fix stack overflow in any spec when method_missing was invoked
  * Add gem dependency on rails ~> 3.0.0 (ensures bundler won't install
    rspec-rails-2 with rails-2 apps).

### 2.1.0 / 2010-11-07

[full changelog](http://github.com/rspec/rspec-rails/compare/v2.0.1...v2.1.0)

* Enhancements
  * Move errors_on to ActiveModel to support other AM-compliant ORMs

* Bug fixes
  * Check for presence of ActiveRecord instead of checking Rails config
    (gets rspec out of the way of multiple ORMs in the same app)

### 2.0.1 / 2010-10-15

[full changelog](http://github.com/rspec/rspec-rails/compare/v2.0.0...v2.0.1)

* Enhancements
  * Add option to not generate request spec (--skip-request-specs)

* Bug fixes
  * Updated the mock_[model] method generated in controller specs so it adds
    any stubs submitted each time it is called.
  * Fixed bug where view assigns weren't making it to the view in view specs in Rails-3.0.1.
    (Emanuele Vicentini)

### 2.0.0 / 2010-10-10

[full changelog](https://github.com/rspec/rspec-rails/compare/ea6bdef...v2.0.0)

* Enhancements
  * ControllerExampleGroup uses controller as the implicit subject by default (Paul Rosania)
  * autotest mapping improvements (Andreas Neuhaus)
  * more cucumber features (Justin Ko)
  * clean up spec helper (Andre Arko)
  * add assign(name, value) to helper specs (Justin Ko)
  * stub_model supports primary keys other than id (Justin Ko)
  * support choice between Webrat/Capybara (Justin Ko)
  * support specs for 'abstract' subclasses of ActionController::Base (Mike Gehard)
  * be_a_new matcher supports args (Justin Ko)

* Bug fixes
  * support T::U components in mailer and request specs (Brasten Sager)

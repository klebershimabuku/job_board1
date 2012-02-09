require 'rubygems'
require 'test/unit'
require 'yaml'

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/../lib')

module Test::Unit
  # @ see http://gist.github.com/316780
	# Used to fix a minor minitest/unit incompatibility in flexmock
	# AssertionFailedError = Class.new(StandardError)

	class TestCase

		def self.must(name, &block)
			test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
			defined = instance_method(test_name) rescue false
			raise "#{test_name} is already defined in #{self}" if defined
			if block_given?
				define_method(test_name, &block)
			else
				define_method(test_name) do
					flunk "No implementation provided for #{name}"
				end
			end
		end

	end
end

# @see http://push.cx/2007/fixtures-in-ruby-unit-tests
class Test::Unit::TestCase
	@@fixtures = {}
	def self.fixtures *args
		[args].flatten.each do |fixture|
			self.class_eval do
				# add a method name for this fixture type
				define_method(fixture) do |item|
					# load and cache the YAML
					@@fixtures[fixture] ||= YAML::load_file("./fixtures/#{fixture.to_s}.yml")
					@@fixtures[fixture][item.to_s]
				end
			end
		end
	end
end

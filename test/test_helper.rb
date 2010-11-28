require "test/unit/assertions"
require "protest"
require "mocha"
require "virtuoso"

class Protest::TestCase
  include Test::Unit::Assertions
  include Mocha::API

  # Get Mocha integrated properly into the tests
  alias :original_run :run
  def run(report)
    original_run(report)
    mocha_verify
  ensure
    mocha_teardown
  end
end

Protest.report_with(:progress)

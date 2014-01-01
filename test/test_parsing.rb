require "test_helper"
 
class TestParsing < Test::Unit::TestCase

  include TestHelper
  include CodeModels::Xml

  def setup
    @dir = File.dirname(__FILE__)+'/data'
  	@example1 = CodeModels.parse_file(@dir+'/example1.xml')
  end

  def test_root_is_parser
    assert_class 
  end
 
end
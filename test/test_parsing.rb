require "test_helper"
 
class TestParsing < Test::Unit::TestCase

  include TestHelper
  include CodeModels::Xml

  def setup
    @dir = File.dirname(__FILE__)+'/data'
  	@example1 = CodeModels.parse_file(@dir+'/example1.xml')
  end

  def test_doc_is_parsed
    assert_class Document, @example1
  end
 
  def test_root_is_parsed
    assert_class Element, @example1.root
  end

end
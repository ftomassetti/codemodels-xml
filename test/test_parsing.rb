require "test_helper"
 
class TestParsing < Test::Unit::TestCase

  include TestHelper
  include CodeModels::Xml

  def setup
    @dir = File.dirname(__FILE__)+'/data'
  	@example1 = CodeModels.parse_file(@dir+'/example1.xml')
    @example2 = CodeModels.parse_file(@dir+'/example2.xml')
  end

  def test_doc_is_parsed
    assert_class Document, @example1
  end
 
  def test_root_is_parsed
    assert_class Element, @example1.root    
  end

  def test_root_is_correctly_parsed
    assert_equal "root", @example1.root.name
    assert_equal @example1, @example1.root.document
    assert_equal 4, @example1.root.children.count
    assert_equal 'a', @example1.root.children[0].name
    assert_equal 'b', @example1.root.children[1].name
    assert_equal 'c', @example1.root.children[2].name
    assert_equal 'd', @example1.root.children[3].name
    assert_equal 'e', @example1.root.children[3].children[0].name
  end

  def test_attributes_are_parsed
    assert_equal 2, @example2.root.attributes.count
    assert_class Attribute, @example2.root.attributes[0]
    assert_class Attribute, @example2.root.attributes[1]
    assert_equal 'a', @example2.root.attributes[0].name
    assert_equal 'ciao', @example2.root.attributes[0].value
    assert_equal 'b', @example2.root.attributes[1].name
    assert_equal 'mondo', @example2.root.attributes[1].value
  end


end
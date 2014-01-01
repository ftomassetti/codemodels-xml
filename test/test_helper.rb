require 'simplecov'
SimpleCov.start do
	add_filter "/test/"	
end

require 'codemodels/xml'
require 'test/unit'

include CodeModels

module TestHelper

def assert_class(expected_class,node)
	assert node.class==expected_class, "Node expected to have class #{expected_class} instead it has class #{node.class}"
end

def relative_path(path)
	File.join(File.dirname(__FILE__),path)
end

def read_test_data(filename)
	dir = File.dirname(__FILE__)
	dir = File.join(dir,'data')
	path = File.join(dir,filename)
	IO.read(path)
end

end
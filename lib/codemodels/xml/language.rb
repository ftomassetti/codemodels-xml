require 'codemodels'

module CodeModels
module Xml

class XmlLanguage < Language
	def initialize
		super('Xml')
		@extensions << 'xml'
		@parser = CodeModels::Xml::Parser.new
	end
end

CodeModels.register_language XmlLanguage.new

end
end
require 'codemodels'

module CodeModels
module Xml

class XmlAstNode < CodeModels::CodeModelsAstNode
end

class Namespace < XmlAstNode
end

class Element < XmlAstNode
end

class Document < XmlAstNode
    contains_many_uni 'namespaces', Namespace
    has_attr 'version', String
    has_attr 'encoding', String
    contains_one 'root', Element, 'document'
end

end
end
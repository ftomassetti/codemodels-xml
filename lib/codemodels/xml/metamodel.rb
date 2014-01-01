require 'codemodels'

module CodeModels
module Xml

class XmlAstNode < CodeModels::CodeModelsAstNode
end

class Namespace < XmlAstNode
end

class Attribute < XmlAstNode
    has_attr 'name', String
    has_attr 'value', String
end

class Text < XmlAstNode
end

class Element < XmlAstNode
    has_attr 'name', String
    contains_many 'children', Element, 'parent'
    contains_many_uni 'texts', Text
    contains_many_uni 'attributes', Attribute
end

class Document < XmlAstNode
    contains_many_uni 'namespaces', Namespace
    has_attr 'version', String
    has_attr 'encoding', String
    contains_one 'root', Element, 'document'
end

end
end
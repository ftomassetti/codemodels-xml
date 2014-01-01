require 'nokogiri'
require 'codemodels'

module CodeModels
module Xml

class Parser < CodeModels::Parser

    def internal_parse_artifact(artifact)
    end

end

DefaultParser = Parser.new

def self.jsonize_node(node)
    map = {}
    
    map['name'] = node.name
    map['blank'] = node.blank?
    map['cdata'] = node.cdata?
    map['comment'] = node.comment?
    map['content'] = node.content
    map['fragment'] = node.fragment?
    map['is_text'] = node.text?
    map['text'] = node.text
    map['type'] = node.type

    namespaces = []
    node.namespace_definitions.each do |n|
            namespaces << { 'href' => n.href, 'prefix' => n.prefix}
    end
    map['namespaces'] = namespaces

    attrs = []
    node.attribute_nodes.each do |a|
            attr_map = {}
            attr_map['value'] = a.value
            attr_map['name'] = a.name
            attrs << attr_map
    end
    map['attributes'] = attrs

    children = []
    node.children.each do |c|
            children << jsonize_node(c)
    end
    map['children'] = children 

    map
end

def self.jsonize_doc(doc)
    map = {}
    map['namespaces'] = doc.namespaces
    map['version'] = doc.version
    map['encoding'] = doc.encoding
    map['root'] = jsonize_node(doc.root)
    map
end

end
end
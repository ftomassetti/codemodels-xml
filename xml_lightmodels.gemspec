Gem::Specification.new do |s|
  s.platform    = 'java'
  s.name        = 'xml_lightmodels'
  s.version     = '0.1.0'
  s.date        = '2013-08-26'
  s.summary     = "Generation of Lightmodels from XML files."
  s.description = "Generation of Lightmodels from XML files."
  s.authors     = ["Federico Tomassetti"]
  s.email       = 'f.tomassetti@gmail.com'
  s.homepage    = 'http://federico-tomassetti.it'
  s.files       = Dir['./lib/*.rb'] + Dir['./lib/xml_lightmodels/*.rb']
  s.add_dependency('lightmodels')
  s.add_dependency('nokogiri')
end
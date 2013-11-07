# Program to generate models from XML files

raise "Usage: xml_to_json <sources> <models>" unless ARGV.count==2

sources_path = ARGV[0]
models_path = ARGV[1]
raise "Path to sources does not exist or it is not a dir: #{sources_path}" unless File.exist?(sources_path) and File.directory?(sources_path)
raise "Path to models does not exist or it is not a dir: #{models_path}" unless File.exist?(models_path) and File.directory?(models_path)

EObject = org.eclipse.emf.ecore.EObject
JavaResource = org.emftext.language.java.resource.java.mopp.JavaResource
JavaResourceUtil = org.emftext.language.java.resource.java.util.JavaResourceUtil
EcoreUtil = org.eclipse.emf.ecore.util.EcoreUtil

$SRC  = sources_path
$DEST = models_path
$VERBOSE = false

XmlLightmodels.translate_dir($SRC,$DEST,'xml','json') do |src,dest|
        puts "<Model from #{src}>"
        doc = Nokogiri.XML(File.open(src, 'rb'))

        res = XmlLightmodels.jsonize_doc(doc)

        # file = java.io.File.new src
        # java_resource = JavaResourceUtil.getResource file

        # raise "wrong number of roots" unless java_resource.contents.size == 1
        # root = java_resource.contents.get(0)

        # $nextId = 1
        # res = jsonize_obj(root)

        dest_dir = File.dirname(dest)
        FileUtils.mkdir_p(dest_dir) 
        File.open(dest, 'w') do |file|          
                file.write(JSON.pretty_generate(res,:max_nesting => 500))
        end
end
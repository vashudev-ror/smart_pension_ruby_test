require_relative 'lib/file_reader' 

file_reader = FileReader.new
file_reader.read_file(ARGV[0])

file_reader.view_pages(1,"TOTAL VIEWS:","visits")
file_reader.view_pages(2,"UNIQUE VIEWS:","unique views")




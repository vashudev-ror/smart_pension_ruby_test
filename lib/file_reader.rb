require 'pry'

class FileReader

	def read_file(file_path)
		 raise "No such file or directory" unless File.exist?(file_path)
		 @log_pages = {}
		 file = File.open(file_path).each do |line|
		 	file_data = line.split(" ")
		 	create_log_pages(file_data)	 
		 end
		 @log_pages
	end

	def view_pages(index,heading,context)
		ordered_data_set = ordered_data(index)
  	print_data(ordered_data_set,heading,context,index)
  	ordered_data_set
  end


	private

	def create_log_pages(file_data)	
		key = file_data[0]
		value = file_data[1]
		if @log_pages[key] != nil
			if @log_pages[key][0][value] !=  nil
				@log_pages[key][0][value] = @log_pages[key][0][value] + 1 
				@log_pages[key][1] = @log_pages[key][1] + 1
			else
				@log_pages[key][0][value] =  1
				@log_pages[key][1] = @log_pages[key][1] + 1
				@log_pages[key][2] = @log_pages[key][2] + 1
			end
		else
			@log_pages[key] = [{value => 1},1,1]
		end
	end

	def ordered_data(index)
		Hash[@log_pages.sort_by { |k, v| v[index] }.reverse.map { |a| [a[0], a[1][index]] }]
  end

	def print_data(ordered_data,heading,context,index)
		puts heading
		ordered_data.each {|k,v| puts "   #{k} #{v} #{context}"}
	end

end

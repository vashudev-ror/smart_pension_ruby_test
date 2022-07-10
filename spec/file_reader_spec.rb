require_relative '../lib/file_reader' 
require 'pry'

describe FileReader do
  let(:input_file) { 'spec/fixtures/sample_file.log' }
  describe "reading input file without file" do
    it  'should raise a "No such file or directory" error when file is not present' do
      expect { FileReader.new.read_file('unknown_path/uknown_sample.log') }.to raise_error('No such file or directory')
    end
  end

  describe "#read_file" do 
  	context "when sending file data in particular format" do
  		let(:expected_log_pages) do
		      {
		        '/abc'   => [{"23.12.12.111" => 1,"54.32.11.543" => 2},3,2],
		        '/def' => [{"24.11.12.211" => 2},2,1],
		        '/kgf'   => [{"123.11.12.211" => 1},1,1]
		      }
		  end
	    it "read file format the data correctly" do
	    	expect(FileReader.new.read_file(input_file)).to eq(expected_log_pages)
	    end
  	end
  end

   describe "#view_pages" do 

  	context "calling view_pages for total views" do
  		let(:expected_total_ordered_pages) do
		      { "/abc"=>3, 
		      	"/def"=>2, 
		      	"/kgf"=>1 }
		  end
	    it "should return total view pages data" do
	    	file_read = FileReader.new
	    	file_read.read_file(input_file)
	    	expect(file_read.view_pages(1,"TOTAL VIEWS:","visits")).to eq(expected_total_ordered_pages)
	    end
  	end

  	context "calling view_pages for unique views" do
  		let(:expected_total_ordered_pages) do
		      { "/abc"=>2, 
		      	"/def"=>1, 
		      	"/kgf"=>1 }
		  end
	    it "should return unique view pages data" do
	    	file_read = FileReader.new
	    	file_read.read_file(input_file)
	    	expect(file_read.view_pages(2,"UNIQUE VIEWS:","unique views")).to eq(expected_total_ordered_pages)
	    end
  	end
  end

end

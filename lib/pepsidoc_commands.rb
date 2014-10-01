require 'pepsidoc'
require 'pepsidoc_data'
require 'constants'
require 'rubygems'
require 'securerandom'
require 'yaml'
require 'table_print'
require 'erb'
require 'pdfkit'

class PepsidocCommands

  def initialize(args = [])
    @args = args
  end

  def run 

  	puts "Pepsidoc - Security reportbase v#{Constants::VERSION}".green
	puts ''

	create_new if new?
	list_all if list?
	report if report?
  end

  def ask_multiline(question)
  	print_label(question)
  	print("\n")
  	answer = ""
	while true
  		begin
	    	input = STDIN.sysread(1)
	    	answer += input
  		rescue EOFError
	    	break
  		end
	end
	return answer
  end	

  def get_random_id 

  	SecureRandom.hex[0,7].upcase

  end

  def print_label(label) 
  	print("#{label}: ".cyan)
  end

  def ask(question)

  	print_label(question)
  	$stdin.gets
  end

  def parse(filename)

	YAML.load_file(filename)

  end

  def convert_range_to_str(val)

	ret = "None" if val.to_i == 1
  	ret = "Low" if val.to_i == 2
  	ret = "Medium" if val.to_i == 3
  	ret = "High" if val.to_i == 4
  	ret = "Critical" if val.to_i == 5
  	
  	return ret
  end

  def list 

  	datas = []
  	Dir["*.pepsi"].each { |file|

  		data = parse(file)

  		data.severity = convert_range_to_str(data.severity)
 		data.likelihood = convert_range_to_str(data.likelihood)

  		datas << data
  	}

  	
  	datas
  end

  def list_all 
  	tp list, :id, :company, :product, :synopsis, :severity, :likelihood
  end

  def report

  	@loaded_data = list

  	template = ERB.new(Constants::HTML_TEMPLATE)
  	html = template.result(binding)

  	File.open('output.html', 'w') { |file| file.write(html) }

  end

  def create_new 

  	data = PepsidocData.new(get_random_id)

  	print_label("Id")
  	print("#{data.id}\n")
  	data.issue_date = Date.parse(ask("Issue-date"))
  	data.severity = ask("Severity (1-5)")
  	data.likelihood = ask("Likelihood (1-5)")
  	data.advisory_id = ask("Advisory Id")
  	data.company = ask("Company")
  	data.product = ask("Product")
  	data.affected_versions = ask("Affected versions")
  	data.synopsis = ask_multiline("Synopsis")
  	data.description = ask_multiline("Description")
  	data.exploit = ask_multiline("Exploit")
  	data.solution = ask_multiline("Solution")
  	data.references = ask_multiline("References")

  	File.open("#{data.id}.pepsi", "w") do |file|
  		file.puts YAML::dump(data)
  	end

  	print("\nDONE!")
  end

  def report?

  	@args[0].downcase == 'report' 

  end

  def list?

  	@args[0].downcase == 'list'

  end

  def new?

  	@args[0].downcase == 'new'

  end

end

# v1.0

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require_relative './config.rb'

class OptParser 

	def initialize(argv)
		print "OptParser constructor\n"
	end

	# hash to hold all options
	options = {}
	
	# instantiate the OptionParser class
	optparse = OptionParser.new do |opts|

		# set the banner
		opts.banner = "Usage: build [options] file1 file2 ..."

		# *************************************
		# define the options and what they do
		options[:verbose] = false
			opts.on('--verbose','Output more information') do 
				options[:verbose] = true
			end	
	
		options[:quick] = false
			opts.on('--quick','Perform the task quickly') do
				options[:quick] = true
			cnf = Configs.new
			#print "cnf: ", cnf["traverseHost"], "\n"
			end
	
		options[:report] = nil
			opts.on('--report HOSTNAME(fqdn?)','Report on HOSTNAME') do |host|
			options[:report] = host
			end
	
			# this displays the help screen, all programs are
			# assumed to have this option
			opts.on('-h','--help','Display this screen') do
				puts opts
				exit
		#
		# *************************************
		end
	end

	optparse.parse!

	print "being verbose\n" if options[:verbose]
	print "being quick\n" if options[:quick]
	print "logging to file #{options[:logfile]}\n" if
	print "derka\n" if !options
	options[:logfile]

end


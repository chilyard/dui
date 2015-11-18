# ************************[ read the passed csv ]************************
#
# pass the downloaded csv for parsing.  create rules in this class, or another
# to compare the data contained in both csv's and generate a new report based
# on those rules
#
Class ReadCsv
	begin
	IO::read("cmdb_ci_linux_server.csv")

	# read the header line, put the values in a hash.
	CSV.foreach("cmdb_ci_linux_server.csv") do |row|
		puts row
	end
	rescue => exception
	puts exception.backtrace
	fail
	ensure
	puts "exception"
	exit
	end
end


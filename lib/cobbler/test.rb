#!/usr/bin/env ruby


print "catching exceptions\n"

@hostname = "asdk-test-d001"
@eth1mac = "00:01:02:03:04:05"
@eth1ip = "192.168.100.100"

begin
	IO.popen("/bin/dateb test") { |io| print "io:", io, "\n"}
rescue Exception => e 
	print "an exception occurred\n" 
	print "e: ",e ,"\n" 
end

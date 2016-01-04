#!/usr/bin/env ruby

require 'aws-sdk'
require 'highline/import'

ENV['AWS_ACCESS_KEY'] = "AKIAJKTV3B6PCB3WJDAA" 
ENV['AWS_SECRET_ACCESS_KEY'] = "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"
ENV['AWS_REGION'] = "us-west-2"

region = "us-west-2"

ec2 = Aws::EC2::Client.new(:region => region)
ec2resource = Aws::EC2::Resource.new(client: ec2)
#sgarray = Array.new(1, "sg-78a3ae1c")

print "press Y if you want to create an instance\n"
print ": "
x = gets.chomp

case x 
	when "Y"
		print "creating instance\n"
		## create a Resource and spin up the new machine
		ec2resource.create_instances( {
			image_id: "ami-5189a661",
			min_count: 1,
			max_count: 1,
			#security_groups: sgarray,
			instance_type: "t2.micro",
			placement: {
				availability_zone: "us-west-2a",
				tenancy: "default",
			},
			monitoring: {
				enabled: "false"
			},
			subnet_id: "subnet-3b1d3e4c"
		} ) 
	else
		print "NOT creating instance\n"
end 

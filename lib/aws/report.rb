#!/usr/bin/env ruby

require 'aws-sdk'
require_relative 'AwsCredentials.rb'

awsCredentials = AwsCredentials.new()


ec2Client = Aws::EC2::Client.new(:credentials => $credentials)
ec2Resource = Aws::EC2::Resource.new(region: ENV['AWS_REGION'], client: ec2Client)



ec2Resource.instances.each do |resp|
	print "resp: #{resp.id} #{resp.tags} #{resp.ami_launch_index} \n"
end




=begin   ### this works, but is v1
resp = ec2Client.describe_instances
resp[:reservations].each do |reservation|
	reservation[:instances].each do |instance|
		print "instance: ", instance, "\n"
	end
end
=end

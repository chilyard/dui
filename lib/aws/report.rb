#!/usr/bin/env ruby

require 'aws-sdk'

require_relative 'AwsCredentials.rb'


# REMOVE when done
#$credentials = Aws::SharedCredentials.new(profile_name: "chilyard")
#ENV['AWS_REGION'] = "us-west-2"

awsCredentials = AwsCredentials.new()


ec2Client = Aws::EC2::Client.new(:credentials => $credentials)
ec2Resource = Aws::EC2::Resource.new(region: ENV['AWS_REGION'], client: ec2Client)


# iterate through each instance and collect the field values into an array
# the array will be dumped to a CSV file

instance_array = Array.new()

ec2Resource.instances.each do |instance|
	print "instance: ", instance, "\n"
	
	# pop the returned value on the array stack
	# at the end, dump the array into a file object 
end






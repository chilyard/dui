#!/usr/bin/env ruby

require 'aws-sdk'

require_relative 'AwsCredentials.rb'


# REMOVE when done
#$credentials = Aws::SharedCredentials.new(profile_name: "chilyard")
#ENV['AWS_REGION'] = "us-west-2"

awsCredentials = AwsCredentials.new()


ec2Client = Aws::EC2::Client.new(:credentials => $credentials)
ec2Resource = Aws::EC2::Resource.new(region: ENV['AWS_REGION'], client: ec2Client)


ec2Resource.instances.each do |instance|
	line = instance.instance_id,instance.state.code,instance.state.name
	i = 0
	while ( i < line.length )
		print line[i],","
		i += 1
	end
	print "\n"
end






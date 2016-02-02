#!/usr/bin/env ruby

require 'aws-sdk'

# UNCOMMENT when done
#require_relative 'AwsCredentials.rb'


# REMOVE when done
$credentials = Aws::SharedCredentials.new(profile_name: "chilyard")
ENV['AWS_REGION'] = "us-west-2"

# UNCOMMENT when done
#awsCredentials = AwsCredentials.new()


ec2Client = Aws::EC2::Client.new(:credentials => $credentials)
ec2Resource = Aws::EC2::Resource.new(region: ENV['AWS_REGION'], client: ec2Client)



ec2Resource.instances.each do |instance|
	print instance, "\n"
end






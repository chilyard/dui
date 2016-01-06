#!/usr/bin/env ruby

require 'aws-sdk'
require_relative 'AwsCredentials.rb'

awsCredentials = AwsCredentials.new()


ec2Client = Aws::EC2::Client.new(:credentials => $credentials)
ec2Resource = Aws::EC2::Resource.new(region: ENV['AWS_REGION'], client: ec2Client)

ec2Resource.instances.each do |instance|
	ec2Image = Aws::EC2::Image.new(:id => "ami-5189a661", :client => ec2Client)
	print "\ni.id: ", instance.id, "----", ec2Image.describe_attribute(attribute: "description")
end


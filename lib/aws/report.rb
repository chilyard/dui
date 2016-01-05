#!/usr/bin/env ruby

require 'aws-sdk'

ENV['AWS_PROFILE'] = "chilyard2"

ec2Client = Aws::EC2::Client.new(region: 'us-west-2')
ec2Resource = Aws::EC2::Resource.new(client: ec2Client)

ec2Resource.instances.each do |instance|
	ec2Image = Aws::EC2::Image.new(:id => "ami-5189a661", :client => ec2Client)
	print "\ni.id: ", instance.id, "----", ec2Image.describe_attribute(attribute: "description")
end


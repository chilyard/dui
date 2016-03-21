#!/usr/bin/env ruby

require 'aws-sdk'

require_relative 'AwsCredentials.rb'


awsCredentials = AwsCredentials.new()


ec2Client = Aws::EC2::Client.new(:credentials => $credentials)
ec2Resource = Aws::EC2::Resource.new(region: ENV['AWS_REGION'], client: ec2Client)


# iterate through each instance and collect the field values into an array
# the array will be dumped to a CSV file

instance_array = Array.new()


=begin
#<struct Aws::EC2::Types::Instance instance_id="i-e763ec3f", image_id="ami-63b25203", state=#<struct Aws::EC2::Types::InstanceState code=16, name="running">, private_dns_name="ip-172-31-35-159.us-west-2.compute.internal", public_dns_name="ec2-54-213-7-249.us-west-2.compute.amazonaws.com", state_transition_reason="", key_name="testkeypair", ami_launch_index=0, product_codes=[], instance_type="t2.micro", launch_time=2016-03-09 06:19:34 UTC, 


kernel_id=nil, ramdisk_id=nil, platform=nil, monitoring=#<struct Aws::EC2::Types::Monitoring state="disabled">, subnet_id="subnet-3b1d3e4c", vpc_id="vpc-198bb37c", private_ip_address="172.31.35.159", public_ip_address="54.213.7.249", state_reason=nil, architecture="x86_64", root_device_type="ebs", root_device_name="/dev/xvda", block_device_mappings=[#<struct Aws::EC2::Types::InstanceBlockDeviceMapping device_name="/dev/xvda", ebs=#<struct Aws::EC2::Types::EbsInstanceBlockDevice volume_id="vol-5f35379f", status="attached", attach_time=2016-03-09 06:19:35 UTC, delete_on_termination=true>>], virtualization_type="hvm", instance_lifecycle=nil, spot_instance_request_id=nil, client_token="oKaKA1457504374121", tags=[], 

source_dest_check=true, hypervisor="xen", network_interfaces=[#<struct Aws::EC2::Types::InstanceNetworkInterface network_interface_id="eni-54865f1e", subnet_id="subnet-3b1d3e4c", vpc_id="vpc-198bb37c", description="", owner_id="069256815171", status="in-use", mac_address="06:39:ea:d2:4b:9f", private_ip_address="172.31.35.159", private_dns_name="ip-172-31-35-159.us-west-2.compute.internal", source_dest_check=true, 

security_groups=[#<struct Aws::EC2::Types::GroupIdentifier group_name="launch-wizard-4", group_id="sg-60bc3307">], 
      placement=#<struct Aws::EC2::Types::Placement availability_zone="us-west-2a", group_name="", tenancy="default">, 
         groups=[#<struct Aws::EC2::Types::GroupIdentifier group_name="launch-wizard-4", group_id="sg-60bc3307">], 

attachment=#<struct Aws::EC2::Types::InstanceNetworkInterfaceAttachment attachment_id="eni-attach-8fa69983", device_index=0, status="attached", attach_time=2016-03-09 06:19:34 UTC, delete_on_termination=true>, association=#<struct Aws::EC2::Types::InstanceNetworkInterfaceAssociation public_ip="54.213.7.249", public_dns_name="ec2-54-213-7-249.us-west-2.compute.amazonaws.com", ip_owner_id="amazon">, private_ip_addresses=[#<struct Aws::EC2::Types::InstancePrivateIpAddress private_ip_address="172.31.35.159", private_dns_name="ip-172-31-35-159.us-west-2.compute.internal", primary=true, association=#<struct Aws::EC2::Types::InstanceNetworkInterfaceAssociation public_ip="54.213.7.249", public_dns_name="ec2-54-213-7-249.us-west-2.compute.amazonaws.com", ip_owner_id="amazon">>]>], iam_instance_profile=nil, ebs_optimized=false, sriov_net_support=nil>
=end



ec2Resource.instances.each do |instance|
    print "id:", instance.instance_id, "\n"
    print "placement:", instance.placement.tenancy, "\n"
    print "groups:", instance.groups[1], "\n"

	# pop the returned value on the array stack
	# at the end, dump the array into a file object 
end




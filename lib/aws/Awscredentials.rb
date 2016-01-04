

ENV['AWS_ACCESS_KEY'] = "AKIAJKTV3B6PCB3WJDAA" 
ENV['AWS_SECRET_ACCESS_KEY'] = "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"
ENV['AWS_REGION'] = "us-west-2"

ec2 = Aws::EC2::Client.new(:region => region)
ec2resource = Aws::EC2::Resource.new(client: ec2)
sgarray = Array.new(1, "sg-78a3ae1c")


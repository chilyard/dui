


ec2 = Aws::EC2::Client.new(:region => region)
ec2resource = Aws::EC2::Resource.new(client: ec2)
sgarray = Array.new(1, "sg-78a3ae1c")


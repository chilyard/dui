#!/usr/bin/env ruby

## description ##
#
# this is phase 2 implementation and will be a RoR app. 
#
# 
# build environment tool to help the user report on and update systems in the environment. 
#
# this tool will report status on all machines or selected systems such that it's easy to determine
# if a supported machine is inline with best practices ( backups, monitoring, configuration management...).
#
## support systems ##
# service-now CMDB
# traverse
# 
## build infrastructure ##
# build systems in vmware, aws, or physical
# build support infrastructure - cobbler (DHCP), puppet (CM), vagrant (deploy tool), boxupp (deploy tool)
# 


## configuration ## 
# 
# check config.rb for options

## load the required modules
# require './reporting.rb'
# require './puppet.rb'
# require './cobbler.rb'
# require './spacewalk.rb'
# require './traverse.rb'
# require './service-now.rb'
# require './dns.rb'
require './httpdownloadcsv.rb'
require './optparse.rb'
require './user.rb'

## create this empty hash, we'll check it later 
## to see what we're going to do.  if it's empty, exit
runtime = {key: "test"}

## parse the command line args first
op = OptParser.new(ARGV)

## check the runtime hash for execution flags
if (!runtime)
	then 
	print "runtime is empty\n"
	exit
end

## load configs
config = Configs.new()

## call the downloader (pass the correct arg)
#h = HttpDownloadCSV.new()

#au = User.new()
#au.add()

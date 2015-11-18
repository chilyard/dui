
# config.rb
# v 1.0

# interface spec #
# pass to: nothing
# return: hash to an array	
# 
# called from optparse.rb (OptParser) when we're ready to load the configs

class Configs
	
	# constructor
	def initialize()
		print "creating config hash\n"
		# -------------------- edit below ------------------------------
		@option = {}
		@option[:traverseHost] = "bshe-zbve-c040.production.tvn.com"
		@option[:serviceNow] = "https://www.service-now.com"
		# -------------------- edit above ------------------------------
	end

	def getValues(key)
		case key
		when "traverseHost"
			print "key: ", @option[:traverseHost], "\n"
		when "serviceNow"
			print "key: ", @option[:serviceNow], "\n" 
		end
	end

end

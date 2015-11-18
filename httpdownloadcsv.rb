# 
# class to download linux inventory from service-now or zyrion REST interfaces
# 
# ultimately a csv file is written to ./data/ for each service. cmdb in service-now will be 
# the designated master. 

require 'net/http'
require 'net/https'

class HttpDownloadCSV
	def initialize(serviceName="")
		case serviceName
			when "servicenow"
				#username = 'ws_zyrion'
				#password = 'S3rvic3N*w'
				username = 'chilyard@vubiquity.com'
				password = '123be@vis'
				target = 'vubiquity.service-now.com'
				path = '/cmdb_ci_linux_server_list.do?CSV'
				filename = 'servicenow.csv'
				http=Net::HTTP.new(target,443)
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
				print "opening connection to ", target 
				http.start() { |http|
					req = Net::HTTP::Get.new(path)
					req.basic_auth(username,password)	
					print "...downloading..."
					response = http.request(req)
					print "code: ", response.code, "\n"
						File.open(filename,'w') do |file|
							file.puts(response.body)
				end }
		
			when "zyrion"
				filename = 'zyrion.csv'
				uri = URI("http://bshe-zbve-c040/api/rest/command/login?chilyard/123Beavis")
				uri2 = URI("http://bshe-zbve-c040/api/rest/command/whoami")
				local_http = Net::HTTP.new(uri.host, uri.port)
				login = local_http.get(uri)
				print login
				print Net::HTTP.get(uri2)
			else
				print "nuthin\n"
		end
	end
end
		

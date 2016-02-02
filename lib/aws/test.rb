#!/usr/bin/env ruby

a = {
	"test" => { 
		"name1" => "me",
		"name2" => "you",
		"name3" => "us" 
			},
	"test2" => { 
		"name1" => "derp",
		"name2" => "durka",
		"name3" => "sherpa" 
			} 
}


print a["test"]["name2"],"\n"

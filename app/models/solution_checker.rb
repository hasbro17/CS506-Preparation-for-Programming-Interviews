require "resolv-replace.rb"
require 'uri'
require 'net/http'
require "rubygems"
require 'json'
require "ostruct"

class SolutionChecker

	#Put as class variable and use getter, that's it, I've found my enum, sort of
	@@lang_ids = { 
	"C#" => "10",
    "C/C++" => "7",
    "Clojure" => "2",
    "Java" => "8",
    "Go" => "6",
    "Plain JavaScript" => "4",
    "PHP" => "3",
    "Python" => "0",
    "Ruby" => "1",
    "Scala" => "5",
    "VB.NET" => "9",
    "Bash" => "11",
    "Objective-C" => "12",
    }
	
	#static getter
    def self.supported_langs
    	@@lang_ids.keys
    end

    #Returns hash of json body
	def self.post_check(code, lang, stdin)
	    host = 'ec2-52-33-7-12.us-west-2.compute.amazonaws.com'
	    port = '80'
	    post_ws = "/compile"

	    payload ={
	    	"language" => @@lang_ids[lang],
	    	"code" => code,
	    	"stdin" => stdin
	    	}.to_json

	    http = Net::HTTP.new(host, port)
	    req = Net::HTTP::Post.new(post_ws, initheader = {'Content-Type' =>'application/json'})
	    req.body = payload
	   
	    response = http.request(req)
	    #Did not check response code
	    puts response
	    json_body = JSON.parse(response.body)
	#For exception handling
	rescue JSON::ParserError
		puts "Parsing error for response"
		response
	end

end


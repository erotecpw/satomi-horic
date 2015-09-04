require 'searchbing'

APIKEY  = "API Key"
query   = "石原さとみ"
dir_name = "satomi"

bing    = Bing.new(APIKEY, 10, 'Image')
results = bing.search(query)

Dir.mkdir(dir_name) unless Dir.exists?(dir_name)
Dir.chdir(dir_name)
 
results[0][:Image].each do | page |
  system "wget #{page[:MediaUrl]}"
end

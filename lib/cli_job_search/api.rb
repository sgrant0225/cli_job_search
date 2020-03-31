require_relative '../../config/environment'

class API

  def self.get_data
   response = HTTParty.get ("https://jobs.github.com/positions.json?description=ruby&search=code&location=usa")
    # print response.class  the response here is http::party so its nothing that we can use in other methods that we have built
    #we need to basically do what's called parse , so we can store it in a class method @@all_jobs
    #and get the data that we want to set to attributes from that response like below
    #response[0]
   stored_objects = response.select {|hash|  hash.keys.first == "id"}
   # response.each do |hash|
   #  JOB.new(hash).country
     # new_job = JOB.new(
     # hash['location'],
     # hash['title'],
     # hash['company'],
     # hash['url'],
     # hash['description'])
     #binding.pry
  #puts stored_objects.class
  stored_objects.each {|hash| JOB.new(hash).id}
  end
end

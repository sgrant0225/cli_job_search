class JOB

 attr_accessor :url, :company, :location, :title, :description
  @@all = []

  def initialize(hash)
    @url = hash['url']
    @company = hash['company']
    @location = hash['location']
    @title = hash['title']
    @description = hash['description']
    @@all << self
  # Another way to do this will calling the send method.  Send method can be use if I had alot of
  # attributes or if I wanted to add additonal methods. Instead of writing
  # like I did above I can do this below, this is mass assignments:
    # hash.each do |k, v|
    # self.send("#{k}=", v) if self.respond_to?("#{k}=")
    #this is equilvent to JOB.send("company"=>, "UUPAbaby")
end

 def self.all
   @@all
 end


 def self.jobs_found_by_search(location) #this is a class method takes in the users location and find job based on the location that was put in
   self.all.select do |job|
   job.location.capitalize == location
    end
 end


end

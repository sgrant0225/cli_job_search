class JOB
 attr_accessor :location, :title, :company, :job_url

  @@all = []

 def initialize(location, title, company, job_url)
     @location = location
     @title = title
     @company = company
     @job_url = job_url
     @@all << self
 end

 def self.all
   @@all
 end

end

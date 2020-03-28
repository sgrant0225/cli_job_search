class JOB
 attr_accessor :location, :title, :company, :job_url, :description

  @@all = []
  @@jobs_located_from_search = []

 def initialize(location, title, company, job_url, description)
     @location = location
     @title = title
     @company = company
     @job_url = job_url
     @description = description
     @@all << self
 end

 def self.all
   @@all
 end

 def self.search_by_location(job_location)
     @@jobs_found_by_search = @@all.select do |job|
       job.location.include?(search_term)
     end
   end

   def self.jobs_found_by_search
     @@jobs_located_from_search
   end

end

class JOB

 attr_accessor :location, :title, :company, :job_url, :description

  @@all = []
  @@jobs_located_by_search = []

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


 def self.find_by_name(name)
   self.all.select do |city|
     #binding.pry
    city.location.downcase == name
   end
 end

 def self.search_location(locations)
      clear_search
      @@all.select do |jobs|
      jobs.location == locations
      binding.pry
    end
  end

  def self.jobs_found_by_search
     @@jobs_located_by_search
  end

  def self.clear_search
      @@jobs_located_by_search.clear
    end

  def self.jobs_found?
    if @@jobs_located_by_search != []
      true
    else
      false
    end
  end

end

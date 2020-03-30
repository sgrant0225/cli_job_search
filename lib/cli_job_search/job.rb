class JOB

 attr_accessor :location, :title, :company, :job_url, :description, :id
  @@all = []
  @@jobs_located_by_search = []

  def initialize(hash)
    hash.each do |k, v|
      self.send("#{k}=", v) if self.respond_to?("#{k}=")
  end
    @@all << self
 end

 def self.all
   @@all
 end

 def self.search_location(locations)
      clear_search
    @@jobs_located_by_search = @@all.select do |jobs|
      jobs.location.include?(locations)
    end
  end

  def self.jobs_found_by_search(location)
     self.all.select do |job|
      job.location.capitalize == location
    end
  end
  def self.clear_search
      @@jobs_located_by_search.clear
    end
  
end

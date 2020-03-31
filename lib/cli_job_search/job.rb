class JOB

 attr_accessor :location, :title, :company, :url, :description, :id
  @@all = []

  def initialize(hash)
    hash.each do |k, v|
      self.send("#{k}=", v) if self.respond_to?("#{k}=")
  end
    @@all << self
 end

 def self.all
   @@all
 end


 def self.jobs_found_by_search(location)
     self.all.select do |job|
      job.location.capitalize == location
    end
 end


end

class JOB
 attr_accessor :location, :title, :company, :job_url

  @all = []

 def initialize
  @@all << self
 end

 def self.all
   @@all
 end

end

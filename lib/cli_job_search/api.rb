require_relative '../../config/environment'

class API

  def self.get_data
   response = HTTParty.get ("https://jobs.github.com/positions.json?description=ruby&search=code&location=usa")
   response.each {|hash| JOB.new(hash)}

  end
end

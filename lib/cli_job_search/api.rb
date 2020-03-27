require_relative '../../config/environment'


class API

  def self.get_data
   response = HTTParty.get ("https://jobs.github.com/positions.json?description=ruby&search=code&page=0")
   response.each do |hash|
     #binding.pry
     new_job = JOB.new(
     hash['location'],
     hash['title'],
     hash['company'],
     hash['url'])
    end
  end
end

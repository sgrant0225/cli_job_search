require_relative '../../config/environment'


class API

  def self.get_data
   response = HTTParty.get ("https://jobs.github.com/positions.json?description=ruby&search=code&page=0")
     response.each do |hash|
         hash.map do
           location = hash['location']

        binding.pry
      #  location = hash['location']
      #  title = hash['title']
      #  company = hash['company']
      #  job_url = hash['url']
      end
    end
  end
end

puts API.get_data

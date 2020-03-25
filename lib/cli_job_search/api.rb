require_relative '../../config/environment'


class API

  def self.get_data
   response = HTTParty.get ("https://jobs.github.com/positions.json?description=ruby&search=code&page=0")
     response.each do |hash|
       hash.select['location']
        binding.pry
    end
  end
end

puts API.get_data

require_relative '../../config/environment'


class API
  def self.get_data
   response = HTTParty.get ("https://jobs.github.com/positions.json?description=python&location=washington+dc")
  end
end

API.get_data



class CLI

 def open
  self.start
  self.job_listings
  self.display_job
 end

 def start
  puts "Hello, happy to help you job search."
        sleep(2)
  puts "Please enter your zipcode:"
  # zipcode = gets.chomp
  # zipcode
 end

 def job_listings
  API.get_data
 end

 def display_job
   JOB.all.each do |jobs|
   binding.pry
   end
  end


end

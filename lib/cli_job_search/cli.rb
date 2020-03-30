class CLI

 def open
   #API.get_data
  self.menu
  # self.display_jobs
  # self.jobs_not_found
  #self.reset_terminal
  #self.job_listings
 end

 def welcome
  puts "Hello, happy to help you search for Ruby on Rails developer positions."
    sleep(2)
    API.get_data
  end
  # else
  #    reset_terminal
  #   puts "Type Exit to quit"
  # zipcode = gets.chomp
  # zipcode
 def menu
  welcome
   puts "1. Continue"
   puts "2. Exit"
   puts "Please choose an option using a number:"
     input = gets.chomp.to_i
     options = [1, 2]
     if options.include?(input)
       users_selection(input)
     else
       puts "Invalid selection!"
       menu
    end
 end
 # def display_jobs
 #   JOB.all.each_with_index do |job, index|
 #    puts "#{index + 1}. #{job.title}"
 #  end
 # end

 def job_selection(location)
  j = JOB.jobs_found_by_search(location)
  j.each do |j|
    puts "Title: #{j.title}"
    puts "Company: #{j.company}"
    puts "Location: #{j.location}"
    puts ""
  end
 end

 def users_selection(input)
   case input
   when 2
     close
    when 1
      #reset_terminal
      #display_jobs
      puts "Please enter a location: "
      #Line below will take in users location
      locations = gets.chomp.to_s.capitalize
      job_selection(locations)
       # jobs_found = JOB.search_location(locations)
       # #binding.pry
       #   JOB.jobs_found? ? display_jobs : jobs_not_found
       #   menu
    end
    # users_selection(input)
 end
#  def job_listings
#   API.get_data
#  end
#
 # def display_jobs
 #   JOB.all.each do |jobs|
 #     #binding.pry
 #    end
 #   end
def jobs_not_found
   puts "Unable to locate any jobs in your area at this time"
 end
#  def reset_terminal
#    self.reset
#  end
  def close
   puts "Have a great day, goodbye"
   exit
  end
end

class CLI

 def open
  self.start
   API.get_data

  self.menu
  #self.reset_terminal
  #self.job_listings
  #self.display_job
 end

 def start
  puts "Hello, happy to help you search for Ruby on Rails developer positions."
    #sleep(2)

  # else
  #    reset_terminal
  #   puts "Type Exit to quit"
  # zipcode = gets.chomp
  # zipcode
 end

 def menu
   puts "1. Continue"
   puts "2. Exit"
   print "Please choose an option using a number:"
     input = gets.chomp.to_i
     options = [1, 2]
     if options.include?(input)
       selection(input)
     else
       puts "Invalid selection!"
       menu
       sleep(3)
    end
 end

 def selection(input)
   case input
    when 1
      #reset_terminal
      print "Please enter a location:"
      locations = gets.chomp.to_s
       jobs_found = JOB.search_location(locations)
       if jobs_found
         display_jobs

    end
 end


#  def job_listings
#   API.get_data
#  end
#
 def display_jobs
   JOB.all.each do |jobs|
    jobs.each.with_index(1) do |job, index|
     #binding.pry
     puts "#{index}. #{job.title} located in #{job.location}"
    end
   end


def jobs_not_found
   puts "Unable to locate any jobs in your area at this time"
 end

#  def reset_terminal
#    self.reset
#  end
    end
  end
end

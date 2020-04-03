class CLI

 def open
   #API.get_data
  self.welcome
  self.menu
 end

 def welcome
  puts "Hello, happy to help you search for Ruby on Rails developer positions."
   sleep(2)
    API.get_data
  end

 def menu
   puts "Would you like to continue or exit?"
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

 def display_jobs
   JOB.all.each_with_index do |job, index|
    puts "#{index + 1}. #{job.title} - #{job.location}"
    end
 end

 def job_selection(location)
  j = JOB.jobs_found_by_search(location)
  if j == []
    puts "No jobs found!"
    puts ""
    puts "Here's a list of jobs and locations."
    job_choices
    system ('clear')
    menu
  else
  j.each do |j|
    puts ""
    puts "------------------Details---------------------------------"
    puts "Title: #{j.title}"
    puts "Company: #{j.company}"
    puts "Location: #{j.location}"
    puts "URL: #{j.url}"
    # puts "------------------Description------------------------------"
    # puts ""
    # re =  /<("[^"]*"|'[^']*'|[^'">])*>/
    # puts j.description.gsub!(re, '')
    puts "------------------------------------------------------------"
    display_jobs
    puts ""
    job_choices
    menu
    end
  end
 end


 def users_selection(input)
   case input
   when 2
     close
    when 1
      puts "Please enter a location: city, state"
      #Line below will take in users input's location
      locations = gets.chomp.to_s.capitalize
      job_selection(locations)
    end
  end

  def jobs_details
    puts "--------------Job Details--------------------"
    puts "Title: #{@job.title}"
    puts "Company: #{@job.company}"
    puts "Location: #{@job.location}"
    puts "URL: #{@job.url}"
    puts "----------------------------------------------"
  end


    # re =  /<("[^"]*"|'[^']*'|[^'">])*>/
    # puts "Description:" + @job.description.gsub!(re, '')
# user_input = gets.strip.to_i
# if user_input > 0 && user_input < 21
# @job = JOB.all[user_input - 1]



 def job_choices
  puts "Select a job of choice to see more details:"
  user_input = gets.chomp.to_i
  if user_input > 0 && user_input < 31
    @job = JOB.all[user_input - 1]
     self.jobs_details
   else
     puts "Invalid input, please input a number from the list"
       self.job_choices
   end
 end

def job_description
 #no code yet
end

def close
   puts "Have a great day, goodbye"
   exit
  end
end

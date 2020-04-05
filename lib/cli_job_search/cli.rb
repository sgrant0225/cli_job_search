class CLI

 def open #instance method this method creates the flow of my program and
  API.get_data #calls the data from the API class
  self.welcome
  self.menu
 end

 def welcome
  puts "Hello, happy to help you search for Ruby on Rails developer positions."
   sleep(2)
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
    puts "#{index + 1}. #{job.title}"
    end
 end

 def job_selection(location) 
  j = JOB.jobs_found_by_search(location)
  if j == []
    puts "No jobs found!"
    puts ""
    job_list
 else
  j.each do |j|
    puts ""
    puts "---------------------------------------Details---------------------------------------------------------------------"
    puts "Title: #{j.title}"
    puts "Company: #{j.company}"
    puts "Location: #{j.location}"
    puts "URL: #{j.url}"
    puts "-----------------------------------Description----------------------------------------------------------------------"
    puts ""
     re =  /<("[^"]*"|'[^']*'|[^'">])*>/
    puts  j.description.gsub!(re, '')
    puts "---------------------------------------------------------------------------------------------------------------------"
    job_list
    end
  end
 end


 def users_selection(input) # created this methdd to get user input from the menu
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
    job_description
    menu
  end

 def job_choices # this instance method will give the user a list of job choices to choosee from.
   display_jobs
   puts "Select a job of choice to see more details:"
  user_input = gets.chomp.to_i #user_input should be a integer
  if user_input > 0 && user_input < 11
    #called on the JOB class to get all job objects and set equal to an instance variable
    @job = JOB.all[user_input - 1]
     jobs_details
   else
     puts "Invalid input, please input a number from the list"
       self.job_choices #self refers to itself and will display this method when the user puts in an invalid choice
   end
 end

 def job_list
 puts "Would you like to see a list of jobs? (type: y or n)"
 user = gets.chomp.to_s.downcase
 if user == "y"
   job_choices
 else user == "n"
   menu
  end
 end

def job_description #this intance method display's the job description
 puts "Would you like to see the job description? (type: y or n)"
 user = gets.chomp.to_s.downcase
   if user == "y"
     puts "------------------------------------Description------------------------------------------------------"
     re =  /<("[^"]*"|'[^']*'|[^'">])*>/
     puts @job.description.gsub!(re, '')
     puts "-----------------------------------------------------------------------------------------------------"
   else user == "n"
     menu
   end
end

def close
   puts "Have a great day, goodbye"
   exit
  end
end

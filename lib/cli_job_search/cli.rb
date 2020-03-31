class CLI

 def open
   #API.get_data
  self.menu
 end

 def welcome
  puts "Hello, happy to help you search for Ruby on Rails developer positions."
    sleep(2)
    API.get_data
  end

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

 def display_jobs
   JOB.all.each_with_index do |job, index|
    puts "#{index + 1}. #{job.title} - #{job.location}"
    puts""
    end
 end

 def job_selection(location)
  j = JOB.jobs_found_by_search(location)
  if j == []
    puts "No jobs found!"
    puts ""
    puts "Here's a list of jobs and locations."
    display_jobs
    menu
  else
  j.each do |j|
    puts "Title: #{j.title}"
    puts "Company: #{j.company}"
    puts "Location: #{j.location}"
    puts "URL: #{j.url}"
    puts "------------------Description------------------------------"
    puts ""
    tags = j.description
    puts tags.sanitize
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

def close
   puts "Have a great day, goodbye"
   exit
  end
end

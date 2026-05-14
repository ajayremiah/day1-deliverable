# Script that filters and transforms data using enumerables.

# Sample data: an array of hashes represeting OJT logs
ojt_logs = [
  { task: "Database Design", hours: 4.5, category: "WEB DEV" },
  { task: "UI Mockups", hours: 3.0, category: "UI/UX" },
  { task: "API Integration", hours: 6.0, category: "WEB DEV" },
  { task: "Testing", hours: 2.5, category: "QA" },
  { task: "Bug Fixes", hours: 5.0, category: "WEB DEV" }
]

# Welcome Page
puts "You are trying to access TechNavyPhil OJT logs."
puts "_________________________________________________________________________"
print "Please enter your username: "
username = gets.chomp
puts "Welcome to the system, #{username}! You can now access the logs."
puts "_________________________________________________________________________"
puts "What would you like to do? Please choose from the following options:"
  puts "1 CATEGORY CHECKING"
  puts "2 SEE HOURS RENDERED"
  puts "3 SALARY COMPUTATION"
choice = gets.chomp.to_i

if choice
  case choice
  when 1 # CATEGORY CHECKING
    # Check if there is a category for chosen team input by user
    puts "_________________________________________________________________________"
    puts "Please enter the category you want to check:"
    category_to_check = gets.upcase.chomp

    apm_check = ojt_logs.any? { |log| log[:category].upcase == "#{category_to_check}".upcase }
    if apm_check == true
      puts "The #{category_to_check} category is available in the logs."
    else
      puts "There is no category for #{category_to_check}."
    end

  when 2 # SEE HOURS RENDERED
    # See the hours rendered for each category/total hours
    total_hours_rendered_by_category = ojt_logs.group_by { |log| log[:category] }
    a = total_hours_rendered_by_category.transform_values { |logs| logs.sum { |log| log[:hours] } }

    puts "_________________________________________________________________________"
    puts "Hours rendered by category:"
    a.each do |category, total_hours|
      puts "#{category}: #{total_hours} hours"
    end
    total_hours = ojt_logs.sum { |log| log[:hours] }
    puts "Total hours rendered: #{total_hours} hours"

  when 3 # SALARY COMPUTATION
    # Compute salary based on hours rendered and hourly rate
    hourly_rate = 250 # ₱250/hr

    salary_by_category = ojt_logs.group_by { |log| log[:category] }
    salary_by_category.transform_values! do |logs|
      logs.sum { |log| log[:hours] } * hourly_rate
    end

    puts "_________________________________________________________________________"
    puts "Salary by category:"
    salary_by_category.each do |category, salary|
      puts "#{category}: ₱#{salary}"
    end

  else
    puts "Invalid choice. Please select a valid option."
  end
else
  puts "Please enter a valid number."
end





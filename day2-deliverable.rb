puts "WELCOME TO TECHNAVY MOVIES!"
puts "The movie you want to watch is R18."
puts "Please answer the following questions to determine if you are eligible to watch the movie and to calculate your ticket price." 

print "What is your full name? "
full_name = gets.chomp

# split the string by spaces and take the first part
first_name = full_name.split(" ").first

print "What is your age? "
age = gets.chomp

# convert age to an integer
age_integer = age.to_i

# checks for eligibility based on age
if age_integer <= 17
    puts "Sorry, you are not eligible to watch this movie."

elsif age_integer >= 18 && age_integer <= 59
    puts "Your regular ticket price is ₱200."
    puts "Would you like to proceed to payment, #{first_name}?"

else age_integer >= 60
    puts "You're eligible for the senior discount! Your ticket price is ₱160."
    puts "Would you like to proceed to payment, #{first_name}?"
end

# The script above asks the user to input their full name and age,
# then determines if they are eligible to watch an R18 movie based on their age,
# also calculating the ticket price for regular and senior customers.

# The script uses conditional statements to check the age and provide appropriate responses.
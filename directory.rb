# We put the student names into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :July},
  {name: "Darth Vader", cohort: :July},
  {name: "Nurse Ratched", cohort: :July},
  {name: "Michael Corleone", cohort: :July},
  {name: "Alex DeLarge", cohort: :July},
  {name: "The Wicked Witch of the West", cohort: :July},
  {name: "Terminator", cohort: :July},
  {name: "Freddy Krueger", cohort: :July},
  {name: "The Joker", cohort: :July},
  {name: "Joffrey Baratheon", cohort: :July},
  {name: "Norman Bates", cohort: :July}
]

def print_header
  puts "The students of Villains Academy"
  puts "-----------------"
end

def print(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#Then we call the methods
print_header
print(students)
print_footer(students)

#First we define our methods
def input_students
  puts "Please enter the student names"
  puts "To finish, hit return twice"
  # empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empy, repeat this:
  while !name.empty? do
    students << {name: name, cohort: :july}
    puts "Now we have #{students.count} students"
    #get more names
    name = gets.chomp
  end
  #return the array of students
  students
end

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
students = input_students
print_header
print(students)
print_footer(students)

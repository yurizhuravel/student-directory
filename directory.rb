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

def print_names_a(students)
  puts "Students whose names start with a:"
  students.each.with_index(1) { |student, index|
    if student[:name][0].downcase == "a"
    then puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#Then we call the methods
students = input_students
print_header
print_names_a(students)
print_footer(students)

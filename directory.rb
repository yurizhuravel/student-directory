#First we define our methods
def input_students

  def take_input(input_field)
    puts "Please enter the student's #{input_field}"
    puts "To finish, hit return twice"
  end

  # empty array
  students = []
  #get the first name
  take_input("name")
  name = gets.chomp
  #get the cohort
  take_input("cohort")
  cohort = gets.chomp
  #get the age
  take_input("age")
  age = gets.chomp
  #get the height
  take_input("height")
  height = gets.chomp

  #while the name is not empty, repeat this:
  while !name.empty?
    students << {name: name, cohort: cohort, age: age, height: height}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    #get more names
    take_input("name")
    name = gets.chomp
    take_input("cohort")
    cohort = gets.chomp
    take_input("age")
    age = gets.chomp
    take_input("height")
    height = gets.chomp
  end

  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----------------".center(50)
end

def print(students)
  i = 0
  until i == students.length
    puts "#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} cohort, age: #{students[i][:age]}, height: #{students[i][:height]} cm)"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

#Then we call the methods
students = input_students
print_header
print(students)
print_footer(students)

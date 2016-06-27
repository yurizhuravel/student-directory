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

  #while the name is not empty, repeat this:
  while !name.empty?
    students << {name: name, cohort: cohort, age: age}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    #get more data
    take_input("name")
    name = gets.chomp
    take_input("cohort")
    cohort = gets.chomp
    take_input("age")
    age = gets.chomp
  end

  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy by cohort:".center(50)
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

def interactive_menu
  students = []
  loop do
    # print the menu and ask user what to do
    puts "1. Input the students list"
    puts "2. Show the students list"
    puts "9. Quit" # 9 because we'll be adding more items
    # 2. save the input into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
      when "1"
        # input the students list
        students = input_students
      when "2"
        # show the students list
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I didin't get that, try again"
    end
  end
end

interactive_menu

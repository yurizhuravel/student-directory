# this is an empty array accessible to all methods
@students = []

def what_input(input_field)
  puts "Please enter the student's #{input_field}"
  puts "To finish, hit return twice"
end

def take_input
  #get the name
  what_input("name")
  @name = STDIN.gets.chomp
  #get the cohort
  what_input("cohort")
  @cohort = STDIN.gets.chomp
  #get the age
  what_input("age")
  @age = STDIN.gets.chomp
end

def input_students
  take_input
  #while the name is not empty, repeat this:
  while !@name.empty?
    @students << {name: @name, cohort: @cohort, age: @age}
    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    #get more data
    take_input
  end
end

def interactive_menu
  loop do
    print_menu
    menu_selection(STDIN.gets.chomp)
  end
end

def print_menu
  # print the menu and ask user what to do
  puts "1. Input the students list"
  puts "2. Show the students list"
  puts "3. Save the list to students.csv"
  puts "4. Load students list from a file"
  puts "9. Quit" # 9 because we'll be adding more items
end

def menu_selection (selection)
  case selection
    when "1"
      # input the students list
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I didin't get that, try again"
  end
end

def show_students
  # show the students list
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy by cohort:".center(50)
  puts "-----------------".center(50)
end

def print_students_list
  i = 0
  until i == @students.length
    puts "#{i+1}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort, age: #{@students[i][:age]})"
    i += 1
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end

def save_students
  # Open the file for writitng
  file = File.open("students.csv", "w")
  # Iterate over the array
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, age = line.chomp.split(',')
    @students << {name: name, cohort: cohort, age: age}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #(first argument from the command line)
  return if filename.nil? # quit the method if no filename given
  if File.exists?(filename) # if there is such a file
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else # if there is no such file
    puts "Oops, #{fileneme} does not exist."
  end
end

try_load_students
interactive_menu

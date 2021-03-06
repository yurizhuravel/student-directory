# this is an empty array accessible to all methods
@students = []

def what_input(input_field)
  puts "Please enter the student's #{input_field}"
  puts "To finish, hit return twice"
end

def take_input
  #get the name
  what_input("name")
  #STDIN everywhere because filenames can be passed as arguments at launch and gets will use them as input stream, needs to be redirected to standard (keyboard)
  @name = STDIN.gets.chomp
  #get the cohort
  what_input("cohort")
  @cohort = STDIN.gets.chomp
  #get the age
  what_input("age")
  @age = STDIN.gets.chomp
end

def add_to_list
  @students << {name: @name, cohort: @cohort, age: @age}
end

def input_students
  take_input
  #while the name is not empty, repeat this:
  while !@name.empty?
    add_to_list
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
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Quit" # 9 because we'll be adding more items
end

def menu_selection (selection)
  puts "You chose option #{selection}"
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
      puts "There is no such option, try again"
  end
end

def show_students
  # show the students list
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy:".center(50)
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
  puts "How you would like the file to be called?"
  filename = STDIN.gets.chomp
  # Open the file for writitng
  file = File.open(filename, "w")
  # Iterate over the array
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_file (filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort, @age = line.chomp.split(',')
    add_to_list
  end
  file.close
end

def filename_validate (filename)
  if filename.nil? || filename.empty? # default if no filename given
    filename = "students.csv"
  end
  if File.exists?(filename) # if there is such a file
    load_file(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else # if there is no such file
    puts "Oops, #{filename} does not exist."
  end
end

def load_students
  @students = []
  puts "Please give the name of the file to load\nor hit enter to load from students.csv"
  filename = STDIN.gets.chomp
  filename_validate(filename)
end

def try_load_students
  filename = ARGV.first #(first argument from the command line)
  filename_validate(filename)
end

try_load_students
interactive_menu

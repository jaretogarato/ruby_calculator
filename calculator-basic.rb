require 'pry'
require 'colorize'

@operators = ['+','-','*','/']

def get_number(pos)
  begin
    puts "Enter your #{pos} number:"
    puts '(or type "c" to clear and start over)'
    ue = gets.chomp
    if ue == "c"
      return ue
    end
    ue = Float(ue)
  rescue
    puts 'Something funny happened there. Please only use numerals, the decimal point, and the minus sign.'
    retry
  end
  return ue
end

def get_operator()
  puts 'Which operation do you want to perform? Enter "+", "-", "*", "/".'
  puts '(or type "c" to clear and start over)'
  ue = gets.chomp

  if ue == "c"
    return ue
  elsif @operators.include? ue
    return ue
  else
    puts 'Something funny happened there. Please try again.'
    get_operator()
  end
end


while true
  clear_test = true

  puts ''
  puts ''
  puts "-------------------------------".colorize(:light_blue)
  puts "Welcome to the Ruby calculator!".colorize(:light_blue)
  puts "-------------------------------".colorize(:light_blue)

  first_num = get_number("first")
  clear_test = false if first_num == "c"

  oper = get_operator if clear_test
  clear_test = false if oper == "c"

  second_num = get_number("second") if clear_test
  clear_test = false if second_num == "c"

  if clear_test
    puts '-------------------------------'
    print "~-==>> #{first_num} #{oper} #{second_num} = "
    case oper
      when "+"
        answer = first_num + second_num
      when "-"
        answer = first_num - second_num
      when "*"
        answer = first_num * second_num
      when "/"
        answer = first_num / second_num
      else
        puts "Houston, we have a problem."
    end
    puts "#{answer} <<==-~"
    puts '-------------------------------'
    puts ''
    puts ''
  end
end

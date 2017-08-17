require 'pry'
require 'colorize'

@operators = ['+','-','*','/']

def check_number(num)
  begin
    if num == "c"
      return num
    end
    # puts "num in check_number is: #{num}"
    num2 = Float(num)
    # puts "num2 in check_number is: #{num2}"
  rescue
    puts 'Something funny happened there. Please only use numerals, the decimal point, and the minus sign.'
    retry
  end
  return num2
end

def get_operator()
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

def get_input
  puts 'Enter a single-operator calculation (eg., 23 + 10):'
  input = gets

  oper_loc = input.index('+')
  unless oper_loc
    oper_loc = input.index('-')
  end
  unless oper_loc
    oper_loc = input.index('*')
  end
  unless oper_loc
    oper_loc = input.index('/')
  end

  puts ">>>>>> #{oper_loc}"
  if oper_loc
    puts 'we have an operator location'

    left_hand = input[0..oper_loc - 1].split.join('')
    left_hand2 = check_number(left_hand)

    oper = input[oper_loc].split.join('')

    right_hand = input[oper_loc + 1..input.length].split.join('')
    right_hand2 = check_number(right_hand)

    puts '-------------------------------'
    print "~-==>> #{left_hand2} #{oper} #{right_hand2} = "
    case oper
      when "+"
        answer = left_hand2 + right_hand2
      when "-"
        answer = left_hand2 - right_hand2
      when "*"
        answer = left_hand2 * right_hand2
      when "/"
        answer = left_hand2 / right_hand2
      else
        puts "Houston, we have a problem."
    end
    puts "#{answer} <<==-~"
    puts '-------------------------------'

  else
    puts "we don't have an operator location"
    puts ''
    oper_loc = nil
    get_input
  end
end


while true
  puts ''
  puts ''
  puts "-------------------------------".colorize(:light_blue)
  puts "|       RUBY CALCULATOR       |".colorize(:light_blue)
  puts "-------------------------------".colorize(:light_blue)

  get_input
end

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

  left_hand = input[0..oper_loc - 1].split.join('')
  left_hand2 = check_number(left_hand)

  oper = input[oper_loc].split.join''

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

  # first_num = get_number
end


while true
  clear_test = true

  puts ''
  puts ''
  puts "-------------------------------".colorize(:light_blue)
  puts "Welcome to the Ruby calculator!".colorize(:light_blue)
  puts "-------------------------------".colorize(:light_blue)

  get_input

  # irb(main):002:0> op =~ '+'
  # => 0
  # irb(main):003:0> op =~ '123'
  # => nil
  # irb(main):004:0> input = '45+234'
  # => "45+234"
  # irb(main):005:0> /\d+(\+){1}\d+/ =~ input
  # => 0
  # irb(main):006:0> input
  # => "45+234"
  # irb(main):007:0> input2 = '23/*123'
  # => "23/*123"
  # irb(main):008:0> /\d+(\+){1}\d+/ =~ input2 # checks for equation
  # => nil




  # first_num = get_number("first")
  # clear_test = false if first_num == "c"
  #
  # oper = get_operator if clear_test
  # clear_test = false if oper == "c"
  #
  # second_num = get_number("second") if clear_test
  # clear_test = false if second_num == "c"
  #
  # if clear_test
  #   puts '-------------------------------'
  #   print "~-==>> #{first_num} #{oper} #{second_num} = "
  #   case oper
  #     when "+"
  #       answer = first_num + second_num
  #     when "-"
  #       answer = first_num - second_num
  #     when "*"
  #       answer = first_num * second_num
  #     when "/"
  #       answer = first_num / second_num
  #     else
  #       puts "Houston, we have a problem."
  #   end
  #   puts "#{answer} <<==-~"
  #   puts '-------------------------------'
  #   puts ''
  #   puts ''
  # end
end

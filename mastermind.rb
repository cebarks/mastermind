#!/usr/bin/env ruby
COLORS = %w(R G B Y)

def game_loop
  code = (0..3).inject([]) { |c,_| c << COLORS.shuffle.sample }
  print "Enter a guess (#{COLORS.join("|")}): "
  until ((correct = guess(code)) == 4) && (i+=1) > 0 do
    print "Correct: #{correct}\nEnter a guess (#{COLORS.join("|")}): "
    require 'pry'; binding.pry
  end
  puts "You won!"
end

def guess(code)
  gets.chomp.upcase.split('').map.with_index { |e, i| e == code[i]}.count{|e|e}
end

def main_menu
  repl = Hash.new(method(:main_menu)).merge({"p" => method(:game_loop), "i" => method(:info), "q" => method(:exit)})
    print "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
    repl[gets.chomp].call
end

def info
  puts "Don't be dumb. It's a simple game."
end

loop { main_menu }

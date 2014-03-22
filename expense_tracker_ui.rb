require './lib/category'
require './lib/expenses'
require './lib/exp_cat_join'
require 'pry'

DB = PG.connect({:dbname => 'expense_tracker'})

system "clear"

def main_menu
  puts "Track your freaking expenses"
  puts "\nWhat would you like to do?"
  puts "\tPress 'e' to make a new entry"
  puts "\tPress 'v' to view all your profligacy"
  puts "\tPress 'x' to exit and wallow in your bankruptcy"

  input = gets.chomp.downcase
  case input
  when 'e'
    entry_menu
  when 'v'
    view_menu
  when 'x'
    puts "Fine.  Good-bye.\n\n\n"
  else
    puts "Enter a valid input"
    main_menu
  end
end

def entry_menu
  puts "Type the name of the expense that you would like to add"
  description = gets.chomp
  puts "Got it! Now, please enter the amount"
  cost = gets.chomp
  puts "Wow, kind of pricey!!!! Okay, now, tell me if you made your purchase today? Press Y for yes"
  entry_menu_answer = gets.chomp.upcase
  case entry_menu_answer
    when "Y"
      date = Time.now.strftime("%Y/%m/%d")
    else
      puts "Please enter the date of your purchase in year-month-day format:"
      date = gets.chomp
   end
  new_expense = Expense.new({:description => description, :cost => cost, :date => date})
  new_expense.save
  new_expense
  puts "Expense has been added to the database!!!!! Hasta NUNCA dinero :("

end

def view_menu
end

main_menu


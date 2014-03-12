require './lib/term'

@current_term

def term_create
  puts "Please enter a word"
  input_word = gets.chomp
  puts "Please enter a definition"
  input_definition = gets.chomp
  @new_term = Term.create(input_word, input_definition)
  @current_term = @new_term
  @current_term.words << input_word
  @current_term.definitions << input_definition
  puts "Do you want to enter additional translations of your word? y or n"
  lang_input = gets.chomp
  if lang_input == 'y'
    add_lang
  else
    puts "Do you want to enter additional definitions? y or n"
    choice_input = gets.chomp
  end

  case choice_input

  when 'y'
    add_defs
  else
    main_menu
  end
end

def add_lang
  puts "Please enter an additional translation"
  input_lang = gets.chomp
  @current_term.words << input_lang
  puts "Do you want to enter another language? y or n"
  choice_input = gets.chomp

  case choice_input

  when 'y'
    add_lang
  else
    puts "Do you want to enter an additional definition? y or n"
    def_input = gets.chomp
    if def_input == 'y'
      add_defs
    else
      main_menu
    end
  end
end

def add_defs
  puts "Please enter an addtional definition"
  input_definition = gets.chomp
  @current_term.definitions << input_definition
  puts "Do you want to enter another definition? y or n"
  choice_input = gets.chomp

  case choice_input

  when 'y'
    add_defs
  else
    main_menu
  end
end

def main_menu
  puts "\nMENU"
  puts "========"
  puts "\nPress 'a' to add a new term"
  puts "Press 'l' to see a list of the the terms"
  puts "Press 's' to search for a word"
  user_choice = gets.chomp

  case user_choice

  when 'a'
    term_create
  when 'l'
    list_menu
  when 's'
    puts "Please enter the word you want to search for"
    user_input = gets.chomp
    puts Term.search(user_input.split)
    main_menu
  else
    puts "Sorry, invalid option"
    main_menu
  end
end

def edit_menu
  puts "\nEDIT MENU"
  puts "========"
  puts "\n"
end





def list_menu
  puts "\n"
  Term.all.each_with_index do |term, index|
    puts "#{index + 1}) " + term.words.to_s.slice(1..-2)
  end
  puts "\nPress 'd' for definition"
  puts "Press 'e' to edit"
  puts "Press 'r' to remove"
  puts "Press 'm' to return to main menu"
  user_choice = gets.chomp
  case user_choice
  when 'd'
    puts "which word do you want to see the definition for?"
    def_choice = gets.chomp
    puts Term.all[def_choice.to_i - 1].words.to_s.slice(1..-2) + " is a " + Term.all[def_choice.to_i - 1].definitions.to_s.slice(1..-2)
      list_menu
  when 'e'
    puts "which word do you want to edit?"
    edit_choice = gets.chomp
    puts "Please enter a new word"
    input_word = gets.chomp
    puts "Please enter a new definition"
    input_definition = gets.chomp
    new_term = Term.all[edit_choice.to_i-1].edit_term(input_word, input_definition)
      list_menu
  when 'r'
    puts "which word do you want to remove?"
    remove_choice = gets.chomp
    Term.all.delete_at(remove_choice.to_i - 1)
      list_menu
  when 'm'
    main_menu
  end
  main_menu
end

term_create

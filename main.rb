# https://docs.google.com/document/d/1Pjv4MH5aLadGhxoIf60qiw3cNwfE3StZ6bb7d66nPiw/edit


################
# 1. 
# ask user for 5 fav foods.
# foods = []
# 5.times do
#   puts "Tell me your favorite food:"
#   food = gets.chomp
#   foods << food 
# end

# x = 1
# foods.each do |food|
#   p "#{x}. I love #{food}."
#   x += 1
# end

################
# 2.
# count = 0
# while count <= 10
#   puts count
#   count +=1
# end

# recipes = ["chicken alfredo", "spaghetti", "chocolate chip cookies"]

# languages = ["English", "Mandarin", "Sign Language"]

# if recipes.length > 10 && languages.length > 5
#   puts "Sam and Sally should date"
# else
#   puts "Sally and Sam should not date."
# end

# if recipes.include?("crepes") || languages.include?("french")
#   puts "They should Marry."
# else
#   puts "they should not marry."
# end

################
# 3. 
# array = []
# 5.times do
#   puts "Enter your first name:"
#   first_name = gets.chomp

#   puts "Enter your last name:"
#   last_name = gets.chomp

#   puts "Enter your email:"
#   email = gets.chomp

#   id = ""
#   10.times do
#     id += rand(0..9).to_s
#   end

#   input_options = { :first_name => first_name, :last_name => last_name, :email => email, :acct => id}

#   array << input_options  
# end

# array.each { |person|
#   puts "first name: #{person[:first_name]}"
#   puts "last name: #{person[:last_name]}"
#   puts "email: #{person[:email]}"
#   puts "acct #: #{person[:acct]}"
# }

################
# 4.
# puts "Enter each student's name. type 'done' when done:"
# students = []
# input = ""

# index = 0
# group_num = 1
# while input != "done"
#   input = gets.chomp
#   if input != "done"
#     student = { :name => input, :group => group_num}
#     students << student
#   end

#   if index % 2 == 1
#     group_num += 1
#   end  
#   index += 1
# end

# if students.length % 2 == 1
#   students[students.length - 1][:group] = students[students.length - 2][:group]
# end

# puts students


################
# 5.
# array = []
# 3.times do
#   puts "Enter your first name:"
#   first_name = gets.chomp

#   puts "Enter your last name:"
#   last_name = gets.chomp

#   puts "Enter your email:"
#   email = ""
#   while email = ""
#     input = gets.chomp
#     if input.count("@") == 1 && input.end_with?(".com")
#       email = input
#       break
#     else
#       puts "e-mail must include an '@' and e-mail must end in '.com'"
#     end
#   end
  


#   id = ""
#   10.times do
#     id += rand(0..9).to_s
#   end

#   input_options = { :first_name => first_name, :last_name => last_name, :email => email, :acct => id}

#   array << input_options  
# end

# array.each { |person|
#   puts "first name: #{person[:first_name]}"
#   puts "last name: #{person[:last_name]}"
#   puts "email: #{person[:email]}"
#   puts "acct #: #{person[:acct]}"
# }

# puts "Enter an account number:"
# acct_to_search = gets.chomp.to_i
# found = false
# array.each{ |person|
#   if person[:acct].to_i == acct_to_search
#     puts person
#     puts "#{person[:first_name]} #{person[:last_name]} has the account # of: #{person[:acct]}"
#     found = true
#   end  
# }
# if !found
#   puts "no match found."
# end

################
# 6.
class Card
  attr_accessor :question, :answer, :correct_answer

  def initialize(question, answer)
    @question = question
    @answer = answer
    @correct_answer = false
  end

  def check_answer(user_input)
    if user_input.downcase == @answer.downcase
      puts "Correct!"
      @correct_answer = true
    else
      puts "Incorrect!"
      @correct_answer = false
    end
  end

end

class Deck
  def initialize(cards)
    @cards = cards
  end

  def draw_card
    # pick a random card from deck
    key = @cards.keys[rand(0...@cards.length)]
    value = @cards[key]
    @cards.delete(key)
    puts "Card drawn. Deck now has #{@cards.length} cards left."
    # the draw_card method will return card, which is a new instance of the Card class that stores the current trivia question and answer.
    card = Card.new(key, value)
  end

  def remaining_cards
    return @cards.length
  end

end

trivia_data = {
  "What is the capital of Illinois: Springfield, Chicago, Normal, or Champaign?" => "Springfield",
  "Is Africa a country or a continent: Country, Continent, or both?" => "Continent",
  "Tug of war was once an Olympic event: True or False?" => "True"
}

# multiple_choice_options = {
#   "What is the capital of Illinois?" => "Springfield, Chicago, Normal, or Champaign",
#   "Is Africa a country or a continent?" => "Continent, Country, or both",
#   "Tug of war was once an Olympic event. True or false?" => "True or False"
# }

deck = Deck.new(trivia_data) # deck is an instance of the Deck class

num_correct = 0
incorrect_questions = {}
while deck.remaining_cards > 0
  card = deck.draw_card # card is an instance of the Card class
  puts card.question
  user_answer = gets.chomp
  card.check_answer(user_answer)
  if card.correct_answer == false
    puts "Try again:"
    attempt_2 = gets.chomp
    card.check_answer(attempt_2)
    if card.correct_answer == false
      incorrect_questions[card.question] = card.answer
    end
  end
  if card.correct_answer == true
    num_correct += 1
  end
end

puts "user got #{num_correct} questions correct."
puts "Try to answer the incorrect questions again? type 'y' or 'n'"
try_again = gets.chomp
if try_again.downcase == "y"
  incorrect_questions.each { |question|
    p question[0]
    user_answer = gets.chomp
    if user_answer.downcase == question[1].downcase
      puts "Correct."
    else
      puts "Incorrect."
    end
  } 
end



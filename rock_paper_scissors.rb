VALID_CHOICES = %w(rock paper scissors lizard spock)

VALID_SHORTHAND = { 'r' => 'rock',
                    'p' => 'paper',
                    's' => 'scissors',
                    'l' => 'lizard',
                    'sp' => 'spock' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def welcome_message
  prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")
  prompt("The first player with 5 wins is the champion!")
end

def game_rules
  prompt("Enter 'y' for the rules and 'n' if you know how to play!")
  rules = Kernel.gets().chomp()

  if rules.downcase() == 'y'
    how_to_play()
  end
end

def how_to_play
  prompt("Scissors cuts paper")
  prompt("Paper covers rock")
  prompt("Rock crushes lizard")
  prompt("Lizard poisons spock")
  prompt("Spock smashes scissors")
  prompt("Scissors decapitates lizard")
  prompt("Lizard eats paper")
  prompt("Paper disproves spock")
  prompt("Spock vaporizes rock")
  prompt("Rock crushes scissors")
end

def validate_choice(input)
  if VALID_CHOICES.include?(input)
    input
  elsif VALID_SHORTHAND.key?(input)
    VALID_SHORTHAND[input]
  else
    prompt("Invalid choice.")
  end
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def score_board
  score = [0, 0]
  score
end

def update_score(one, two, array)
  if win?(one, two)
    array[0] += 1
  elsif win?(two, one)
    array[1] += 1
  end
end

welcome_message
game_rules

choice = ''

loop do
  score = score_board

  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()
      choice = validate_choice(choice)
      break if choice
    end

    computer_choice = ['rock', 'paper', 'scissors', 'lizard', 'spock'].sample

    Kernel.puts("You chose: #{choice}, Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    update_score(choice, computer_choice, score)
    prompt("Current Score: You #{score[0]} vs. Computer #{score[1]}")

    if score[0] == 5
      prompt("You are the champion!")
      break
    elsif score[1] == 5
      prompt("The computer is the champion!")
      break
    end
  end
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for playing!")
prompt("Have a nice day!")

class Jankenpo
    # Constructor. Play the game
    def initialize
        @computer_choices = ['Paper', 'Rock', 'Scissors']
        computer_choice = get_computer_choice
        user_choice = get_user_choice
        send_response(
            evaluate(user_choice, computer_choice),
            computer_choice
        )
    end

    # returns "p" or "r" or "s"
    def get_user_choice
        user_option = ""

        while user_option != "p" && user_option != "r" && user_option != "s"
            print "Please insert 'p' for 'paper', 'r' for 'rock' or 's' for 'scissors': "
            user_option = gets.strip
        end

        user_option
    end

    # return "Paper or Rock or Scissors
    def get_computer_choice
        index = Random.new.rand(0..2)
        @computer_choices[index]
    end

    # return 1 for user win, 0 for draw or -1 for computer win
    # comparing user_choice with computer_choice
    def evaluate user_choice, computer_choice 
        if ((user_choice == 'p' && computer_choice == "Rock") || (user_choice == "r" && computer_choice == "Scissors") || (user_choice == "s" && computer_choice == "Paper"))
            return 1
        elsif user_choice == computer_choice[0].downcase
            return 0
        end

        return -1
    end

    # Send the response based on the codes (1, 0 and -1) of 
    # comparison (user_choice x computer_choice)
    def send_response winner_code, computer_choice
        if winner_code == 1
            puts "User win. Computer selected '" + computer_choice + "'"
        elsif winner_code == 0
            puts "Draw. Computer selected '" + computer_choice + "'"
        else
            puts "Computer win. Computer selected '" + computer_choice + "'"
        end
    end
end

Jankenpo.new
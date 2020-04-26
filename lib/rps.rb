require_relative 'pieces'

ENTRY_TO_SYM = {'p' => Paper.new, 'r' => Rock.new, 's' => Scissors.new}
VALID_ENTRIES = ENTRY_TO_SYM.keys
COMPUTER_CHOICES = ENTRY_TO_SYM.values

class RockPaperScissors
  def initialize
    @player_score = @computer_score = @ties = @last_status = 0
    @computer_piece = COMPUTER_CHOICES.sample
    @player_piece = COMPUTER_CHOICES.sample
  end

  def play(winning_score)
    while @player_score < winning_score && @computer_score < winning_score
      puts "Player score: #{@player_score}, " +
               "Computer score: #{@computer_score}, Ties: #{@ties}"

      @computer_piece = compute_move @player_piece, @computer_piece, @last_status
      @player_piece = player_choice
      puts "\nPlayer chooses #{@player_piece.to_s}"
      puts "Computer chooses #{@computer_piece.to_s}"

      status = @computer_piece <=> @player_piece
      case status
      when 1
        puts "#{@player_piece.to_s} beats #{@computer_piece.to_s}, player wins the round"
        @player_score += 1
      when -1
        puts "#{@computer_piece.to_s} beats #{@player_piece.to_s}, computer wins the round"
        @computer_score += 1
      else
        puts "Tie, choose again"
        @ties += 1
      end
      @last_status = status * -1
    end
    puts "\nFinal score: player: #{@player_score}, " +
             "computer: #{@computer_score} (ties: #{@ties})"
    puts (@player_score == 2) ? "Player wins!" : "Yea! Computer wins!"
  end


end

private

def compute_move(player_piece, computer_piece, last_status)
  case last_status
  when 1
    player_piece
  when -1
    COMPUTER_CHOICES.select { |p| p != player_piece && p != computer_piece }.first
  else
    COMPUTER_CHOICES.sample
  end
end

def player_choice
  loop do
    print "Choose rock (r), paper (p) or scissors (s): "
    choice = gets.chomp.downcase
    return ENTRY_TO_SYM[choice] if ENTRY_TO_SYM.key?(choice)
    puts "That entry is invalid. Please re-enter"
  end
end

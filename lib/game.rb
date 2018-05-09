class Game
  class Player
    attr_accessor :name, :place, :purse, :in_penalty_box

    def initialize(name)
      @name           = name
      @place          = 0
      @purse          = 0
      @in_penalty_box = false
    end

    def roll(roll)
      puts "#{name} is the current player"
      puts "They have rolled a #{roll}"

      if in_penalty_box
        if roll % 2 != 0
          puts "#{name} is getting out of the penalty box"
          @in_penalty_box = false
        else
          puts "#{name} is not getting out of the penalty box"
        end
      end
    end

    def right_answer
      puts 'Answer was correct!!!!'
      @purse += 1
      puts "#{name} now has #{purse} Gold Coins."
    end

    def wrong_answer
      puts 'Question was incorrectly answered'
      puts "#{name} was sent to the penalty box"
      @in_penalty_box = true
    end

    def advance(roll)
      @place += roll
      @place -= 12 if @place > 11

      puts "#{name}'s new location is #{place}"
    end

    def has_won?
      purse == 6
    end
  end

  attr_reader :players, :questions

  def initialize
    @players = []

    @questions = {Pop: [], Science: [], Sports: [], Rock: []}
    50.times do |i|
      @questions[:Pop]     << "Pop Question #{i}"
      @questions[:Science] << "Science Question #{i}"
      @questions[:Sports]  << "Sports Question #{i}"
      @questions[:Rock]    << "Rock Question #{i}"
    end
  end

  def add_player(name)
    players.push Player.new(name)

    puts "#{name} was added"
    puts "They are player number #{@players.size}"
  end

  def playable?
    players.size >= 2
  end

  def current_player
    players.first
  end

  def change_player
    players.push players.shift
  end

  def ask_question
    puts "The category is #{current_category}"
    puts questions[current_category].shift
  end

  private

  def current_category
    %I[Pop Science Sports Rock][current_player.place % 4]
  end
end

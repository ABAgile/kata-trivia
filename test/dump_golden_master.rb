require_relative '../lib/game'

5.times do |idx|
  srand(idx + 2000)
  puts "===== iteration #{idx + 1} started ====="

  game = Game.new
  %w[Jessica Kelly Veronique].each { |player| game.add_player(player) }

  round = 0
  loop do
    puts "------ round #{round += 1} -----"
    dice = rand(1..6)
    player = game.current_player
    player.roll(dice)
    unless player.in_penalty_box
      player.advance(dice)
      game.ask_question
      dice > 4 ? player.right_answer : player.wrong_answer
      break if player.has_won?
    end
    game.change_player
  end

  puts "===== iteration #{idx + 1} end ====="
  puts
end

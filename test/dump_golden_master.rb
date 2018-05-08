require_relative '../lib/game'

5.times do |idx|
  srand(idx + 2000)
  puts "===== iteration #{idx + 1} started ====="

  game = Game.new
  %w[Jessica Kelly Veronique].each { |player| game.add(player) }

  round = 0
  loop do
    puts "------ round #{round += 1} -----"
    dice = rand(1..6)
    game.roll(dice)
    break unless dice > 4 ? game.was_correctly_answered : game.wrong_answer
  end

  puts "===== iteration #{idx + 1} end ====="
  puts
end

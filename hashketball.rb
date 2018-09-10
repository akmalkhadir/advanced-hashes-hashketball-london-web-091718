require "pry"
# Write your code here!

def game_hash
    game = {
          home: {
            team_name: "Brooklyn Nets",
            colors:["Black", "White"],
            players: {
              "Alan Anderson" => {
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1
              },

              "Reggie Evans" => {
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7
              },

              "Brook Lopez" => {
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15
              },

              "Mason Plumlee" => {
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 12,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5
              },

              "Jason Terry" => {
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1
              }
            }
          },

          away: {
            team_name:"Charlotte Hornets",
            colors:["Turquoise", "Purple"] ,
            players: {
              "Jeff Adrien" => {
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2
              },

              "Bismak Biyombo" => {
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 7,
                blocks: 15,
                slam_dunks: 10
              },

              "DeSagna Diop" => {
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
              },

              "Ben Gordon" => {
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0
              },

              "Brendan Haywood" => {
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 22,
                blocks: 5,
                slam_dunks: 12
              }
            }
          }
  }
end


def num_points_scored (player_name)
  game_hash.each do |team, details|
    details[:players].each do |name, stats|
      if name == player_name
        return stats[:points]
      end
    end
  end
end

def shoe_size (player_name)
  game_hash.each do |team, details|
    details[:players].each do |name, stats|
      if name == player_name
        return stats[:shoe]
      end
    end
  end
end

def team_colors (team_name)
  game_hash.each do |team, details|
    if details[:team_name] == team_name
        return details[:colors]
    end
  end
end

def team_names
  game_hash.map do |team_position, details|
    details[:team_name]
  end
end

def player_numbers (team_name)
team_numbers = []
  game_hash.each do |team, details|
    if details[:team_name] == team_name
        details[:players].map do |name, stats|
          team_numbers << stats[:number]
        end
    end
  end
  team_numbers
end

def player_stats (player_name)
  game_hash.each do |team, details|
    details[:players].each do |name, stats|
      if name == player_name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  biggest_size = 0
  biggest_size_name = ""
  game_hash.each do |team, details|
    details[:players].each do |name, stats|
      if stats[:shoe] > biggest_size
        biggest_size = stats[:shoe]
        biggest_size_name = name
      end
    end
  end
  player_stats(biggest_size_name)[:rebounds]
end

def most_points_scored
  most_points = 0
  most_points_name = ""
  game_hash.each do |team, details|
    details[:players].each do |name, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        most_points_name = name
      end
    end
  end
  most_points_name
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |name, details|
    home_points += details[:points]
  end
  game_hash[:away][:players].each do |name, details|
    away_points += details[:points]
  end
  if home_points > away_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name_length = 0
  longest_name = ""
  game_hash.each do |team, details|
    details[:players].each do |name, stats|
      if name.size > longest_name_length
        longest_name_length = name.size
        longest_name = name
      end
    end
  end
  longest_name
end

def most_steals
  most_steals = 0
  most_steals_name = ""
  game_hash.each do |team, details|
    details[:players].each do |name, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        most_steals_name = name
      end
    end
  end
  most_steals_name
end

def long_name_steals_a_ton?
  if most_steals == player_with_longest_name
    true
  end
end

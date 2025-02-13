require "pry"


def game_hash
  hash = {
    
    :home =>  {
      :team_name => "Brooklyn Nets" ,
      :colors => [ "Black" , "White" ] ,
      :players =>[{
          :player_name => "Alan Anderson" ,
          :number => 0 ,
          :shoe => 16 ,
          :points => 22 ,
          :rebounds => 12 ,
          :assists => 12 ,
          :steals => 3 ,
          :blocks => 1 ,
          :slam_dunks => 1
         },
        { :player_name => "Reggie Evans" ,
          :number => 30 ,
          :shoe => 14 ,
          :points => 12 ,
          :rebounds => 12 ,
          :assists => 12 ,
          :steals => 12 ,
          :blocks => 12 ,
          :slam_dunks => 7
      }, 
      
      {   :player_name => "Brook Lopez" ,
          :number => 11 ,
          :shoe => 17 ,
          :points => 17 ,
          :rebounds => 19 ,
          :assists => 10 ,
          :steals => 3 ,
          :blocks => 1 ,
          :slam_dunks => 15 
        } ,
        
        
     {    :player_name => "Mason Plumlee" ,
          :number => 1 ,
          :shoe => 19 ,
          :points => 26 ,
          :rebounds => 11 ,
          :assists => 6 ,
          :steals => 3 ,
          :blocks => 8 ,
          :slam_dunks => 5
        } ,
        
    {     :player_name => "Jason Terry" ,
          :number => 31 , 
          :shoe => 15 ,
          :points => 19 ,
          :rebounds => 2 ,
          :assists => 2 ,
          :steals => 4 ,
          :blocks => 11 ,
          :slam_dunks => 1
       }
  ]
 }      ,      
  
  
   :away => {
     :team_name => "Charlotte Hornets" ,
     :colors => ["Turquoise" , "Purple"] ,
     :players =>[{
          :player_name => "Jeff Adrien" ,
          :number => 4 ,
          :shoe => 18 ,
          :points => 10 ,
          :rebounds => 1 ,
          :assists => 1 ,
          :steals => 2 ,
          :blocks => 7 ,
          :slam_dunks => 2
       },
        {
          :player_name => "Bismack Biyombo" ,
          :number => 0 ,
          :shoe => 16 ,
          :points => 12 ,
          :rebounds => 4 ,
          :assists => 7 ,
          :steals => 22 ,
          :blocks => 15 ,
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop" ,
          :number => 2 ,
          :shoe => 14 ,
          :points => 24 ,
          :rebounds => 12 ,
          :assists => 12 ,
          :steals => 4 ,
          :blocks => 5 ,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon" ,
          :number => 8 ,
          :shoe => 15 ,
          :points => 33 ,
          :rebounds => 3 ,
          :assists => 2 ,
          :steals => 1 ,
          :blocks => 1 ,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker" ,
          :number => 33 ,
          :shoe => 15 ,
          :points => 6 ,
          :rebounds => 12 ,
          :assists => 12 ,
          :steals => 7 ,
          :blocks => 5 ,
          :slam_dunks => 12
        }
     ]
   }
  }
  
end
  





def num_points_scored (player_name)
game_hash.each do |home_away,team_info|
team_info.each do |attribute, data|
if attribute == :players
data.each do |player|
  if player[:player_name] == player_name
 return player[:points]
end
end
end
end
end
end


def shoe_size (player_name)
 game_hash.each do |home_away,team_info|
team_info.each do |attribute, data|
if attribute == :players
data.each do |player|
  if player[:player_name] == player_name
 return player[:shoe]
end
end
end
end
end
end


def team_colors(nombre)
game_hash.each do |home_away,team_info|
if team_info[:team_name] == nombre
 return team_info[:colors]
    
end
end
end


def team_names 
  array = []
  game_hash.each do |home_away,team_info|
    array.push(team_info[:team_name])
end 
array
end



def player_numbers (team_name)
  array =[]
  game_hash.each do |home_away,team_info|
    if team_info[:team_name] == team_name
      team_info.each do |attribute,data|
    if attribute == :players
      data.each do |player|
       array << player[:number]
    end
end
end
end
end
array
end


def player_stats (name)
  hash = {}
  game_hash.each do|home_away,team_info|
  team_info.each do |attribute, data|
  if attribute == :players
  data.each do |player|
    if player[:player_name] == name
      hash = player.delete_if do |k,v|
        k == :player_name
  end
end
end
end
end
end
hash
end




def big_shoe_rebounds
  player_big = 0
  rebounds = 0
    game_hash.each do | team, team_details_hash|
      team_details_hash[:players].each do | stats |
        if stats[:shoe] > player_big
          player_big = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  rebounds
end



def most_points_scored
    player_big = 0
  player_name = ""
    game_hash.each do | team, team_details_hash|
      team_details_hash[:players].each do | stats |
        if stats[:points] > player_big
          player_big = stats[:points]
          player_name = stats[:player_name]
        end
      end
    end
  player_name
end



def winning_team
  total_points = 0
  win_team = ''
  game_hash.each do |home_away, keys|
    team_points = 0
    team_name = game_hash[home_away][:team_name]
    keys[:players].each do |player|
      points = player[:points]
      team_points += points
    end
     if team_points > total_points
       win_team = team_name
        total_points = team_points
  
  end
  end
  return win_team
end




def player_with_longest_name
  longest_name= ''
  longest_length = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      name_length = player[:player_name].length
       if name_length > longest_length
     longest_name = player[:player_name]
     longest_length =name_length
     
     
     end    
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  steals_most = ''
  most_steals = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      
      if player[:steals] > most_steals
        steals_most = player[:player_name]
        most_steals= player[:steals] 
    end
  end
end
  return true if steals_most == player_with_longest_name
end


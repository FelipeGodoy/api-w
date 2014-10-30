class Game < ActiveRecord::Base
  has_many :players
  has_many :shots
  
  scope :actives, ->{where(:active=> true)}
  scope :in_room, ->{where(:in_room => true)}
  
  def raffle_color
    colors = (1..6).to_a
    used_colors = self.players.map(&:color)
    colors.reject{|c| used_colors.include?(c)}.sample
  end
  
  def start
    self.raffle_goals
    self.raffle_territories
    self.raffle_order
    self.in_room = false
    self.active = true
    self.save
  end
  
  def full_json
    players = JSON.parse self.players
    json = JSON.parse self.to_json
    json["players"] = players
    json.to_json
  end
  
  private
  
  def raffle_goals
    colors = self.players.map(&:color)
    goals = self.n_goals.times.to_a.reject{|c| colors.include? c}
    self.players.each do |player|
      player.goal_id = (goals - [player.color]).sample
      player.save
    end
  end
  
  def raffle_territories
    territories = self.n_territories.times.to_a.shuffle
    players = self.players
    territories.each_with_index do |territory, index|
      players[index % players.count].init_territories += ","+territory
    end
    players.each do |p|
      p.init_territories[0] = '['
      p.init_territories += ']'
      p.save
    end
  end
  
  def raffle_order
    players = self.players.shuffle
    players.each_with_index do |player, index|
      player.order = index + 1
      player.save
    end
  end
  
end
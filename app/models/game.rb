class Game < ActiveRecord::Base
  has_many :players
  
  scope :actives, ->{where(:active=> true)}
  scope :in_room, ->{where(:in_room => true)}
  
  def raffle_color
    colors = (1..6).to_a
    used_colors = self.players.map(&:color)
    colors.reject{|c| used_colors.include?(c)}.shuffle.first
  end
  
  def start
    self.raffle_goals
    self.raffle_territories
    self.raffle_order
  end
  
  private
  
  def raffle_goals
    colors = self.players.map(&:color)
    a = (1..self.n_goals).to_a.reject{|c| colors.include? c}
    
  end
  
  def raffle_territories
    
  end
  
  def raffle_order
    
  end
  
end
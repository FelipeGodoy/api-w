class Room
  
  @@all = []
  @@indexId  = 0
  
  attr_accessor :id
  attr_accessor :players
  
  def self.all
    @@all
  end
  
  def self.add_room(room)
    @@all += room
  end
  
  def initialize(creator_player)
    @id = @@indexId++
    @players = [creator_player]
  end
  
  def self.find(id)
    @@all.detect{|r| r.id == id}
  end
  
end

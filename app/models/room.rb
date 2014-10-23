class Room
<<<<<<< HEAD
    belongs_to :game

  @@id = 0

  def initialize (name)
    self.name = name
    @@id += 1
  end

  def self.id
    @@id
  end

end
=======
  
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
>>>>>>> 25b0de16a751cb832089a0e2107fb79f4cbfe7de

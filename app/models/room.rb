class Room
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
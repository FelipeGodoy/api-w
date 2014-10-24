class Game < ActiveRecord::Base
  include ActiveModel::Model
  attr_accessor :n_pla, :n_terr, :n_obj

  @@id = 0

  def new(n_pla,n_terr,n_obj)
    @@id += 1
  end

  def self.id
    @@id
  end

end
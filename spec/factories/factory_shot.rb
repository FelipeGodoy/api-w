FactoryGirl.define do
  factory :shot do
    index_in_game 2
    association :game
  end
end
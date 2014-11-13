FactoryGirl.define do
  factory :player do
    name 'player'
    type_id 1
    goal_id 2
    order 1
    color 3
    #association :game
  end
end
FactoryGirl.define do
  factory :game do
    name 'teste'
    n_territories '10'
    n_goals '10'
    active true
    in_room true
  end
end
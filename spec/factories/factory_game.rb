FactoryGirl.define do
  factory :game do
    name 'teste'
    n_territories '42'
    n_goals '10'
    active true
    in_room true
  end
end
FactoryBot.define do
  password = Faker::Internet.password(min_length: 7)
  factory :user do
    nickname              {Faker::Internet.user_name}
    email                 {Faker::Internet.email}
    password              {password}
    password_confirmation {password}
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"ハナコ"}
    birthday              {"2000-01-01"}
  end

end
FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"11111aa"}
    password_confirmation {"11111aa"}
    family_name           {"山Ｄａ"}
    first_name            {"はなコ"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"ハナコ"}
    birthday              {"2000-01-01"}

  end

end
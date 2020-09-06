FactoryBot.define do
  factory :user do
    nickname              {"hasegawa"}
    email                 {"unique@gmail.com"}
    password              {"abcd1234"}
    password_confirmation {password}
    last_name             {"長谷川"}
    first_name            {"雄一"}
    last_name_kana        {"ハセガワ"}
    first_name_kana       {"ユウイチ"}
    birth_date            {"Mar, 28 Mar 1986"}
  end
end
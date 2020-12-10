FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password  {'1a' + Faker::Internet.password(min_length: 7, max_length: 20)}
    password_confirmation {password}
    birthday{'2020-12-08'}
    first_name{'齊木'}
    last_name {'雅也'}
    first_name_kana{'サイキ'}
    last_name_kana {'マサヤ'}
  end
end
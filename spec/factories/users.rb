FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name{"やマ田"}
    first_name{"太ろウ"}
    family_name_kana{"ヤマダ"}
    first_name_kana{"タロウ"}
    birthday{"2000-01-01"}
  end
end
FactoryBot.define do
  factory :user do
    nick_name { 'aaaa' }
    email                 { Faker::Internet.email }
    # emailのみfakerでランダムなデータを生成できるようにご修正
    password              { 'a00000' }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_katakana    { 'タナカ' }
    first_name_katakana   { 'タロウ' }
    date_of_bath          { '1930-01-01' }
  end
end

FactoryBot.define do
  factory :shipping_infomation_purchase_record do
    postal_code       { '981-3302' }
    prefecture_id     { '2' }
    municipalities    { '富谷市' }
    address           { 'ひより台2-1' }
    building          { 'スカイハイツ' }
    phone_number      { '08063552112' }
    token             { 'tok123qwe' }
  end
end

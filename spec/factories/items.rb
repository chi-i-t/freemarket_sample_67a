factory :item do
  name                  {""}
  description           {""}
  price                 {"1000"}
  business_result       {"900"}
  category_id           {"215"}
  prefecture_id         {"2"}
  delivery_fee_id       {"1"}
  delivery_way_id       {"1"}
  delivery_day_id       {"1"}
  item_condition_id     {"2"}
  status                {"0"}
  image                 {File.open("#{Rails.root}/public/images/test_image.jpg")}
end
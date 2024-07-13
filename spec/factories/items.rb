FactoryBot.define do
  factory :item do
    name { "Sample Item" }
    description { "Sample Description" }
    price { 1000 }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    association :user

    after(:build) do |item|
      file_path = Rails.root.join("spec", "fixtures", "files", "test_image.png")
      if File.exist?(file_path)
        item.image.attach(io: File.open(file_path), filename: "test_image.png", content_type: "image/png")
      else
        puts "File not found: #{file_path}"
      end
    end
  end
end

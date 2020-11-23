FactoryBot.define do
  factory :news do
    title { "test" }
    content { "some content" }
    user_id { 1 }
  end
end
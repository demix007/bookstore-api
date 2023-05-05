FactoryBot.define do
    factory :category do
        title { Faker::Book.title}
        author { Faker::Book.author}
        category { create(:category) }
    end
end
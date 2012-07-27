require 'faker'

namespace :db do
  desc  "Fill database with sample database"
  task populate: :environment do


    99.times do |n|
      url = "www.#{n}-example.com"
      title = Faker::Company.catch_phrase
      body = Faker::Lorem.paragraph

      Story.create!(url: url,
                  title: title,
                  user_id: (rand(20) + 1))

      User.create!(twitter_handle: Faker::Name.name )

      8.times do  
        Comment.create!(body: body,
                        user_id: (rand(99) + 1),
                        parent_id: (rand(99) + 1),
                        parent_type: "Story")
      end
    end
  end
end
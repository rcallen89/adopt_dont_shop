FactoryBot.define do
  factory :pet do
    name { "Athena" }
    age { "1" }
    sex { "F" }
    description { "butthead" }
    image { "https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg" }
    status { "available" }
    shelter
  end
end
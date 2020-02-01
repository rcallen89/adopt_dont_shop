FactoryBot.define do
  factory :shelter do
    name { "Pets R Us" }
    address { "123 Main St" }
    city { "Denver" }
    state { "CO" }
    zip { "80134" }
  end

  factory :shelter2 do
    name { "Petopia" }
    address { "4343 1st St" }
    city { "Denver" }
    state { "CO" }
    zip { "80134" }
  end
end
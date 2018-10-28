FactoryBot.define do
  factory :author do
    first_name { "Alan" }
    last_name { "Turing" }
    homepage { "http://wikipedia.de/Alan_Turing" }
  end

  factory :author_two, class: Author do
    first_name { "Edsger" }
    last_name { "Dijkstra" }
    homepage { "https://en.wikipedia.org/wiki/Edsger_W._Dijkstra" }
  end
end

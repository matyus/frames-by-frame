FactoryBot.define do
  factory :film do
    title { 'The Driller Killer' }
    hours { 0 }
    minutes { 0 }
    seconds { 0 }
    milliseconds { 0 }

    trait :last_millisecond do
      hours { 0 }
      minutes { 0 }
      seconds { 0 }
      milliseconds { 990 }
    end

    trait :last_second do
      hours { 0 }
      minutes { 0 }
      seconds { 59 }
      milliseconds { 0 }
    end

    trait :last_minute do
      hours { 0 }
      minutes { 59 }
      seconds { 0 }
      milliseconds { 0 }
    end
  end
end

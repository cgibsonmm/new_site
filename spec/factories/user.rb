FactoryBot.define do
  factory :user do
    username {'testuser'}
    email {'testemail@email.com'}
    password {'password123'}
    password_confirmation {'password123'}
  end
end

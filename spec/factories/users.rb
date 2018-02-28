FactoryGirl.define do
  factory :user do
    first_name "Salvador"
    last_name 'Piña'
    username "admin"
    password "12345678"
    email "admin@cryptographyandsolutions.com"
    admin true
  end

  factory :company do
    name "Cryptography and Solutions"
    nit "123.123.123.123"
    direction "asd asd asdaasdasd asdasd asd"
    city "Roma"
    country "Italia"
  end

end

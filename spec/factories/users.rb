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
    name "Alexander Pulido"
    nit "V-21.112.848"
    direction "Av. el Tenis, calle Dominó, Quinta Amelia Mercedes"
    city "Coro"
    state "Falcón"
    country "Venezuela"
  end

end

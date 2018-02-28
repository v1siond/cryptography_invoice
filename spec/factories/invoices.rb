FactoryGirl.define do
  factory :client do |c|
    c.sequence(:name) { |n| "user-#{n}"}
    c.direction "Venezuela"
    c.sequence(:phone) { |n| "+58-#{n}"}
    c.sequence(:identification) { |n| "#{n}"}
  end

  factory :product do |p|
    p.sequence(:name) { |n| "product-#{n}"}
    p.sequence(:price) { |n| "#{n}.00"}
  end

  factory :invoice_product do |ip|
    ip.invoice_id 1
    ip.sequence(:product_id) { |n| n }
    ip.product_quantity 3
  end

  factory :invoice do
    date Time.zone.now
    balance "200.52"
    status true
    client_id 1
    company_id 1
    tax 2.5
    factory :invoice_with_product do
      after(:create) do |invoice|
        create_list(:invoice_product, 3)
      end
    end
  end

end

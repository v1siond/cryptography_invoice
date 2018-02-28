# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
    @user = User.create(first_name: 'Salvador', last_name: 'Piña', username: 'admin', password: '12345678', admin: true, email: 'admin@cryptoraphyandsolutions.com')
    puts 'CREATED ADMIN USER: ' <<  @user.email

    2.times do
      @client = FactoryGirl.create(:client)
      puts 'CREATED CLIENT: ' <<  @client.name
    end

    @company = FactoryGirl.create(:company)
    puts 'CREATED COMPANY: ' <<  @company.name

    10.times do
      @product = FactoryGirl.create(:product)
      puts 'CREATED PRODUCT: ' <<  @product.name
    end

    @invoice = FactoryGirl.create(:invoice_with_product)
    puts 'CREATED INVOICE: ' <<  @invoice.id


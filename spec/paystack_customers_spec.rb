require 'spec_helper'
require 'paystack/objects/customers.rb'
require 'paystack.rb'
	
describe PaystackCustomers do
	it "should return a valid customers object" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		customers = PaystackCustomers.new(paystack)
		expect(customers.nil?).to eq false
	end

	it "should return a list of customers" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		customers = PaystackCustomers.new(paystack)
		expect(customers.nil?).to eq false
		list =  customers.list(1)
		expect(list.nil?).to eq false
	end

	it "should return a customer hashset/object" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		customers = PaystackCustomers.new(paystack)
		expect(customers.nil?).to eq false
		list =  customers.list(1)
		expect(list.nil?).to eq false
		temp = list["data"][0]
		hash=customers.get(temp['id'])
		expect(hash.nil?).to eq false
		expect(hash['data']['id'].nil?).to eq false
	end

	it "should successfuly update a customer" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		customers = PaystackCustomers.new(paystack)
		expect(customers.nil?).to eq false
		list =  customers.list(1)
		expect(list.nil?).to eq false
		temp = list["data"][0]
		hash=customers.update(temp['id'], :first_name => "Victor", :last_name => "Ikoro", :phone => "+2347061544884")
		expect(hash.nil?).to eq false
		expect(hash['data']['id'].nil?).to eq false
	end

	it "should successfuly create a customer" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		customers = PaystackCustomers.new(paystack)
		expect(customers.nil?).to eq false
		temp = Random.new_seed.to_s 
		hash=customers.create(:first_name => "#{temp[0..6]}-person", :last_name => "Ogbonge", :phone => "+23470#{temp[0..6]}",:email => "#{temp[0..6]}@gmail.com")
		puts hash
		expect(hash.nil?).to eq false
		expect(hash['data']['id'].nil?).to eq false
	end


end


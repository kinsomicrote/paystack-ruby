require 'spec_helper'
require 'paystack/objects/subaccounts.rb'
require 'paystack.rb'


describe PaystackSubaccounts do
	it "should return a valid subaccounts object" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		subaccounts = PaystackSubaccounts.new(paystack)
		expect(subaccounts.nil?).to eq false
	end

	it "should return a list of subaccounts" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		subaccounts = PaystackSubaccounts.new(paystack)
		expect(subaccounts.nil?).to eq false
		list =  subaccounts.list(1)
		expect(list.nil?).to eq false
	end

	it "should return a subaccount hashset/object" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		subaccounts = PaystackSubaccounts.new(paystack)
		expect(subaccounts.nil?).to eq false
		list =  subaccounts.list(1)
		expect(list.nil?).to eq false
		temp = list["data"][0]
		hash=subaccounts.get(temp['id'])
		expect(hash.nil?).to eq false
		expect(hash['data']['id'].nil?).to eq false
	end

	it "should successfuly update a subaccount" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		subaccounts = PaystackSubaccounts.new(paystack)
		expect(subaccounts.nil?).to eq false
		list =  subaccounts.list(1)
		expect(list.nil?).to eq false
		temp = list["data"][0]
		hash=subaccounts.update(temp['id'], :percentage_charge => 2.5, :primary_contact_email => "xxxrr@gmail.com")
		expect(hash.nil?).to eq false
		expect(hash['data']['id'].nil?).to eq false
	end

	it "should successfuly create a subaccount" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		subaccounts = PaystackSubaccounts.new(paystack)
		expect(subaccounts.nil?).to eq false
		temp = Random.new_seed.to_s
    #If test fails, try to use a valid account details
		hash=subaccounts.create(:business_name => "#{temp[0..6]}-business", :settlement_bank => "Polaris Bank", :account_number => "0326179180", :percentage_charge => 2.5)
		puts hash
		expect(hash.nil?).to eq false
		expect(hash['data']['id'].nil?).to eq false
	end


end

require 'spec_helper'
require 'paystack/objects/plans.rb'
require 'paystack.rb'
	
describe PaystackPlans do
	it "should return a valid plans object" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		plans = PaystackPlans.new(paystack)
		expect(plans.nil?).to eq false
	end

	it "should return a list of plans" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		plans = PaystackPlans.new(paystack)
		expect(plans.nil?).to eq false
		list =  plans.list(1)
		#puts list
		expect(list.nil?).to eq false
	end

	it "should return a plan hashset/object" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		plans = PaystackPlans.new(paystack)
		expect(plans.nil?).to eq false
		list =  plans.list(1)
		expect(list.nil?).to eq false
		temp = list["data"][0]
		hash=plans.get(temp['id'])
		expect(hash.nil?).to eq false
		expect(hash['data']['id'].nil?).to eq false
	end

	it "should successfuly update a plan" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		plans = PaystackPlans.new(paystack)
		expect(plans.nil?).to eq false
		list =  plans.list(1)
		expect(list.nil?).to eq false
		temp = list["data"][0]
		hash = plans.update(
			temp['id'],
			:name => "Test Plan Updated",
			:description => "Dev Test Plan Updated", 
			:amount => 30000, #in KOBO
			:interval => "monthly",
			:currency => "NGN"
	    )
		puts hash
		expect(hash.nil?).to eq false
		expect(hash['status']).to eq true
	end

	it "should successfuly create a plan" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		plans = PaystackPlans.new(paystack)
		expect(plans.nil?).to eq false
		temp = Random.new_seed.to_s
		hash=plans.create(
			:name => "#{temp[0..6]} Test Plan",
			:description => "Dev Test Plan Updated", 
			:amount => 30000, #in KOBO
			:interval => "monthly", #monthly, yearly, quarterly, weekly etc 
			:currency => "NGN"

			)

		expect(hash.nil?).to eq false
		expect(hash['data']['id'].nil?).to eq false
	end


end
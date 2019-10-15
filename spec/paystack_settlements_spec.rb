require 'spec_helper'
require 'paystack/objects/settlements.rb'
require 'paystack.rb'

	
describe PaystackSettlements do

	it "should return a list of settlements made" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		settlements = PaystackSettlements.new(paystack)
		expect(settlements.nil?).to eq false
		list =  settlements.list
		#puts list
		expect(settlements.nil?).to eq false
	end
end
require 'spec_helper'
require 'paystack/objects/banks.rb'
require 'paystack.rb'


describe PaystackBanks do

	it "should return a list of banks" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		banks = PaystackBanks.new(paystack)
		expect(banks.nil?).to eq false
		list =  banks.list(1)
		expect(list.nil?).to eq false
	end

end

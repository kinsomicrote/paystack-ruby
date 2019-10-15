require 'spec_helper'
require 'paystack/objects/balance.rb'
require 'paystack.rb'

describe PaystackBalance do

	it "should return paystack account balance" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		balance = PaystackBalance.new(paystack)
		expect(balance.nil?).to eq false
		hash =  balance.get
		expect(hash.nil?).to eq false
		expect(hash['message']).to eq "Balances retrieved"
	end

end

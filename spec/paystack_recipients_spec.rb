require 'spec_helper'
require 'paystack/objects/recipients.rb'
require 'paystack.rb'
	
describe PaystackRecipients do
	it "should return a valid recipients object" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		plans = PaystackRecipients.new(paystack)
		expect(plans.nil?).to eq false
	end

	it "should return a list of recipients" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		plans = PaystackRecipients.new(paystack)
		expect(plans.nil?).to eq false
		list =  plans.list(1)
		puts list
		expect(list.nil?).to eq false
	end

	it "should successfuly create a recipient" do
		paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
		recipients = PaystackRecipients.new(paystack)
		expect(recipients.nil?).to eq false
		temp = Random.new_seed.to_s
		hash=recipients.create(
			:type => "nuban", #Must be nuban
			:name => "#{temp[0..2]} Test Plan",
			:description => "Dev Test Plan Updated",
      :account_number => "0326179180", #if test fails, use a valid account number
			#:account_number => temp[0..9], #10 digit account number
			:bank_code => "076", #monthly, yearly, quarterly, weekly etc
			:currency => "NGN",

			)
		puts hash
		expect(hash.nil?).to eq false
		expect(hash['data']['id'].nil?).to eq false
		#expect(hash['message']).to eq "Recipient created"
	end


end
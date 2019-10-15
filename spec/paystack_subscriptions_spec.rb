require 'spec_helper'
require 'paystack/objects/subscriptions.rb'
require 'paystack.rb'


public_test_key = ENV['public_test_key']
private_test_key = ENV['private_test_key']

describe PaystackSubscriptions do

  # public_test_key = "pk_test_fd20f3e98e1dd6e9c6f82e2c03c1774202dd50bf"
  # private_test_key = "sk_test_e2aedab3940c88dbe9fa8deed50cb1cba2e4e7cb"

  it "should return a valid subscriptions object" do
    paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
    subscriptions = PaystackSubscriptions.new(paystack)
    expect(subscriptions.nil?).to eq false
  end

  it "should return a subscription hashset/object" do
    paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
    subscriptions = PaystackSubscriptions.new(paystack)
    expect(subscriptions.nil?).to eq false

    plans = PaystackPlans.new(paystack)
    temp = Random.new_seed.to_s

    plan = plans.create(
        :name => "#{temp[0..6]} Test Plan",
        :description => "Dev Test Plan Updated",
        :amount => 30000, #in KOBO
        :interval => "monthly",
        :currency => "NGN"

    )

    subscription = subscriptions.create(
        :customer => "lol@gmail.com",
        :plan => plan["data"]["plan_code"]
    )


    puts "Subscription #{subscription}"

    hash = subscriptions.get(subscription['data']['id'])
    
    puts hash
    
    # expect(hash.nil?).to eq false
    # expect(hash['data']['id'].nil?).to eq false
  end


  it "should successfuly create a subscription" do
    paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
    subscriptions = PaystackSubscriptions.new(paystack)
    expect(subscriptions.nil?).to eq false

    plans = PaystackPlans.new(paystack)
    temp = Random.new_seed.to_s

    plan= plans.create(
        :name => "#{temp[0..6]} Test Plan",
        :description => "Dev Test Plan Updated",
        :amount => 30000, #in KOBO
        :interval => "monthly",
        :currency => "NGN"

    )

    hash = subscriptions.create(
        :customer => "lol@gmail.com",
        :plan => plan["data"]["plan_code"]
    )
    
    puts hash

    expect(hash.nil?).to eq false
    expect(hash['data']['id'].nil?).to eq false
  end

  it "should successfully disable a subscription" do
      paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
      subscriptions = PaystackSubscriptions.new(paystack)
      plans = PaystackPlans.new(paystack)


      temp = Random.new_seed.to_s
      plan = plans.create(
          :name => "#{temp[0..6]} Test Plan",
          :description => "Dev Test Plan Updated",
          :amount => 30000, #in KOBO
          :interval => "monthly", #monthly, yearly, quarterly, weekly etc
          :currency => "NGN"

      )

      subscription = subscriptions.create(
          :customer => "lol@gmail.com",
          :plan => plan["data"]["plan_code"]
      )

      hash = subscriptions.disable(
          :code => subscription["data"]["subscription_code"],
          :token => subscription["data"]["email_token"]
      )

      expect(hash.nil?).to eq false
      expect(hash['status']).to eq true
  end

  it "should successfully enable a subscription" do
    paystack = Paystack.new(ENV['public_test_key'], ENV['private_test_key'])
    subscriptions = PaystackSubscriptions.new(paystack)
    plans = PaystackPlans.new(paystack)


    temp = Random.new_seed.to_s
    plan = plans.create(
        :name => "#{temp[0..6]} Test Plan",
        :description => "Dev Test Plan Updated",
        :amount => 30000, #in KOBO
        :interval => "monthly", #monthly, yearly, quarterly, weekly etc
        :currency => "NGN"

    )

    subscription = subscriptions.create(
        :customer => "lol@gmail.com",
        :plan => plan["data"]["plan_code"]
    )

    subscriptions.disable(
        :code => subscription["data"]["subscription_code"],
        :token => subscription["data"]["email_token"]
    )

    hash =  subscriptions.enable(
        :code => subscription["data"]["subscription_code"],
        :token => subscription["data"]["email_token"]
    )

    expect(hash.nil?).to eq false
    expect(hash['status']).to eq true
  end


end

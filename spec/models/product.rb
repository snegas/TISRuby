require 'rails_helper'

describe Product, :type => :model do
  context 'when has empty name' do
    it { FactoryGirl.build(:products, name: nil).should_not be_valid }
  end

  context 'when has name longer than 50 symbols' do
    it { FactoryGirl.build(:products, name: Faker::Lorem.characters(51)).should_not be_valid }
  end

  context 'when has empty description' do
    it { FactoryGirl.build(:products, description: nil).should_not be_valid }
  end

  context 'when has description longer than 300 symbols' do
    it { FactoryGirl.build(:products, description: Faker::Lorem.characters(301)).should_not be_valid }
  end

  context 'when has empty price' do
    it { FactoryGirl.build(:products, price: nil).should_not be_valid }
  end

  context 'when price == 0' do
    it { FactoryGirl.build(:products, price: 0).should_not be_valid }
  end

  context 'when price < 0' do
    it { FactoryGirl.build(:products, price: -1).should_not be_valid }
  end
end
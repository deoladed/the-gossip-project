require 'rails_helper'

RSpec.describe User, type: :model do

	before(:each) do 
		@user = FactoryBot.create(:user)  	
	end

	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@user).to be_a(User)
		end

    describe "#email" do
      it {expect(@user).to validate_presence_of(:first_name)}
      it {is_expected.to allow_value("OUaichgros").for(:first_name)}
      it {is_expected.to allow_value("Abc").for(:first_name)}
      it {is_expected.to_not allow_value("aa").for(:first_name)}
      it {is_expected.to_not allow_value("azsxdcfvgbnhjmklefewfewf").for(:first_name)}
		end
	end

	context "associations" do
			it { expect(@user).to belong_to(:city) }
	end
end
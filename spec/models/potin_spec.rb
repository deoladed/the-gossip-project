require 'rails_helper'

RSpec.describe Potin, type: :model do
  
	before(:each) do 
		@potin = FactoryBot.create(:potin)  	
	end

	it "has a valid factory" do
		expect(build(:potin)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@potin).to be_a(Potin)
		end

		describe "#email" do
      it {expect(@potin).to validate_presence_of(:title)}
      it {expect(@potin).to validate_presence_of(:content)}
      it {is_expected.to allow_value("OUaichgros").for(:title)}
      it {is_expected.to allow_value("Abc").for(:title)}
      # it {is_expected.to_not allow_value("aa").for(:first_name)}
      # it {is_expected.to_not allow_value("azsxdcfvgbnhjmklefewfewf").for(:first_name)}
		end
	end


		context "associations" do
			it { expect(@potin).to have_many(:tags).with_foreign_key(:tag_id) }
		end
end
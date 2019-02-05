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

		context "associations" do
			it { expect(@potin).to have_many(:tags).with_foreign_key(:tag_id) }
		end
	end
end
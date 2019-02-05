require 'rails_helper'

RSpec.describe PrivateMessage, type: :model do

	before(:each) do 
		@pm = FactoryBot.create(:private_message)  	
	end

	it "has a valid factory" do
		expect(build(:private_message)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@pm).to be_a(PrivateMessage)
		end

		context "associations" do
			it { expect(@pm).to have_many(:recipients).with_foreign_key(:recipient_id) }
		end
	end
end
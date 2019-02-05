require 'rails_helper'

RSpec.describe City, type: :model do
  
  before(:each) do 
		@city = FactoryBot.create(:city)  	
  end

  it "has a valid factory" do
    expect(build(:city)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
    end
  end
end
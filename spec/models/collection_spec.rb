require 'spec_helper'

describe Collection do
	pending 'Add some specs to define collections'
  context 'The collection is created with valid monuments' do
  	it "should create a collection from three monuments" do
  		firstmonument = double("Monument", name: "First name", description: "This is the description")
  		secondmonument = double("Monument", name: "Second name", description: "This is the second description")

  		Collection.create([firstmonument,secondmonument], name: "The First Collection")

  		expect(Collection.all.size).to eq(1)
  	end
  end

  context 'The collection is created with invalid monuments' do
  	
  end

  context 'The collection is editable by only the owner' do

  end
end

require 'spec_helper'

describe Monument do
  context 'creates records with valid parameters' do
  	it "should create a valid record when a correct set of parameters is passed in via the controller" do
  		Monument.create({name: "Test Name", description: "This is the description"})
  		expect(Monument.all.size).to eq(1)
  	end
  	it "should create multiple valid records" do
  		Monument.create({name: "Test Name", description: "This is the description"})
  		Monument.create({name: "Test Name2", description: "This is the description2"})
  		expect(Monument.all.size).to eq(2)
  	end
  	it "should give a validation error when a record is created without a name" do
  		Monument.create({description: "This record has no name"})
  		expect(Monument.all.size).to eq(0)
  	end

  	it "should not create a record with no description" do
  		Monument.create({name: "This record has no description"})
  		expect(Monument.all.size).to eq(0)
  	end
  end
end

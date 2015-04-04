require 'spec_helper'

describe Collection do
	pending 'Add some specs to define collections'
  context 'The collection is created with valid monuments' do
  	it "should create a collection from two monuments" do
  		firstmonument = Monument.create(name: "First name", description: "This is the description")
  		secondmonument = Monument.create(name: "Second name", description: "This is the second description")

  		Collection.create(name: "The First Collection", monuments:([firstmonument,secondmonument]))

  		expect(Collection.first.monuments.to_a.size).to eq(2)
      expect(Collection.first.monuments.first.name).to eq("First name")
      expect(Collection.first.monuments.last.name).to eq("Second name")

  	end

    it "should not create a collection without a name" do
      firstmonument = Monument.create(name: "First name", description: "This is the description")
      secondmonument = Monument.create(name: "Second name", description: "This is the second description")


      newcollection = Collection.new(monuments:([firstmonument,secondmonument]))

      expect(newcollection.save).to eq(false)
    end

    it "should not create a collection with no monuments" do
      newcollection = Collection.new(name: "This cool name")
      expect(newcollection.save).to eq(false)
    end

    it "should associate a collection to the user that creates it" do
      user = User.create(email:"testemail@email.com",password:"password",password_confirmation:"password")
      firstmonument = Monument.create(name: "First name", description: "This is the description")
      secondmonument = Monument.create(name: "Second name", description: "This is the second description")
      newcollection = Collection.new(name: "This cool name",monuments: ([firstmonument,secondmonument]), user: user)
      newcollection.save
      expect(newcollection.user.email).to eq("testemail@email.com")
    end

    it "should be defined as either public or private" do
      user = User.create(email:"testemail@email.com",password:"password",password_confirmation:"password")
      firstmonument = Monument.create(name: "First name", description: "This is the description")
      secondmonument = Monument.create(name: "Second name", description: "This is the second description")
      newcollection = Collection.new(name: "This cool name",monuments: ([firstmonument,secondmonument]), user: user, setpublic: true)
      newcollection.save
      expect(newcollection.setpublic).to be_true
    end


    it "should not be set to public as default" do
      user = User.create(email:"testemail@email.com",password:"password",password_confirmation:"password")
      firstmonument = Monument.create(name: "First name", description: "This is the description")
      secondmonument = Monument.create(name: "Second name", description: "This is the second description")
      newcollection = Collection.new(name: "This cool name",monuments: ([firstmonument,secondmonument]), user: user)
      newcollection.save
      expect(newcollection.setpublic).to be_false
    end
  end

  context 'The collection is created with invalid monuments' do
  	
  end

  context 'The collection is editable by only the owner' do

  end
end

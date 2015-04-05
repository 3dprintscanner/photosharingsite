require 'spec_helper'

describe Image do
	  it "An image has a name, attributes, a description and a date" do
	  	expect(Image.attribute_names).to include("name","image_attributes","description","date")
	  end

	  it "should create an image with valid parameters" do
		newimage = Image.new :photo_file_name => "#{Rails.root}/spec/specassets/railtruck.png"
		newimage.save
		expect(Image.all.size).to eq(1)	  	
	  end

	  it "should belong to a monument" do
	  	monument = Monument.create({name: "Test Name", description: "This is the description"})
	  	newimage = Image.new :photo_file_name => "#{Rails.root}/spec/specassets/railtruck.png", :monument => monument
	  	newimage.save
 		expect(newimage.monument).to eq(monument)
	  end

end

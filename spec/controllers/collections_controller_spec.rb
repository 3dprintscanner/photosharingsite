require 'spec_helper'

describe CollectionsController do

	let(:valid_attributes) { { "name" => "MyString" } }

	# This should return the minimal set of values that should be in the session
	# in order to pass any filters (e.g. authentication) defined in
	# CategoriesController. Be sure to keep this updated too.
	let(:valid_session) {{}}


	describe "GET index" do
	  it "assigns all collections as @collection" do
	    collection = Collection.create! valid_attributes
	    get :index, {}, valid_session
	    assigns(:collection).should eq([collection])
	  end
	end

	describe "GET show" do
	  it "assigns the requested collection as @collection" do
	    collection = Collection.create! valid_attributes
	    get :show, {:id => collection.to_param}, valid_session
	    assigns(:collection).should eq(collection)
	  end
	end

	describe "GET new" do
	  it "assigns a new collection as @collection" do
	    get :new, {}, valid_session
	    assigns(:collection).should be_a_new(Collection)
	  end
	end

	describe "GET edit" do
	  it "assigns the requested collection as @collection" do
	    collection = Collection.create! valid_attributes
	    get :edit, {:id => collection.to_param}, valid_session
	    assigns(:collection).should eq(collection)
	  end
	end

	describe "POST create" do
	  describe "with valid params" do
	    it "creates a new Collection" do
	      expect {
	        post :create, {:collection => valid_attributes}, valid_session
	      }.to change(Collection, :count).by(1)
	    end

	    it "assigns a newly created collection as @collection" do
	      post :create, {:collection => valid_attributes}, valid_session
	      assigns(:collection).should be_a(Collection)
	      assigns(:collection).should be_persisted
	    end

	    it "redirects to the created collection" do
	      # sign_in
	      post :create, {:collection => valid_attributes}, valid_session
	      response.should redirect_to(Collection.last)
	    end
	  end

	  describe "with invalid params" do
	    it "assigns a newly created but unsaved collection as @collection" do
	      # Trigger the behavior that occurs when invalid params are submitted
	      Collection.any_instance.stub(:save).and_return(false)
	      post :create, {:collection => { "name" => "invalid value" }}, valid_session
	      assigns(:collection).should be_a_new(Collection)
	    end

	    it "re-renders the 'new' template" do
	      # Trigger the behavior that occurs when invalid params are submitted
	      Collection.any_instance.stub(:save).and_return(false)
	      post :create, {:collection => { "name" => "invalid value" }}, valid_session
	      response.should render_template("new")
	    end
	  end
	end

	describe "PUT update" do
	  describe "with valid params" do
	    it "updates the requested collection" do
	      collection = Collection.create! valid_attributes
	      # Assuming there are no other categories in the database, this
	      # specifies that the Collection created on the previous line
	      # receives the :update_attributes message with whatever params are
	      # submitted in the request.
	      Collection.any_instance.should_receive(:update).with({ "name" => "MyString" })
	      put :update, {:id => collection.to_param, :collection => { "name" => "MyString" }}, valid_session
	    end

	    it "assigns the requested collection as @collection" do
	      collection = Collection.create! valid_attributes
	      put :update, {:id => collection.to_param, :collection => valid_attributes}, valid_session
	      assigns(:collection).should eq(collection)
	    end

	    it "redirects to the collection" do

	      collection = Collection.create! valid_attributes
	      put :update, {:id => collection.to_param, :collection => valid_attributes}, valid_session
	      response.should redirect_to(collection)
	    end
	  end

	  describe "with invalid params" do
	    it "assigns the collection as @collection" do
	      collection = Collection.create! valid_attributes
	      # Trigger the behavior that occurs when invalid params are submitted
	      Collection.any_instance.stub(:save).and_return(false)
	      put :update, {:id => collection.to_param, :collection => { "name" => "invalid value" }}, valid_session
	      assigns(:collection).should eq(collection)
	    end

	    it "re-renders the 'edit' template" do
	      collection = Collection.create! valid_attributes
	      # Trigger the behavior that occurs when invalid params are submitted
	      Collection.any_instance.stub(:save).and_return(false)
	      put :update, {:id => collection.to_param, :collection => { "name" => "invalid value" }}, valid_session
	      response.should render_template("edit")
	    end
	  end
	end

	describe "DELETE destroy" do
	  it "destroys the requested collection" do
	    collection = Collection.create! valid_attributes
	    expect {
	      delete :destroy, {:id => collection.to_param}, valid_session
	    }.to change(Collection, :count).by(-1)
	  end

	  it "redirects to the categories list" do
	    collection = Collection.create! valid_attributes
	    delete :destroy, {:id => collection.to_param}, valid_session
	    response.should redirect_to(categories_url)
	  end
	end
end

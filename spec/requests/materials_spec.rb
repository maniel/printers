require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a material exists" do
  Material.all.destroy!
  request(resource(:materials), :method => "POST", 
    :params => { :material => { :id => nil }})
end

describe "resource(:materials)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:materials))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of materials" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a material exists" do
    before(:each) do
      @response = request(resource(:materials))
    end
    
    it "has a list of materials" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Material.all.destroy!
      @response = request(resource(:materials), :method => "POST", 
        :params => { :material => { :id => nil }})
    end
    
    it "redirects to resource(:materials)" do
      @response.should redirect_to(resource(Material.first), :message => {:notice => "material was successfully created"})
    end
    
  end
end

describe "resource(@material)" do 
  describe "a successful DELETE", :given => "a material exists" do
     before(:each) do
       @response = request(resource(Material.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:materials))
     end

   end
end

describe "resource(:materials, :new)" do
  before(:each) do
    @response = request(resource(:materials, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@material, :edit)", :given => "a material exists" do
  before(:each) do
    @response = request(resource(Material.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@material)", :given => "a material exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Material.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @material = Material.first
      @response = request(resource(@material), :method => "PUT", 
        :params => { :material => {:id => @material.id} })
    end
  
    it "redirect to the material show action" do
      @response.should redirect_to(resource(@material))
    end
  end
  
end


require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a dupa exists" do
  request(resource(:dupas), :method => "POST", 
    :params => { :dupa => { :id => nil }})
end

describe "resource(:dupas)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:dupas))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of dupas" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a dupa exists" do
    before(:each) do
      @response = request(resource(:dupas))
    end
    
    it "has a list of dupas" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      @response = request(resource(:dupas), :method => "POST", 
        :params => { :dupa => { :id => nil }})
    end
    
    it "redirects to resource(:dupas)" do
    end
    
  end
end

describe "resource(@dupa)" do 
  describe "a successful DELETE", :given => "a dupa exists" do
     before(:each) do
       @response = request(resource(Dupa.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:dupas))
     end

   end
end

describe "resource(:dupas, :new)" do
  before(:each) do
    @response = request(resource(:dupas, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@dupa, :edit)", :given => "a dupa exists" do
  before(:each) do
    @response = request(resource(Dupa.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@dupa)", :given => "a dupa exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Dupa.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @dupa = Dupa.first
      @response = request(resource(@dupa), :method => "PUT", 
        :params => { :dupa => {:id => @dupa.id} })
    end
  
    it "redirect to the dupa show action" do
      @response.should redirect_to(resource(@dupa))
    end
  end
  
end


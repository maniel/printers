require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a printer exists" do
  Printer.all.destroy!
  request(resource(:printers), :method => "POST", 
    :params => { :printer => { :id => nil }})
end

describe "resource(:printers)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:printers))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of printers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a printer exists" do
    before(:each) do
      @response = request(resource(:printers))
    end
    
    it "has a list of printers" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Printer.all.destroy!
      @response = request(resource(:printers), :method => "POST", 
        :params => { :printer => { :id => nil }})
    end
    
    it "redirects to resource(:printers)" do
      @response.should redirect_to(resource(Printer.first), :message => {:notice => "printer was successfully created"})
    end
    
  end
end

describe "resource(@printer)" do 
  describe "a successful DELETE", :given => "a printer exists" do
     before(:each) do
       @response = request(resource(Printer.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:printers))
     end

   end
end

describe "resource(:printers, :new)" do
  before(:each) do
    @response = request(resource(:printers, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@printer, :edit)", :given => "a printer exists" do
  before(:each) do
    @response = request(resource(Printer.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@printer)", :given => "a printer exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Printer.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @printer = Printer.first
      @response = request(resource(@printer), :method => "PUT", 
        :params => { :printer => {:id => @printer.id} })
    end
  
    it "redirect to the printer show action" do
      @response.should redirect_to(resource(@printer))
    end
  end
  
end


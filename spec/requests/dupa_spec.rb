require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/dupa" do
  before(:each) do
    @response = request("/dupa")
  end
end
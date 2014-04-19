require 'spec_helper'

describe PagesController, :type => :controller do
  describe "GET 'home'" do
    it "returns http success" do
      get 'show', :id => 'home'
      response.should be_success
    end
  end

  describe "flow/thanks after home" do
    it "should set vid1_response no" do
      get 'show', :id => 'home'
      request.env["HTTP_REFERER"] = "http://site.com/"
      get 'show', :id => 'flow/thanks'
      response.should be_success
      Visit.last.vid1_response.should == "no"
    end
  end

  describe "flow/thanks after start" do
    it "should set vid2_response no" do
      get 'show', :id => 'home'
      request.env["HTTP_REFERER"] = "http://site.com/"
      get 'show', :id => 'flow/start'
      request.env["HTTP_REFERER"] = "http://site.com/pages/flow/start"
      get 'show', :id => 'flow/thanks'
      response.should be_success
      Visit.last.vid1_response.should == "start"
      Visit.last.vid2_response.should == "no"
    end
  end

  describe "challenge flow" do
    it "should work" do
      get 'show', :id => 'home'
      request.env["HTTP_REFERER"] = "http://site.com/"
      get 'show', :id => 'flow/start'
      request.env["HTTP_REFERER"] = "http://site.com/pages/flow/start"
      get 'show', :id => 'flow/challenge'
      request.env["HTTP_REFERER"] = "http://site.com/pages/flow/challenge"
      response.should be_success
      Visit.last.vid1_response.should == "start"
      Visit.last.vid2_response.should == "yes"
    end
  end
end

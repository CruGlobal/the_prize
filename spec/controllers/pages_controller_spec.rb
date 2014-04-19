require 'spec_helper'

describe PagesController, :type => :controller do
  describe "GET 'home'" do
    it "returns http success" do
      get 'show', :id => 'home'
      response.should be_success
    end
  end

  describe "video 1 repsonse" do
    it "should work with 'no'" do
      get 'show', :id => 'home'
      request.env["HTTP_REFERER"] = "http://site.com/"
      get 'show', :id => 'flow/thanks'
      response.should be_success
      Visit.last.vid1_response.should == "no"
    end

    it "should work with 'I want to know more'" do
      get 'show', :id => 'home'
      request.env["HTTP_REFERER"] = "http://site.com/"
      get 'show', :id => 'flow/more'
      response.should be_success
      Visit.last.vid1_response.should == "more"
    end

    it "should work with 'I want to start'" do
      get 'show', :id => 'home'
      request.env["HTTP_REFERER"] = "http://site.com/"
      get 'show', :id => 'flow/start'
      response.should be_success
      Visit.last.vid1_response.should == "start"
    end

    it "should work with 'I'm already a Christian'" do
      get 'show', :id => 'home'
      request.env["HTTP_REFERER"] = "http://site.com/"
      get 'show', :id => 'flow/christian'
      response.should be_success
      Visit.last.vid1_response.should == "christian"
    end
  end

  describe "video 2 response" do
    it "should work with 'Yes'" do
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

    it "should work with 'Thanks'" do
      get 'show', :id => 'home'
      request.env["HTTP_REFERER"] = "http://site.com/"
      get 'show', :id => 'flow/start'
      request.env["HTTP_REFERER"] = "http://site.com/pages/flow/start"
      get 'show', :id => 'flow/thanks'
      response.should be_success
      Visit.last.vid1_response.should == "start"
      Visit.last.vid2_response.should == "no"
    end

    it "should work with 'Christian'" do
      get 'show', :id => 'home'
      request.env["HTTP_REFERER"] = "http://site.com/"
      get 'show', :id => 'flow/start'
      request.env["HTTP_REFERER"] = "http://site.com/pages/flow/start"
      get 'show', :id => 'flow/christian'

      response.should be_success
      Visit.last.vid1_response.should == "start"
      Visit.last.vid2_response.should == "christian"
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

# encoding: utf-8
require 'spec_helper'

describe TipsController do
  describe 'GET JS' do

    let!(:page1) { Page.create!( :url => 'http://4pcbr.com/') }
    let!(:tip1) { Tip.new(:body => '<div class="tip">hello world</div>', :point => { :l => 100, :t => 100 }, :size => { :w => 300, :h => 200 }) }
    let!(:tip2) { Tip.new(:body => '<div class="tip">ololo</div>', :point => { :l => 400, :t => 400 }, :size => { :w => 100, :h => 100 }) }

    before(:each) do
      page1.tips = [ tip1, tip2 ]
    end

    it 'должен отдавать JS-файл для страницы' do
      get :index, :format => :js, :url => page1.url
      response.should be_ok
    end
  end

  describe 'POST /tips.json' do
    let!(:page1) { Page.create!( :url => 'http://4pcbr.com/') }

    it 'должен сохранять новую всплывашку' do
      post :create, :format => :json, :page_id => page1._id, 
        :tip => { :body => '<div class="tip">hello world</div>', :point => { :l => 100, :t => 100 }, :size => { :w => 300, :h => 200 } }
      response.status.to_i.should eq 201
      Page.find(page1._id).tips.count.should eq 1
    end
  end
end

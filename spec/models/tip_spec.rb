# encoding: utf-8
require 'spec_helper'

describe Tip do

  describe 'привязка к странице' do

    let!(:page1) { Page.create!( :url => 'http://4pcbr.com/') }
    let!(:page2) { Page.create!( :url => 'http://dislike.4pcbr.com/') }
    let!(:tip1) { Tip.new(:body => '<div class="tip">hello world</div>', :point => { :l => 100, :t => 100 }, :size => { :l => 300, :t => 200 }) }
    let!(:tip2) { Tip.new(:body => '<div class="tip">ololo</div>', :point => { :l => 400, :t => 400 }, :size => { :l => 100, :t => 100 }) }

    it 'должен сохранять привязку всплывашек к странице' do
      page1.tips << tip1
      page1.tips << tip2
      page1.tips.count.should eq 2
    end

    it 'должен перемещать всплывашки от 1 страницы к другой' do
      
      page1.tips << tip1
      page1.tips << tip2
      page2.tips.count.should eq 0
      tip1.page = page2
      page2.tips << tip2
      page2.tips.count.should eq 2
      pending 'вот тут я хз, но похоже на баг: всплывашки могут принадлежать только одной странице' do
        page1.tips.count.should eq 0
      end
    end

  end

end

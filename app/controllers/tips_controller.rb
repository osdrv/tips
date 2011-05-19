class TipsController < InheritedResources::Base
  respond_to :json, :only => [ :update, :create, :destroy ]
  respond_to :js, :only => :index
  actions :all, :except => [ :new, :show, :edit ]
  belongs_to :pages, :optional => true

  def create
    page = Page.find(params[:page_id])
    page.tips << Tip.new(params[:tip])
    render :status => 201, :text => 'OK'
  end

protected

  def collection
    @tips = Tip.for_page(params[:url] || request.referer)
  end
end

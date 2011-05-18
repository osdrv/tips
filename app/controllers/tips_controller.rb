class TipsController < InheritedResources::Base
  respond_to :json, :only => [ :update, :create, :destroy ]
  respond_to :js, :only => :index
  actions :all, :except => [ :new, :show, :edit ]

protected

  def collection
    @tips = Tip.for_page(params[:url])
  end
end

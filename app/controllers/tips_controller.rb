class TipsController < InheritedResources::Base
  respond_to :json, :only => [ :update, :create, :destroy ]
  respond_to :js, :only => :index
  actions :all, :except => [ :new, :show, :edit ]

protected

  def collection
    referer = params[:url] || request.referer
    Rails.logger.debug(referer)
    @tips = Tip.for_page(referer)
  end
end

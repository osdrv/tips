class PagesController < InheritedResources::Base
  respond_to :html
  actions :all

  def update
    update! do |format|
      format.html { redirect_to edit_page_url(@page) }
    end
  end
end

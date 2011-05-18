class PagesController < InheritedResources::Base
  respond_to :html
  actions :all
end

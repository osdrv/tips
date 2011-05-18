class Tip
  include Mongoid::Document
  field :body, :type => String
  field :point, :type => Hash
  field :size, :type => Hash
  embedded_in :page

  class << self

    def for_page(url)
      p = Page.first(:conditions => { :url => url })
      return [] if p.nil?
      p.tips
    end

  end
end

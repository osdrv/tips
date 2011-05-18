class Page
  include Mongoid::Document
  field :url, :type => String
  embeds_many :tips
end

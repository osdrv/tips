class Tip
  include Mongoid::Document
  field :url, :type => String
  field :body, :type => String
  field :corners, :type => Array
end

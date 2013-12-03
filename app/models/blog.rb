class Blog < ActiveRecord::Base
  attr_accessible :contents, :title, :internal
end

class Coach < ActiveRecord::Base
  attr_accessible :bio, :name, :email, :picture_url
end

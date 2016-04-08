class Play < ActiveRecord::Base
  belongs_to :user, :category
end

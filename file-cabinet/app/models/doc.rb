class Doc < ActiveRecord::Base
  # all documents belong to user
  belongs_to :user
end

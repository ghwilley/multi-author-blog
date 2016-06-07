class Entry < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  # Remember to create a migration!
end

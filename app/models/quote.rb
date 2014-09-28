class Quote < ActiveRecord::Base
  belongs_to :author
  validates :content, presence: true
end

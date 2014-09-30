class Author < ActiveRecord::Base
  has_many :quotes

  def name
    first_name + ' ' + family_name
  end
end

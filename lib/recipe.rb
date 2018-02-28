class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  has_and_belongs_to_many(:tags)
  before_save(:titleize_name)

  def titleize_name
    self.name=(name().titleize())
  end
end

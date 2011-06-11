class Todo < ActiveRecord::Base
  validates :name, :description, :presence => true
  def self.allowed_attributes
    [:name, :description]
  end
end

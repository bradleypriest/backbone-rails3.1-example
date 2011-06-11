class Todo < ActiveRecord::Base
  def self.allowed_attributes
    [:name, :description]
  end
end

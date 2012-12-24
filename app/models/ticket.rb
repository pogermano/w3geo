class Ticket < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  attr_accessible :description, :title, :asset
  has_attached_file :asset


   validates :title, :presence => true
   validates :description, :presence => true
   validates :description, :presence => true,
             :length => { :minimum => 10 }

end

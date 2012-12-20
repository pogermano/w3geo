class Customer < ActiveRecord::Base
  has_many :tickets, :dependent => :delete_all
  attr_accessible :name
  validates :name, :presence => true, :uniqueness => true

  has_many :permissions, :as => :thing 

  def self.viewable_by(user)
    joins(:permissions).where(:permissions => { :action => "view", :user_id => user.id })
  end

end

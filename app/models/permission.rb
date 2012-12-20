class Permission < ActiveRecord::Base
  attr_accessible :user, :action, :thing

  belongs_to :thing, :polymorphic => true
  belongs_to :user

end

require 'pry'
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    return self.check_user if self.check_user != "Sorry."
    self.update_user
  end

  def check_user
    denied_message = "Sorry."
    denied_message += " You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets < self.attraction.tickets
    denied_message += " You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height
    denied_message
  end

  def update_user
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end
end

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if tall_enough? && enough_tickets?
      undergo_ride
      print_thanks
    else
      print_issues
    end
  end

  def undergo_ride
    update_tickets
    update_happiness
    update_nausea
    self.user.save
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height
  end

  def enough_tickets?
    self.user.tickets >= self.attraction.tickets
  end

  def update_tickets
    self.user.tickets -= self.attraction.tickets
  end

  def update_happiness
    self.user.happiness += self.attraction.happiness_rating
  end

  def update_nausea
    self.user.nausea += self.attraction.nausea_rating
  end

  def height_issue
    tall_enough? ? "" : " You are not tall enough to ride the #{attraction.name}."
  end

  def ticket_issue
    enough_tickets? ? "" : " You do not have enough tickets to ride the #{attraction.name}."
  end

  def print_issues
    "Sorry." + ticket_issue + height_issue
  end

  def print_thanks
    "Thanks for riding the #{attraction.name}!"
  end
end

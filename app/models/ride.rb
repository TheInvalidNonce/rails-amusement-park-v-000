class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  
  def take_ride
    # Find the user and attraction by the IDs
    @user = User.find_by_id(user.id)
    @attraction = Attraction.find_by_id(attraction.id)
    
    # Check the conditions by most specific first
    if @user.tickets <= @attraction.tickets && @user.height < @attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.height < @attraction.min_height
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets <= @attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    else
      # Update the var amounts by attribute
      @user.update(tickets: @user.tickets -= @attraction.tickets)
      @user.update(nausea: @user.nausea += @attraction.nausea_rating)
      @user.update(happiness: @user.happiness += @attraction.happiness_rating)
      "Thanks for riding the #{@attraction.name}!"
    end
  end
  
end

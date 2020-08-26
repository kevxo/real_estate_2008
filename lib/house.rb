require_relative 'room'

class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    return false if @price.to_i < 500000
    true
  end

  def rooms_from_category(category)
    room_array = []
    @rooms.each do |room|
      if category == room.category
        room_array << room
      end
    end
    room_array
  end

  def area
    total = []
    @rooms.each do |room|
      total << room.length * room.width.to_i
    end
    total.sum
  end

  def details
    house_details = {}
    house_details["price"] = @price
    house_details["address"] =  @address
    house_details
  end
end

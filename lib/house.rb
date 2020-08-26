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
    return false if @price.split("$")[1].to_i < 500000
    true
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      category == room.category
    end
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
    house_details["price"] = @price.split("$")[1].to_i
    house_details["address"] =  @address
    house_details
  end

  def price_per_square_foot
    (@price.split('$')[1].to_i / area.to_f).round(2)
  end

    def rooms_sorted_by_area
      @rooms.map.sort do |room|
        (room.length * room.width.to_i)
      end
    end

    def rooms_by_category
      category_rooms = {}
      @rooms.each do |room|
        if category_rooms[room.category]
          category_rooms[room.category].push(room)
        else
          category_rooms[room.category] = [room]
        end
      end
      category_rooms
    end
end

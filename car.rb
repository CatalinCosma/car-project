class Car
  attr_reader :speed, :manufacturer, :model, :id, :x, :y, :events, :received_messages

  def initialize(manufacturer, model, id, x, y)
    @manufacturer = manufacturer
    @model = model
    @id = id
    @x = x
    @y = y
    @speed = 0
    @events = []
    @received_messages = []
  end

  def set_speed(new_speed)
    @speed = new_speed
  end

  def update_location(new_x, new_y)
    @x = new_x
    @y = new_y
  end

  def add_event(description, kilometer)
    event = {
      description: description,
      kilometer: kilometer
    }

    @events << event
  end

  def send_information_to(other_car)
    information = {
      id: @id,
      manufacturer: @manufacturer,
      model: @model,
      speed: @speed,
      location: [@x, @y],
      events: @events
    }

    other_car.receive_information(information)
  end

  def receive_information(information)
    @received_messages << information
  end

  def distance_to(other_car)
    x_distance = other_car.x - @x
    y_distance = other_car.y - @y

    Math.sqrt(x_distance ** 2 + y_distance ** 2)
  end

  def closest_car(cars)
    cars.min_by do |car|
      distance_to(car)
    end
  end
end
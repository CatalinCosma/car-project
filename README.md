# Car Project

This is a simple Ruby project that simulates communication between autonomous cars.

## Features

- Store car information (manufacturer, model, ID)
- Set current speed
- Store current location (X, Y coordinates)
- Add road events
- Send information to another car
- Receive information from another car
- Calculate distance between cars
- Find the closest car

## Requirements

- Ruby 2.7 or higher

## How to run

Create a file (for example `main.rb`) in the same folder as `car.rb` with the following content:

require_relative "car"

car2 = Car.new("BMW", "X5", "CAR-2", 10, 5)
car3 = Car.new("Dacia", "Logan", "CAR-3", 3, 4)

car1.set_speed(80)
car2.set_speed(90)

car1.add_event("Road work ahead", 20)
car1.add_event("Accident on the right lane", 45)

car1.send_information_to(car2)

then run ruby main.rb
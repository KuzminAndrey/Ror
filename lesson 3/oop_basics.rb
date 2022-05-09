class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def get(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.select do | train |
      train.type == type
    end
  end

  def send(train)
    @trains.delete(train)
  end
end


class Route
  attr_reader :list_of_stations

  def initialize(first, last)
    @list_of_stations = [first, last]
  end

  def add(station)
    @list_of_stations.insert(-2, station)
  end

  def delete(station)
    @list_of_stations.delete(station)
  end

  def first
    @list_of_stations.first
  end

  def last
    @list_of_stations.last
  end
end

class Train
  attr_reader :number, :type, :number_of_wagons, :route, :current_station
  attr_accessor :speed

  def initialize(type, number_of_wagons = 0)
    @number = rand(1..999)
    @type = type if type == 'cargo' || type == 'passenger'
    @number_of_wagons = number_of_wagons
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    @number_of_wagons += 1 if @speed == 0
  end

  def remove_wagon
    @number_of_wagons -= 1 if @speed == 0
  end

  def set_route(route)
    @route = route
    @current_station = route.first
    @current_station.get(self)
  end

  def move_forward
    if @current_station != route.last
      @current_station.send(self)
      @current_station = next_station
      @current_station.get(self)
    end
  end

  def move_back
    if @current_station != route.first
      @current_station.send(self)
      @current_station = previous_station
      @current_station.get(self)
    end
  end

  def next_station
    if route.last != @current_station
      index = route.list_of_stations.index(@current_station) + 1
      route.list_of_stations[index]
    end
  end

  def previous_station
    if route.first != @current_station
      index = route.list_of_stations.index(@current_station) - 1
      route.list_of_stations[index]
    end
  end
end

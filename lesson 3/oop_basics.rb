class Station
  attr_reader :trains_on_station, :name

  def initialize(name)
    @name = name
    @trains_on_station = []
  end

  def get(train)
    @trains_on_station << train
  end

  def trains_on_station_by_type(type)
    puts "Список поездов по типу #{type}:"
    @trains_on_station.each do | train |
      puts train if train.type == type
    end
  end

  def send(train)
    @trains_on_station.delete(train)
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
    @current_station = route.list_of_stations[0]
    @current_station.get(self)
  end

  def move_forward
    @current_station = next_station
    @current_station.get(self)
  end

  def move_back
    @current_station = previous_station
    @current_station.get(self)
  end

  def next_station
    i = route.list_of_stations.index(@current_station) + 1
    route.list_of_stations[i]
  end

  def previous_station
    i = route.list_of_stations.index(@current_station) - 1
    route.list_of_stations[i]
  end

end

class GasTank
  attr_accessor :level, :observers

  def initialize
    @level = "not empty"
    @observers = []
  end

  def develop_leak
    @level = "empty"
    notify_observers
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_observers
    observers.each do |observer|
      observer.update(self)
    end
  end
end


class Driver
  def update(gastank)
    if gastank.level == "empty"
      puts "Time to get gas.  The tank is #{gastank.level}."
    else 
      puts "The tank is #{gastank.level}.  Let's see how far we can go without refilling!"
    end
  end
end
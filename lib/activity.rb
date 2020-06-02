class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.reduce(0) do |acc, (name, cost)|
      acc += cost
    end
  end

  def split
    total_cost / @participants.count
  end

  def owed
    owed = Hash.new
    @participants.each do |name, cost|
      owed[name] = split - cost
    end
    owed
  end
end

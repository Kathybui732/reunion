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
    @participants.reduce({}) do |owed, (name, cost)|
      owed[name] = split - cost
      owed
    end
  end
end

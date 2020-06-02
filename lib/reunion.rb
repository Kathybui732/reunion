class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.reduce(0) do |cost, activity|
      cost += activity.total_cost
      cost
    end
  end

  def breakout
    # breakout = Hash.new { |breakout, name| breakout[name] = [] }
    # @activities.each do |activity|
    #   activity.owed.each do |participant, owed|
    #     breakout[participant] << owed
    #   end
    # end
    # breakout.each do |participant, owed_array|
    #   breakout[participant] = owed_array.sum
    # end
    # breakout

    breakout = Hash.new { |breakout, name| breakout[name] = 0 }
    @activities.each do |activity|
      activity.owed.each do |participant, owed|
        breakout[participant] += owed
      end
    end
    # breakout.each do |participant, owed_array|
    #   breakout[participant] = owed_array.sum
    # end
    breakout
  end

  def summary
    breakout.reduce("") do |acc, (participant, owed)|
      acc.concat("#{participant}: #{owed}\n")
      acc
    end.chomp
    #
    # s = ""
    # breakout.each do |tab|
    #   s += "#{tab[0]}: #{tab[1]}\n"
    # end
    # s.chomp
  end

  def detailed_breakout
    breakout = Hash.new { |hash, key| hash[key] = [] }
    @activities.each do |activity|
      hash = Hash.new { |hash, key| hash[key] = [] }
      activity.owed.each do |participant, owed|
        hash[:activity] = activity.name
        hash[:payees] = [activity.participants.keys.delete(participant)]
        hash[:amount] = owed
      end
      activity.participants.each do |participant|
        breakout[participant[0]] << hash
      end
    end
    breakout
  end
end

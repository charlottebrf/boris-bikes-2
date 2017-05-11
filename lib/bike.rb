class Bike
  attr_reader :status

  def initialize
    @status = "working"
  end

  def working?
    @status == "working"
  end

  def report_broken
    @status = "broken"
    self
  end
end

class Bike
  @status = "working"

  def working?
    true
  end

  def report_broken
    @status = "broken"
  end
end

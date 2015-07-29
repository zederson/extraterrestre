class HouseToogleServices

  START = 'Begin'
  OUT = 'Exit'

  def self.toogle
    name = next_status! ? START : OUT
    Trigger.execute name
  end

  def self.next_status!
    @@on ||= false
    @@on = !@@on
  end
end

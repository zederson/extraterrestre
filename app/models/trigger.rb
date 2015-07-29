class Trigger < ActiveRecord::Base
  validates :name, presence: true

  def self.execute(trigger_name)
    activities = search_activities trigger_name

    activities.each do |activity|
      exec = Home::Executor.build(activity)
      exec.execute
    end
  end

  def self.search_activities(trigger_name)
    params = { 'triggers.name' => trigger_name }
    Activity.joins(:trigger).where(params)
  end
end

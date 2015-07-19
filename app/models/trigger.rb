class Trigger < ActiveRecord::Base
  validates :name, presence: true

  def self.execute(trigger_name)
    params = { 'triggers.name' => trigger_name }
    activities = Activity.joins(:trigger).where(params)

    activities.each do |activity|
      exec = Home::Executor.build(activity)
      exec.execute
    end
  end
end

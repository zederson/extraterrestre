module SelectOptionsHelper

  def triggers_for_select
    Trigger.all.order(:name)
  end

  def configurations_for_select
    DeviceConfiguration.all.order(:name)
  end
end

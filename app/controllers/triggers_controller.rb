class TriggersController < ApplicationController
  before_action :set_trigger, only: [:show, :edit, :update, :destroy]

  def index
    @triggers = Trigger.all
  end

  def show
  end

  def new
    @trigger = Trigger.new
  end

  def edit
  end

  def create
    @trigger = Trigger.new(trigger_params)

    if @trigger.save
      redirect_to @trigger, notice: 'Trigger was successfully created.'
    else
      render :new
    end
  end

  def update
    if @trigger.update(trigger_params)
      redirect_to @trigger, notice: 'Trigger was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trigger.destroy
    redirect_to triggers_url, notice: 'Trigger was successfully destroyed.'
  end

  private

  def set_trigger
    @trigger = Trigger.find(params[:id])
  end

  def trigger_params
    params.require(:trigger).permit(:name, :description)
  end
end

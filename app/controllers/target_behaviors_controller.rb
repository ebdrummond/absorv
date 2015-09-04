class TargetBehaviorsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def new; end

  def create
    if @target_behavior.save
      redirect_to target_behaviors_path,
        notice: text("create_success", behavior_name: @target_behavior.name)
    else
      render :new, alert: text("create_failure")
    end
  end

  private

  def target_behavior_params
    params.require(:target_behavior).permit(:name, :positive, :goal, :notes)
  end
end

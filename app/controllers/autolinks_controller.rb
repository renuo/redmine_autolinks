# frozen_string_literal: true

class AutolinksController < ApplicationController
  before_action :authorize_global
  before_action :set_project
  before_action :set_autolink, only: %i[edit update destroy]

  def new
    @autolink = @project.autolinks.new
  end

  def edit; end

  def create
    @autolink = @project.autolinks.new(autolink_params)

    if @autolink.save
      redirect_to_settings
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @autolink.update(autolink_params)
      redirect_to_settings
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @autolink.destroy!
    redirect_to_settings
  end

  private

  def redirect_to_settings
    redirect_to settings_project_path(@project, tab: :autolinks)
  end

  def set_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def set_autolink
    @autolink = @project.autolinks.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def autolink_params
    params.require(:autolink).permit(:prefix, :target_url)
  end
end

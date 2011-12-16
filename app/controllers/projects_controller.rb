class ProjectsController < ApplicationController

  before_filter :validate_category!
  before_filter :load_categories

  def index
    @projects = Project.where(category: params[:work_category_id]).ordered.all
    expires_in 3.hours, 'max-stale' => 5.hours, :public => true if Rails.env.production?
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def validate_category!
    raise ActiveRecord::RecordNotFound unless WorkCategory.names.include?(params[:work_category_id])
  end

  def load_categories
    @categories = WorkCategory.all
    @active = params[:work_category_id]
  end

end

class AjaxController < ApplicationController

  before_filter :receive_parameters

  def select_section
      @course= Course.find @target_id
      @course_sections = @course.course_sections
  end

  def select_course
    @batch = Batch.find @target_id
    @courses = @batch.courses
  end

  private

  def receive_parameters
    @target_id = params[:target_id]
    @target_dom  = params[:target_dom]
    @target_input_field = params[:target_input_field]
  end
end

class HomepageController < ApplicationController

  skip_before_filter :authenticate_user!

  layout 'homepage'
  def index

  end

  def tag
    if params[:tag].size > 0
      c = Card.where(tag: params[:tag]).first_or_create!
      if c and c.student
       att =  c.student.current_attendance
        if att.new_record?
          att.active = true
          att.save!
        end
      end
    end
  end




end

# == Schema Information
#
# Table name: attendances
#
#  id                :integer          not null, primary key
#  school_id         :integer
#  student_id        :integer
#  active            :boolean
#  notes             :string(255)
#  course_id         :integer
#  course_section_id :integer
#  batch_id          :integer
#  attended          :boolean
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_attendances_on_batch_id           (batch_id)
#  index_attendances_on_course_id          (course_id)
#  index_attendances_on_course_section_id  (course_section_id)
#  index_attendances_on_school_id          (school_id)
#

class Attendance < ActiveRecord::Base
end

# == Schema Information
#
# Table name: collection_schedules
#
#  id                 :integer          not null, primary key
#  fee_category_id    :string(255)
#  name               :string(255)
#  starting_time      :string(255)      default("2014-12-26"), not null
#  ending_time        :string(255)
#  school_id          :integer
#  create_due_invoice :boolean          default(TRUE)
#  due_date           :date
#  created_at         :datetime
#  updated_at         :datetime
#  active             :boolean          default(TRUE)
#  payment_period     :integer          default(0)
#
# Indexes
#
#  index_collection_schedules_on_fee_category_id  (fee_category_id)
#  index_collection_schedules_on_school_id        (school_id)
#

#  starting_time      :string(255)      default("2014-08-28"), not null

#  starting_time      :string(255)      default("2014-08-06"), not null

#  ending_time        :string(255)
#  school_id          :integer
#  create_due_invoice :boolean          default(TRUE)
#  due_date           :date
#  created_at         :datetime
#  updated_at         :datetime
#  active             :boolean          default(TRUE)
#  payment_period     :integer          default(0)
#
# Indexes
#
#  index_collection_schedules_on_fee_category_id  (fee_category_id)
#  index_collection_schedules_on_school_id        (school_id)
#

class CollectionSchedule < ActiveRecord::Base

  paginates_per 10


  require "recurrence"

  belongs_to :school
  belongs_to :fee_category
  has_many :students, through: :fee_category

  validates :fee_category_id, :uniqueness => {scope: :school_id}
  validates :starting_time, :presence => true
  validates :school_id, :presence => true
  validates :name, :presence => true
  validates :payment_period, :presence => true

  acts_as_tenant(:school)

  ONE_TIME = 0
  DAILY = 1
  WEEKLY = 2
  MONTHLY = 3
  YEARLY = 4


  PERIODS = {
      one_time: ONE_TIME,
      daily: DAILY,
      weekly: WEEKLY,
      monthly: MONTHLY,
      yearly: YEARLY
  }

  def period
    PERIODS.invert.fetch(self.payment_period.to_i).to_s.try(:humanize)
  end

  def current_ending_date
    ending_time.nil? ? Date.today : Chronic.parse(self.ending_time).to_date
  end

  def current_starting_date
    starting_time.nil? ? Date.today : Chronic.parse(starting_time).to_date
  end

  def localized_current_starting_date
      current_starting_date.try(:strftime)
  end

  def localized_current_ending_date
      current_ending_date.try(:strftime)
  end

  def event_day
      current_starting_date.day
  end


  def events
    @events = []
    case payment_period
      when ONE_TIME
       @events = Recurrence.new(:every => :month, :on => event_day, :repeat => 1)
      when DAILY
        @events = Recurrence.new(:every => :day, on: event_day ,:starts => current_starting_date, until: current_ending_date)
      when WEEKLY
        @events = Recurrence.new(:every => :week, on: event_day ,:starts => current_starting_date, until: current_ending_date)
      when MONTHLY
        @events = Recurrence.new(:every => :month, on: event_day ,:starts => current_starting_date, until: current_ending_date)
      when YEARLY
        @events =  Recurrence.new(:every => :year, on: event_day ,:starts => current_starting_date, until: current_ending_date)
      else
        @events = []
    end
    @events
  end


end

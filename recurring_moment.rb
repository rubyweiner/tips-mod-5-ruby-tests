require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start
    counter = 0

    while current < date
      if @period == 'monthly'
        current = @start.advance(months: @interval * counter)
        counter+=1
        puts counter
      elsif @period == 'weekly'
        current = current.advance(weeks: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end
    end

    if current == date
      return true
    else
      return false
    end

  end
end

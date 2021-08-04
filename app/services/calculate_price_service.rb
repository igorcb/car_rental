# frozen_string_literal: true

class CalculatePriceService
  def initialize(price, date_start, date_end)
    @price = price
    @date_start = date_start
    @date_end = date_end
  end

  def call
    return { success: false, message: 'Price is not present' } if @price.nil?
    return { success: false, message: 'Date start is not present' } if @date_start.nil?
    return { success: false, message: 'Date end is not present' } if @date_end.nil?

    @price * (@date_end - @date_start).to_i
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe CalculatePriceService do
  context 'when #call' do
    it 'is not price present' do
      result = CalculatePriceService.new(nil, Date.current, Date.current + 1.days).call
      expect(result[:success]).to be_falsey
      expect(result[:message]).to match('Price is not present')
    end

    it 'is not date start present' do
      result = CalculatePriceService.new(80, nil, Date.current + 1.days).call
      expect(result[:success]).to be_falsey
      expect(result[:message]).to match('Date start is not present')
    end

    it 'is not date start present' do
      result = CalculatePriceService.new(80, Date.current, nil).call
      expect(result[:success]).to be_falsey
      expect(result[:message]).to match('Date end is not present')
    end

    it 'sets 1 days' do
      price = 80
      price_total = CalculatePriceService.new(price, Date.current, Date.current + 1.days).call
      expect(price_total).to eq price
    end

    it 'sets 2 days' do
      price = 80
      price_total = CalculatePriceService.new(price, Date.current, Date.current + 2.days).call
      expect(price_total).to eq(price * 2)
    end
  end
end

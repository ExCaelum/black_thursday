require 'csv'
require_relative 'merchant'

class MerchantRepository
  attr_accessor :merchants

  def initialize(merchants_data)
    @merchants = merchants_data.map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def all
    @merchants
  end

  def find_by_id(id)
    @merchants.find do |merchant|
      merchant.id == id
    end
  end

  def find_by_name(name)
    @merchants.find do |merchant|
      merchant.name.downcase == name.downcase
    end
  end

  def find_all_by_name(name)
    names = @merchants.select do |merchant|
      merchant.name.downcase.include?(name.downcase)
    end
    names
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

end

require_relative 'test_helper'

class MerchantIntegrationTest < Minitest::Test

  def test_id
    merchant = @engine.merchants.all.first
    assert_equal 12334105, merchant.id
  end

  def test_it_can_find_name
    merchant = @engine.merchants.all.first
    assert_equal "Shopin1901", merchant.name
  end

  def test_it_can_find_creation_date
    merchant = @engine.merchants.all.first
    assert_equal Time, merchant.created_at.class
  end

  def test_it_can_find_date_updated
    merchant = @engine.merchants.all.first
    assert_equal Time, merchant.updated_at.class
  end

  def test_it_can_list_items_for_the_merchant
    merchant = @engine.merchants.all.first
    assert_equal "Shopin1901", merchant.name
    item_array = merchant.items
    items = item_array.map {|item| item.id}
    assert_equal [263396209, 263500440, 263501394], items
  end

  def test_it_can_list_the_merchants_invoices
    merchant = @engine.merchants.all.last
    assert_equal 'GoldenRayPress', merchant.name
    invoice_array = merchant.invoices
    invoices = invoice_array.map {|invoice| invoice.id}
    assert_equal [1514,1691], invoices
  end

  def test_it_can_get_its_customers
    merchant = @engine.merchants.all.first
    customers = merchant.customers

    assert_equal Customer, customers[0].class
  end
end

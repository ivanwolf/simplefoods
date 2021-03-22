require 'rails_helper'

RSpec.describe WorkdayProductsTable, type: :model do
  before :all do
    @store = create(:store)
    ActsAsTenant.current_tenant = @store
  end

  describe '.rows' do
    before(:each) do
      @workday = create(:workday)

      @product_one = create(:product, price: 1000)
      @wd_product_one = create(:workday_product, workday: @workday, product: @product_one)
      create(:order_product, workday_product: @wd_product_one, quantity: 20)
      
      @wd_product_two = create(:workday_product, workday: @workday)

      @product_three = create(:product, price: 1500)
      @wd_product_three = create(:workday_product, workday: @workday, product: @product_three)
      create(:order_product, workday_product: @wd_product_three, quantity: 10)


      @other_workday = create(:workday)
      @other_product = create(:workday_product, workday: @other_workday)
    end

    it 'create the correct table rows' do
      
      @table = WorkdayProductsTable.new @workday.id
      
      expect(@table.rows.first).to contain_exactly(@wd_product_one, 20, 20000)
      expect(@table.rows.second).to contain_exactly(@wd_product_three, 10, 15000)
      expect(@table.rows.last).to contain_exactly(@wd_product_two, 0, 0)
    end
  end
end
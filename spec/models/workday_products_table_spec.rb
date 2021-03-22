require 'rails_helper'

RSpec.describe WorkdayProductsTable, type: :model do
  before :all do
    @store = create(:store)
    ActsAsTenant.current_tenant = @store
  end

  describe '.rows' do
    before(:each) do
      @workday = create(:workday)

      @wd_product_one = create(:workday_product, workday: @workday)
      create(:order_product, workday_product: @wd_product_one, quantity: 20)
      
      @wd_product_two = create(:workday_product, workday: @workday)

      @wd_product_three = create(:workday_product, workday: @workday)
      create(:order_product, workday_product: @wd_product_three, quantity: 10)


      @other_workday = create(:workday)
      @other_product = create(:workday_product, workday: @other_workday)
    end

    it 'shows correct workday_products, even if there is no orders' do
      
      @table = WorkdayProductsTable.new @workday.id
      
      expect(@table.rows.first).to contain_exactly(@wd_product_one, 20)
      expect(@table.rows.second).to contain_exactly(@wd_product_three, 10)
      expect(@table.rows.last).to contain_exactly(@wd_product_two, 0)
    end
  end
end
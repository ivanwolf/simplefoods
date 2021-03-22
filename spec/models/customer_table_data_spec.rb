require 'rails_helper'

RSpec.describe "CustomersTable", type: :model do
  before :all do
    @store = create(:store)
    ActsAsTenant.current_tenant = @store
  end

  describe '.rows' do
    before(:each) do
      @bob = create(:customer)
      create(:order, customer: @bob)

      create(:order, customer: @bob)

      @alice = create(:customer)
      create(:order, customer: @alice)

      @matt = create(:customer)
    end

    it 'shows customers even with zero orders' do
      @table = CustomersTable.new(1)

      expect(@table.rows.first).to contain_exactly(@bob, 2)
      expect(@table.rows.second).to contain_exactly(@alice, 1)
      expect(@table.rows.last).to contain_exactly(@matt, 0)
    end
  end
end
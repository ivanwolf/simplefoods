class WorkdaysController < ApplicationController
  def index
    @workdays = Workday.all
  end

  private

  def product_params
    params.require(:product).permit(
    %i[name price]
    )
  end
end
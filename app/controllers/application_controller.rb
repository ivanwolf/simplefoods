class ApplicationController < ActionController::Base
  set_current_tenant_through_filter

  before_action :find_current_tenant

  def find_current_tenant
    if user_signed_in?
      set_current_tenant(current_user.store)
    end
  end
end

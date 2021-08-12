class ApplicationController < ActionController::Base
  include SEOHelper

  set_current_tenant_through_filter
  before_action :find_current_tenant
  helper_method :current_store

  def current_store
    ActsAsTenant.current_tenant
  end

  private


  def find_current_tenant
    set_current_tenant(Store.first)
  end
end

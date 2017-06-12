class DashboardsController < ApplicationController
  before_action :authorize_admin

  def index
    @transactions_dispatched = Transaction.where(dispatched: true)
    @transactions_not_dispatched = Transaction.where(dispatched: false)
  end
end

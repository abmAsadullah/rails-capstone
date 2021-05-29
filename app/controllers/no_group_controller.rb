class NoGroupController < ApplicationController
  def index
    @no_group_transactions = Transaction.all
  end
end

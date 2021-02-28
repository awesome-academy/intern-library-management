class Admin::BorrowingsController < Admin::BaseController
  before_action :find_borrowing, only: %i(update destroy)

  def index
    @search = Borrowing.ransack params[:q], auth_object: set_ransack_auth_object
    @borrowings_result = @search.result.order_borrowing.page(params[:page]).per(
      Settings.panigate.borrowing
    )
  end

  def update
    if @borrowing.pending?
      BorrowingWorker.set(wait: Settings.sidekiq.time.minutes)
                     .perform_async @borrowing
      @borrowing.accept!
    else
      @borrowing.payed!
    end
    respond_to :js
  end

  def destroy
    @success = @borrowing.cancel!
    CancelBorrowingWorker.set(wait: Settings.sidekiq.time.minutes)
                         .perform_async @borrowing
    respond_to :js
  end

  private

  def find_borrowing
    @borrowing = Borrowing.find params[:id]
  end
end

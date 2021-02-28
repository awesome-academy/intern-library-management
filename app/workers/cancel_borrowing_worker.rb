class CancelBorrowingWorker
  include Sidekiq::Worker

  def perform borrowing
    BorrowingMailer.cancel_borrowing(borrowing).deliver_later
  end
end

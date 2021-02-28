class BorrowingWorker
  include Sidekiq::Worker

  def perform borrowing
    borrowing.accept_borrowing
  end
end

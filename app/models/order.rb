class Order < ApplicationRecord

  belongs_to :user
  has_many :order_details
  accepts_nested_attributes_for :order_details

  after_initialize :order_info_set

  enum payment: {cash_on_delivery: 0, bank_transfer: 1, credit_payment: 2}

  validate :payment_stat_check
  validates :payment_stat, presence: true

  private
  def order_info_set
    # 注文番号採番ルール
    self.number = "ODnt#{Time.now.year}#{Time.now.month}#{Time.now.day}00001"
    # 注文日セット
    self.occured_at = Date.today
  end

  def payment_stat_check
    # 支払方法をチェックする（paymentをcase文によって、代金引換、銀行振込、クレジットカード払いの処理を呼び出す）
    self.payment = true
  end
end

class Signup < ActiveRecord::Base
  attr_accessible :country, :email, :ip, :phone, :contacted_at
  validates :ip, :country, presence: true
  validates :email, :email => true
  validates :email, uniqueness: true

  scope :today, lambda {where(created_at: Time.zone.now.midnight..Time.zone.now)}
  scope :yesterday, lambda {where(created_at: (Time.zone.now.midnight - 1.day)..Time.zone.now.midnight)}

  before_create :set_contacted

  def set_contacted
    self.contacted = nil
    # Fix to prevent rollback due to false return in previous statement.
    true
  end

  def toggle_contacted
    if contacted_at
      self.contacted_at = nil
    else
      self.contacted_at = Time.zone.now
    end
  end

end

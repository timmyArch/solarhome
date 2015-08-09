class Consumer < ActiveRecord::Base

  include Timmy::Helpers::Enableable
  include Timmy::Helpers::Activatable

  belongs_to :actor
  validates_associated :actor

  validates :power, presence: true, numericality: true
  validates :switch_interval, presence: true, numericality: true
  validates :active, presence: true
  validates :enabled, presence: true
  validates :address, presence: true, 
    format: { with: /\A[01]{5}[-_\s\/][1-5]\z/,
              message: "Channel (0 or 1) five times. +"+
              " Delimiter (-) + Unit Code ( 1 to 5 )" }
  
  validates :name, presence: true
  validates :switch_interval, presence: true

end

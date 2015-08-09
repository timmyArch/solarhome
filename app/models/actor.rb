require 'timeout'

class Actor < ActiveRecord::Base

  include Timmy::Helpers::Activatable

  has_paper_trail

  has_many :consumers

  belongs_to :user
  validates_associated :user
  
  validates :location, presence: true

  validate :ip_validator
  validate :dup_location_validator
  validate :dup_address_validator

  ##
  # TODO:
  #
  # It is not usable on remote site.
  #
  def reachable?
    Timeout::timeout(0.2){ system("ping -c 1 #{self.address[/[^:]+/]}") }
  rescue Timeout::Error
    false
  end

  ##
  # TODO:
  #
  # Handle this by APIClient Gem
  #
  def trigger code: nil, unit: nil, action: nil 
    a = '/send/%s/unit/%s/action/%s' % [code, unit, action]
    host = self.address[/[^:]+/]
    port = self.address[/[^:]+$/].to_i
    resp = Net::HTTP.get host, a, port
    JSON.parse resp
  end 

  private 

  ##
  # Generate validater methods, which validates
  # that dependend on user there are uniq location and addresses
  # persistend. Use row exclusive locking to prevent parallel application
  # fails.
  #
  # @!method dup_address_validator
  #   @return [void]
  #
  # @!method dup_location_validator
  #   @return [void]
  #
  %w{location address}.each do |m|
    define_method "dup_#{m}_validator" do
      a = self.class.where(:user_id => self.user_id, m.to_sym => send(m)).lock(true).first
      errors.add("duplicate_#{m}", send(m).to_s) if a and a != self
    end
  end

  ##
  # Validtate AF independent if ip is type of inet.
  # 
  # @return [void]
  #
  def ip_validator
    IPAddr.new(self.address.to_s)
  rescue IPAddr::InvalidAddressError
    errors.add :invalid_address, self.address.to_s
  end

end

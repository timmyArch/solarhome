class Measurement < ActiveRecord::Base

  validates :mtype, inclusion: { in: %w(consumed produced),
                                message: "%{value} is not a mesurement type" },
                   presence: true

  validates :value, numericality: true, presence: true

  belongs_to :user

  ##
  # Get surplus against last received value.
  #
  # @return [Fixnum]
  #
  def surplus
    a = self.class.where(mtype: opposite).
      where('created_at <= ?', self.created_at).
      order(created_at: :desc).
      limit(1).first.try(:value).to_i
    consumed? ? a-self.value : self.value-a
  end

  ##
  # Cusumed measurement? 
  #
  # @return [TrueClass, FalseClass]
  #
  def consumed?
    self.mtype == 'consumed'
  end

  ##
  # Produced measurement? 
  #
  # @return [TrueClass, FalseClass]
  #
  def produced?
    not consumed?
  end

  private

  ##
  # Get the opposite of current measurement type.
  #
  # @return ['produced', 'consumed']
  #
  def opposite
    consumed? ? self.mtype : 'produced'
  end

end

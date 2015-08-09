require 'test_helper'

class MeasurementTest < ActiveSupport::TestCase

  test 'that measurement needs a valid type' do
    a = Measurement
    refute a.new(mtype: 'moo', value: 1).valid?
    refute a.new(value: 1).valid?
    assert a.new(mtype: 'produced', value: 1).valid?
    assert a.new(mtype: 'consumed', value: 1).valid?
  end
  
  test 'that measurement needs a valid value' do
    a = Measurement
    assert a.new(mtype: 'produced', value: 0.1).valid?
    refute a.new(mtype: 'produced', value: 'A').valid?
  end

end

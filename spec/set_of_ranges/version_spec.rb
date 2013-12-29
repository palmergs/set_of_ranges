require 'spec_helper'

describe SetOfRanges::VERSION do
  it 'is in semantic format' do
    SetOfRanges::VERSION.should =~ /\d+[.]\d+[.]\d+([.-]\w+)?/
  end
end

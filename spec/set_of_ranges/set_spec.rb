require 'spec_helper'

describe SetOfRanges::Set do

  before(:each) do 

    @r = SetOfRanges::Set.new
    @r << (10..12)

  end

  it 'raises an error unless a range is added' do
    expect { @r << nil }.to raise_error(ArgumentError)
    expect { @r << "test" }.to raise_error(ArgumentError)
  end

  it 'ignores ranges within existing ranges' do
    @r << (10..11)
    @r.count.should == 1
    @r.should include(10..12)

    @r << (11..12)
    @r.count.should == 1
    @r.should include(10..12)

    @r << (10..12)
    @r.count.should == 1
    @r.should include(10..12)
  end

  it 'adds disjoint ranges' do
    @r << (1..8)
    @r << (14..15)
    @r.count.should == 3
    @r.should include (1..8)
    @r.should include (14..15)
    @r.should include (10..12)
  end

  it 'adds overlapping ranges' do

    @r << (9..13)
    @r.count.should == 1
    @r.should include (9..13)

  end

  it 'adds overlapping ranges on beginning' do
    @r << (9..11)
    @r.count.should == 1
    @r.should include (9..12)
  end

  it 'adds overlapping ranges on the end' do
    @r << (11..13)
    @r.count.should == 1
    @r.should include (10..13)
  end

  it 'converts open ranges to closed ranges' do
    @r << (1...5)
    @r.count.should == 2
    @r.should include (1..4)
  end

  it 'merges multiple ranges if overlapping' do
    @r << (14..18)
    @r << (1..3)
    @r.count.should == 3
    @r << (3..14)
    @r.count.should == 1
    @r.should include (1..18)
  end

  it 'merges adjacent ranges' do
    @r << (8..9)
    @r.count.should == 1
    @r << (13..14)
    @r.count.should == 1
    @r.should include (8..14)
  end

  it 'merges sets' do
    r2 = SetOfRanges::Set.new
    r2 << (1..10)
    r2 << (20..30)
    @r.merge(r2)
    @r.count.should == 2
    @r.should include (1..12)
    @r.should include (20..30)
    r2.count.should == 2
    r2.should include (1..10)
  end

  it 'replaces sets' do
    r2 = SetOfRanges::Set.new
    r2 << (20..30)
    @r.replace(r2)
    @r.count.should == 1
    @r.should include (20..30)
  end
end


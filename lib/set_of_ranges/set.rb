require 'set'

class SetOfRanges::Set < Set

  def add(obj)
    raise ArgumentError if obj.nil?
    raise ArgumentError unless obj.is_a? Range
    rng = obj.exclude_end? ? (obj.begin..(obj.end-1)) : obj

    if empty?
      super(rng)
    else

      overlapping_ranges = Set.new
      each do |r|
        if r.begin <= rng.begin and r.end >= rng.end

          # new range is completely contained within an 
          # existing range don't need to modify anything
          return self
        elsif (rng.begin < r.begin and rng.end >= r.begin - 1) or
            (rng.end > r.end and rng.begin <= r.end + 1)
          overlapping_ranges << r
        end
      end

      if overlapping_ranges.size == 0

        super(rng)

      else

        subtract(overlapping_ranges)
        overlapping_ranges << rng
        min = overlapping_ranges.map(&:begin).min
        max = overlapping_ranges.map(&:end).max
        super(min..max)
      end
    end

    self
  end

  def << obj
    add(obj)
  end

  def merge enum
    enum.each do |e|
      add(e)
    end
    self
  end

  def replace enum
    clear
    merge(enum)
  end
end

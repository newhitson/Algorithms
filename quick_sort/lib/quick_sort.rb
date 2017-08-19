class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array[0]
    left = []
    right = []

    array.each do |num|
      if num > pivot
        right << num
      else
        left << num
      end
    end

    sorted_left = QuickSort.sort1(left)
    sorted_right = QuickSort.sort1(right)

    sorted_left + [pivot] + sorted_right

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    barrier = start
    pivot_idx = start
    pivot = array[pivot_idx]
    i = start




  end
end

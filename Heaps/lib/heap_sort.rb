require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new {|a, b| -1 * (a <=> b) }
    pointer = 0
      until pointer == self.length - 1
        pointer += 1
        BinaryMinHeap.heapify_up(self, pointer, 0, &prc)
      end
      p self

      until pointer == 0

        self[0], self[pointer] = self[pointer], self[0]
        p self
        BinaryMinHeap.heapify_down(self, 0, pointer, &prc)
        p self
        p "exec"
        pointer -= 1

      end

  end
end

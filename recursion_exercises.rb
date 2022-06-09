def range(min, max)
    return [] if min == max
    [min] + range(min + 1, max)
end

# p range(1, 5)

def iter_sum(arr)
    sum = 0
    arr.each { |i| sum += i }
    sum
end

# p iter_sum([1, 2, 3, 4])

def rec_sum(arr)
    return arr[0] if arr.length == 1
    arr[0] + rec_sum(arr.drop(1))
end

# p rec_sum([1, 2, 3, 4])

def exp1(b, n)
    return 1 if n == 0
    b * exp1(b, n - 1)
end

# p exp1(2, 3)

def exp2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        exp2(b, n/2) ** 2
    else
        b * (exp2(b, (n - 1) / 2) ** 2)
    end
end

# p exp2(2, 3)
# p exp2(3, 3)

class Array
    def deep_dup
        self.map do |el|
            if el.is_a?(Array)
                el.deep_dup
            else
                el
            end
        end
    end

    def merge_sort
        return self if self.length <= 1
        merge((self.take(self.length / 2)).merge_sort, (self.drop(self.length / 2)).merge_sort)
    end
    
    def merge(left, right)
        left_index, right_index = 0, 0
        new_arr = []
        while left_index < left.length && right_index < right.length
            if left[left_index] < right[right_index]
                new_arr << left[left_index]
                left_index += 1
            else
                new_arr << right[right_index]
                right_index += 1
            end
        end
        if left_index < left.length
            new_arr += left[left_index..-1]
        else
            new_arr += right[right_index..-1]
        end
        new_arr
    end
end

def iter_fib(n)
    arr = [1, 1]
    while arr.length <= n
        arr << arr[-2] + arr[-1]
    end
    arr.take(n)
end

# p iter_fib(11)

def rec_fib(n)
    return [1, 1].take(n) if n <= 2
    last_arr = rec_fib(n - 1)
    last_arr << last_arr[-1] + last_arr[-2]
end

# p rec_fib(11)

def bsearch(array, target)
    return nil unless array.include?(target)
    mid_idx = array.length / 2
    return mid_idx if array[mid_idx] == target
    if target > array[mid_idx]
        array.take(mid_idx).length + bsearch(array.drop(mid_idx), target)
    else
        bsearch(array.take(mid_idx), target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


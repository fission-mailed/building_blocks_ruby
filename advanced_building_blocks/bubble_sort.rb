def bubble_sort(array)
	#	Assume array is unsorted
	sorted = false
	
	until sorted
		swapped = false
		#	Keep track of sort count
		sort_count ||= 0
		
		(0...(array.length - 1)).each do |i|
			if array[i] > array[i + 1]
				array[i], array[i + 1] = array[i + 1], array[i]
				#	If this block runs there has been a swap
				swapped = true
			end
		end
		
		if swapped 
			sort_count += 1
			puts "After sort #{sort_count}: #{array}"
		end
		
		# Array is only sorted when there hasn't been need of any swaps
		if !swapped
			sorted = true
		end
	end
	array
end

my_array = [4,3,78,2,0,2]
puts "Unsorted array is: #{my_array}"

puts "Sorted array is: #{bubble_sort(my_array)}"

def bubble_sort_by(array)
	sorted = false
	
	until sorted
		swapped = false
		(0...array.length - 1).each do |i|
			diff = yield(array[i],array[i+1])
			if diff > 0
				swapped = true
				array[i], array[i + 1] = array[i + 1], array[i]
			end
			
			if !swapped
				sorted = true
			end
		end
	end
	array
end

puts (bubble_sort_by(["hi", "hello", "hey"]) do |left,right|
	left.length - right.length
end).inspect

puts (bubble_sort_by(my_array) do |left,right|
	left - right
end).inspect
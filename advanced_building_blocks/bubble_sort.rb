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
		
		sort_count += 1
		puts "After sort #{sort_count}: #{array}"
		
		# Array is only sorted when there hasn't been need of any swaps
		if !swapped
			sorted = true
		end
	end
	puts "Sorted array is\n#{array}"
end

my_array = [4,3,78,2,0,2]
puts "Unsorted array is: #{my_array}"

bubble_sort(my_array)
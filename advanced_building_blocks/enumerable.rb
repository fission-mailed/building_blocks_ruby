module Enumerable

	def my_each
		for i in (0...self.size)
			yield(self[i])
		end
		self
	end
	
	def my_each_with_index
		for i in (0...self.size)
			yield(self[i], i)
		end
		self
	end
	
	def my_select
		selected = []
		self.my_each {|item| selected.push(item) if yield(item)}
		selected
	end
end

my_array = [1,2,3,4,5,6,7,8,9,10]
my_array.my_each {|num| print "#{num * 2}, "}
puts
my_array.my_each_with_index {|num, index| puts "#{index + 1}: #{num * 3}"}
puts (my_array.my_select {|num| num > 8}).to_s

puts (["hello", "goodbye"].my_select {|string| string[-1] == "e"}).to_s
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
	
	def my_all?
		result = true
		self.my_each {|item| result = false  unless yield(item)}
		result
	end
	
	def my_any?
		result = false
		self.my_each {|item| result = true if yield(item)}
		result
	end
	
	def my_none?
		result = true
		self.my_each {|item| result = false if yield(item)}
		result
	end
=begin	
	def my_count(var=nil, &block=nil)
		count = 0
		self.my_each{|item| count += 1 if yield(item)}
		count
	end
=end
end

my_array = [1,2,3,4,5,6,7,8,9,10]

puts my_array.my_none? {|num| num < 0}
puts my_array.my_none?{|num| num == 2}

puts my_array.my_count{7}

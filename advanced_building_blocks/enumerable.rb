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
	
	def my_count(param=nil)
		count = 0
		if param == nil && block_given? == false
			self.my_each{|item| count += 1}
		elsif param != nil && block_given? == false
			self.my_select{|item| item == param}.my_each{|item| count += 1}
		elsif param == nil && block_given?
			self.my_select{|item| yield(item)}.my_each{|item| count += 1}
		end
		count
	end
	
	def my_map
	end

end

my_array = [1,2,3,4,5,6,7,8,9,10]

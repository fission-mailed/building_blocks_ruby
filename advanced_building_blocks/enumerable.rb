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
	
	def my_map(&block)
		mapped = []
		if block == nil
			self.my_each{|item| mapped.push(yield(item))}
		else
			self.my_each{|item| mapped.push(block.call(item))}
		end
		mapped
	end
	
	def my_map!(&block)
		if !block
			self.my_each_with_index{|item, index| self[index] = yield(item)}
		else
			self.my_each_with_index{|item, index| self[index] = block.call(item)}
		end
		self
	end
	
	def my_inject(initial=self[0])
		array = self
		if initial == array[0]
			array = self[1..-1]
		end
		array.my_each{|item| initial = yield(initial, item)}
		initial
	end

end

def multiply_els(array)
		array.my_inject{|product, n| product*n}
end


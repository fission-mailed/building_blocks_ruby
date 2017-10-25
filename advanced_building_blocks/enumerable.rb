module Enumerable

	def my_each
		for i in (0...self.size)
		#Iterates through the array
			yield(self[i])
		#Yields current array item to the block
		end
		self											
		#Returns unmodified array
	end
	
	def my_each_with_index
		for i in (0...self.size)
			yield(self[i], i)				
		#Same as my_each but also yields index to the block
		end
		self
	end
	
	def my_select
		selected = []
		self.my_each {|item| selected << item if yield(item)}
		selected
		#Returns a new array of items that meet a certain condition
	end
	
	def my_all?
		result = true
		self.my_each do |item| 
			unless yield(item)
				result = false
				break
				#Only needs one false to return false 
				#no point checking other values after
			end
		end
		result
	end
	
	def my_any?
		result = false
		self.my_each do |item| 
			if yield(item)
				result = true
				break
				#Only needs one true value to return true
			end
		end
		result
	end
	
	def my_none?
		result = true
		self.my_each do |item| 
			if yield(item)
				result = false
				break
				#Only needs one true value to return true
			end
		end
		result
	end
	
	def my_count(param=nil)
		count = 0
		if param == nil
			if block_given?
				count = self.my_select{|item| yield(item)}.size
				#When a block is given, uses my_select to create an array
				#of desired values then returns the size of this array
			else
				count = self.size
				#When no parameters given returns size of the array
			end
		else
			count = self.my_select{|item| item == param}.size
			#When a parameter is given, uses my_select to create an
			#array of desired values then returns the size of this array
		end
		count
	end
	
	def my_map(&proc)
		mapped = []
		if proc
			self.my_each{|item| mapped << proc.call(item)}
			#Calls the proc if there is one
		else
			self.my_each{|item| mapped << yield(item)}
			#Otherwise yields to the block given
		end
		mapped
		#Returns a new array featuring the modified values
	end
	
	def my_map!(&proc)
		if proc
			self.my_each_with_index{|item, index| self[index] = proc.call(item)}
		else
			self.my_each_with_index{|item, index| self[index] = yield(item)}
		end
		self
		#Does the same as my_map but actually modifies original array
	end
	
	def my_inject(stored=self[0])
		array = self
		if stored == array[0]
		#If a parameter is not given, don't want to count the first element twice
			array = self[1..-1]
			#For some reason calling .shift on array actually alters self
		end
		array.my_each{|item| stored = yield(stored, item)}
		stored
	end

end

def multiply_els(array)
		array.my_inject{|product, n| product*n}
end

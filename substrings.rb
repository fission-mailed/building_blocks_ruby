dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts "Please type a sentence"
#	Create an array from the user input, ignoring any spaces or special characters
user_array = gets.chomp.downcase.split(/[^a-zA-Z0-9']/) - [""]

def substrings(array, dictionary)
	matches_hash = {}
	dictionary.each do |dictionary_word|
		matches = 0
		array.each do |user_word|
			#	Use regex to look for matches in the user string
			if(/#{dictionary_word}/.match(user_word))
				matches += 1
			end
		end
		if(matches > 0)
			matches_hash[dictionary_word] = matches
		end
	end
	
	return matches_hash
end

puts substrings(user_array, dictionary)
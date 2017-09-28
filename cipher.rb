def caesar_cipher(phrase, shift)

	alphabet = "abcdefghijklmnopqrstuvwxyz".split("").to_a
	coded_phrase = ""
	
	phrase_array = phrase.split("")
	
	phrase_array.each do |letter|
		if alphabet.include?(letter)
			new_index = alphabet.index(letter) + shift
			coded_phrase += alphabet[new_index % alphabet.length] 
		elsif alphabet.include?(letter.downcase)
			new_index = alphabet.index(letter.downcase) + shift
			coded_phrase += alphabet[new_index % alphabet.length].upcase 
		else
			coded_phrase += letter
		end
		
	end
	
	return coded_phrase
	
end

puts "Please enter the phrase you wish to code:"
decoded_phrase = gets.chomp
puts "Please input the shift factor (0-26)"
factor = gets.chomp.to_i

puts caesar_cipher(decoded_phrase, factor)
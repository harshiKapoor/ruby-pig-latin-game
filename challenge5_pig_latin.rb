

############################################## CODE CHALLENGE ##############################################

#RULE 1 - IF A WORD STARTS WITH CONSONANT , MOVE FIRST CHARACTER TO LAST AND ADD "AY" AT THE END , eg (hello => ellohay
#RULE 2 - IF A WORD STARTS WITH CONSONANT CLUSTER , MOVE ENTIRE CLUSTER TO LAST AND ADD "AY" AT THE END , eg (glove => oveglay)
#RULE 3 - IF A WORD STARTS WITH VOWEL , JUST ADD "AY" TO THE END OF THE WORD , eg (orange => orangeay)

def pig_latin (word) 

	cons = []
	# cons_indexes = []
	vowel = []
	vowel = []
	if letter?(word) == true
		word_array = word.split("")
		conns(word,word_array, word_array.find_all { |char| char!="a" && char!="e" && char!="i" && char!="o" && char!="i" })
	end

end


# routes to the correct rule
def conns(word,word_array, cons_characters) 
	cons_indexes = []

		cons_characters.each do |c|
			cons_indexes << word_array.index(c)
		end
		if cons_indexes.include?(0)
			if conns_cluster_or_singleton(cons_indexes) == "cluster"
				conns_cluster_rule(word,word_array)
			else
				conns_singleton_rule(word,word_array)
			end
		else
			conns_vowel_rule(word)
		end
end



def conns_vowel_rule(word)
	puts "your pig latin #{word} ----------- #{word +'ay'}  "
end


def conns_cluster_rule(word,word_array)
	shifted_chars = []
	word_array.each_with_index do |w, i|
		if w == "a" || w == "e" || w == "i" || w == "o" || w == "u"
			until i < 1
				shifted_chars << word_array.shift
				i = i - 1 
			end
		end

	end
	puts "your pig latin #{word} ----------- #{word_array.join + shifted_chars.join + 'ay'}"

end



def conns_singleton_rule(word,word_array)
	word_array = word.split("")
	first_letter = word_array.shift
	word_array << first_letter
	puts "your pig latin #{word} ----------- #{word_array.join + 'ay'}"
end


def conns_cluster_or_singleton(cons_indexes) 
	if cons_indexes[0]+1 == cons_indexes[1]
		"cluster"
	else
		"singleton"
	end
end


# checks if word contains only alphabets and not numeric or special digits
def letter?(word)
	word.match? /\A[a-zA-Z'-]*\z/
end



puts "####################WELCOME TO PIG latin GAME####################"
puts "please enter your word..."
pig_latin(gets.chomp)
puts "Want to continue? (Y/N)"
cont = gets.chomp
while cont == "Y" || cont == "y"
	puts "please enter your word..."
	pig_latin(gets.chomp)
	puts "Want to continue..? (Y/N)"
	cont = gets.chomp
end
#pig_latin("orange")
# pig_latin("hello")
# pig_latin("glove")

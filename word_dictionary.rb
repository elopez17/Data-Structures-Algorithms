# Add and Search Word - data structure design

# Design a data structure that supports the following two operations
# void  add_word(word)
# bool  search(word)

# search(word) can search a literal string or a regular expression
# string containing only letters a-z or '.'
# A '.' means it can represent any one letter

# For this problem, I implemented an information retrieval data structure
# also called a Trie. In this trie, the next level of nodes are 
# accessed through a hash where the key is the letter of the 
# node and the value is the node itself.

# Insertion O(n), where n = word.length
# Search best case: O(n)
# Search worst case: O(L), where L = first n levels of trie
# Space Complexity O(n)



class WordDictionary
  def initialize()
    @trie = Node.new('*')
  end

  def add_word(word)
    node = @trie

    for i in 0...word.length
      chr = word[i]
      if !node.next[chr]
        node.next[chr] = Node.new(chr)
      end
      node = node.next[chr]
    end
    node.word = true
  end

  def search(word)
    dfs(@trie.next, word, 0)
  end
end

def dfs (nodes, word, idx)
  chr = word[idx]
  if chr == '.'
    if idx + 1 == word.length
      return nodes.any? {|key, node| node.word }
    end
    nodes.each_value do |node|
      return true if dfs(node.next, word, idx + 1)
    end
  elsif nodes[chr]
    return nodes[chr].word if idx + 1 == word.length
    return true if dfs(nodes[chr].next, word, idx + 1)
  end

  false
end

class Node
  attr_accessor :val, :word, :next
  def initialize(val)
    @val = val
    @word = false
    @next = {}
  end
end

 
dictionary = WordDictionary.new()
dictionary.add_word("bad")
dictionary.add_word("dad")
dictionary.add_word("mad")
puts "added words: bad, dad, mad\n\n"

result = dictionary.search("pad")
puts "search(\"pad\") returned: #{result}"

result = dictionary.search("bad")
puts "search(\"bad\") returned: #{result}"

result = dictionary.search(".ad")
puts "search(\".ad\") returned: #{result}"

result = dictionary.search("b..")
puts "search(\"b..\") returned: #{result}"
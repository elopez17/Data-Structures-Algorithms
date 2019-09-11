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
class Dictionary

def initialize
  @dictionary = {}
end

def entries
  return @dictionary
end

def add(entry)
  if entry.class == Hash
    @dictionary.merge!(entry)
    @dictionary = @dictionary.sort_by{|keyword ,definition| keyword}.to_h
  else
    @dictionary[entry] = nil
  end
end

def include?(keyword)
  if @dictionary.include?(keyword)
    return true
  end
end

def keywords
  return @dictionary.keys
end

def find(word)
  results = {}
  @dictionary.each_key do |keyword|
    if keyword.start_with?(word)
      entry = {keyword => @dictionary[keyword]}
      results.merge!(entry)
    end
  end
  return results
end

end

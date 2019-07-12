require 'yaml'

def load_library(path)
  # "The first step will be to load the YAML file in the lib/ folder"
  emoticons_array = YAML.load_file(path)
  emoticon_hash = {}
  
  #Specifically mentions the names of these keys in the test
  emoticon_hash["get_emoticon"] = {}
  emoticon_hash["get_meaning"] = {}

  emoticons_array.each do |enlglish, array|
    emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
    emoticon_hash["get_meaning"][emoticon_set.last] = english_word
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end
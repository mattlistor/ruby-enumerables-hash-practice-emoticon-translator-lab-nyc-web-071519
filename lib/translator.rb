require 'yaml'

def load_library(path)
  # "The first step will be to load the YAML file in the lib/ folder"
  emoticons_array = YAML.load_file(path)
  emoticon_hash = {}
  
  #Specifically mentions the names of these keys in the test
  emoticon_hash["get_emoticon"] = {}
  emoticon_hash["get_meaning"] = {}

  #Filling out the keys' empty hashes
  emoticons_array.each do |english, array|
    #'array[0]' is english while 'array[1]' is japanese emoticon
    emoticon_hash["get_emoticon"][array[0]] = array.last 
    emoticon_hash["get_meaning"][array[1]] = english
  end
  
  return emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  return result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  return result
end
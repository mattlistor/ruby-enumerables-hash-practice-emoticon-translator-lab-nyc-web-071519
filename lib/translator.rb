require 'yaml'

def load_library(path)
  # "The first step will be to load the YAML file in the lib/ folder"
  emot_array = YAML.load_file(path)
  emot_hash = {}
  
  #Specifically mentions the names of these keys in the test
  emot_hash["get_emoticon"] = {}
  emot_hash["get_meaning"] = {}

  #Filling out the keys' empty hashes
  emot_array.each do |english, array|
    #'array[0]' is english while 'array[1]' is japanese emoticon
    emot_hash["get_emoticon"][array[0]] = array.last 
    emot_hash["get_meaning"][array[1]] = english
  end
  
  return emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emot_hash = load_library(path)
  
  #Checks if the emoticon is in the hash
  result = emot_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  
  return result
end

def get_english_meaning(path, emoticon)
  emot_hash = load_library(path)
  
  #Checks if the emoticon is in the hash
  result = emot_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  return result
end
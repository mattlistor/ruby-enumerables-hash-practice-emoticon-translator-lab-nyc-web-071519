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
  
  return emot_hash
end
#-----------------------------------
#1 Load
#2 Checks if the emoticon in the paramter exists in the hash
#3 Returns accordingly

def get_japanese_emoticon(path, emoticon)
  emot_hash = load_library(path)
  
  #Checks if the english emoticon is in the hash
  translation = emot_hash["get_emoticon"][emoticon]
  if translation == nil
    translation = "Sorry, that emoticon was not found" 
  end
  
  return translation
end

def get_english_meaning(path, emoticon)
  emot_hash = load_library(path)
  
  #Checks if the japanese emoticon is in the hash
  translation = emot_hash["get_meaning"][emoticon]
  if translation == nil
    translation = "Sorry, that emoticon was not found" 
  end
  
  return translation
end
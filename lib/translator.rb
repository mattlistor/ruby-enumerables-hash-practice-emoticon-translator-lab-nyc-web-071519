require 'yaml'

def load_library(path)
  # "The first step will be to load the YAML file in the lib/ folder"
  emoticons_array = YAML.load_file(path)
  emoticon_hash = {}
  
  emoticon_hash["japanese"] = {}
  emoticon_hash["english"] = {}

  emoticons_array.each do |english_word, emoticon_set|
    emoticon_hash["japanese"][emoticon_set.first] = emoticon_set.last
    emoticon_hash["english"][emoticon_set.last] = english_word
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["japanese"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["english"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end
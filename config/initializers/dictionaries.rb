# coding: utf-8
Dictionaries = Dir["#{Rails.root}/config/dictionaries/*"].map do |dic|
  YAML.load_file dic
end

Symbols = '1234567890-="!@#$%*()_+qwertyuiopQWERTYUIOPasdfghjklç~]ASDFGHJKLÇ^}\zxcvbnm,.;|ZXCVBNM<>:/?'

#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'pry'

# Fetch and parse HTML document
def path_to_crypto_websit
doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
return doc
end

def takes_crypto_names_from_website
  crypto_names_array = []
  # je mets tous les noms de crypto monay dans un tableau
  path_to_crypto_websit.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody//td[2]/div/a').each do |name|
    crypto_names_array << name.content
  end
  return crypto_names_array
end

def takes_crypto_values_from_website
  crypto_values_array = []
  # je met les valeurs de crypto monay dans un autre tableau
  path_to_crypto_websit.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a').each do |value|
    crypto_values_array << value.content
  end
  return crypto_values_array.class
end

puts takes_crypto_values_from_website



# 1) Isoler les éléments HTML qui vont bien
# 2) En extraire le texte et mettre ça dans un hash
# 3) Réorganiser ce hash dans un array de plusieurs mini-hash comme demandé

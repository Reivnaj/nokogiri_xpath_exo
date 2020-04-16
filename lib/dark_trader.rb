#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'pry'

# Fetch and parse HTML document
def path_to_crypto_website
doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
return doc
end

def takes_crypto_names_from_website
  crypto_names_array = []
  # je mets tous les noms de crypto monay dans un tableau
  path_to_crypto_website.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody//td[2]/div/a').each do |name|
    crypto_names_array << name.content
  end
  return crypto_names_array
end

def takes_crypto_values_from_website
  crypto_values_array = []
  # je met les valeurs de crypto monay dans un autre tableau
  path_to_crypto_website.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a').each do |value|
    crypto_values_array << value.content
  end
  return crypto_values_array
end


# faire des hash avec en key name 1 et en value value 1
def whats_the_currencie_value(range)
  crypto_hash_with_names_and_values = Hash.new
  array_of_hash_with_names_and_values = []
  cunt = takes_crypto_names_from_website.size
  # si on remplace 5 par cunt on aura les 200 valeurs
  # mais ça prend des plombes alors j'ai mis les 5 premières
  5.times do |i|
    array_of_hash_with_names_and_values << crypto_hash_with_names_and_values[takes_crypto_names_from_website[i]] = takes_crypto_values_from_website[i]
  end
  puts array_of_hash_with_names_and_values[range]
end

whats_the_currencie_value(1)

# 1) Isoler les éléments HTML qui vont bien
# 2) En extraire le texte et mettre ça dans un hash
# 3) Réorganiser ce hash dans un array de plusieurs mini-hash comme demandé

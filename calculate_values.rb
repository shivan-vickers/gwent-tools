# frozen_string_literal: true

require 'yaml'

cards = YAML.load(File.read('cards.yaml'))

sets = {
  base: {
    name: 'Base Set',
    value: 0,
    cards: []
  },
  merch: {
    name: 'Merchants of Ofir',
    value: 0,
    cards: []
  },
  iron: {
    name: 'Iron Judgement',
    value: 0,
    cards: []
  },
  curse: {
    name: 'Crimson Curse',
    value: 0,
    cards: []
  },
  novi: {
    name: 'Novigrad',
    value: 0,
    cards: []
  }
}

cards.each do |name, stats|
  set = stats[:set]

  sets[set][:value] += stats[:scraps]
  sets[set][:cards] << name
end

file = File.open('set_values.txt', 'w')

sets.each do |_, set|
  file.write "#{'-' * 24}\n"
  file.write "#{set[:name]}\n"
  file.write "#{'-' * 24}\n"
  
  set[:cards].each do |card|
    file.write "#{card}\n"
  end
  
  file.write "\nTotal Value: #{set[:value]}\n\n"
end

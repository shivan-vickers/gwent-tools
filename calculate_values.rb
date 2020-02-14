# frozen_string_literal: true

require 'yaml'

cards = YAML.load(File.read('cards.yaml'))

sets = {
  base: {
    name: 'Base Set'
  },
  merch: {
    name: 'Merchants of Ofir'
  },
  iron: {
    name: 'Iron Judgement'
  },
  curse: {
    name: 'Crimson Curse'
  },
  novi: {
    name: 'Novigrad'
  }
}

sets.each_key do |k|
  sets[k][:value] = 0
  sets[k][:cards] = []
end

cards.each do |name, stats|
  set = stats[:set]

  sets[set][:value] += stats[:scraps]
  sets[set][:cards] << [name, stats[:scraps]]
end

file = File.open('set_values.txt', 'w')

sets.each_value do |set|
  file.write "#{'-' * 24}\n"
  file.write "#{set[:name]}\n"
  file.write "#{'-' * 24}\n"

  set[:cards].each do |card|
    file.write "#{card[0]} (#{card[1]})\n"
  end

  file.write "\nTotal Value: #{set[:value]}\n\n"
end

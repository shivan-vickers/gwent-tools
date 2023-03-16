# frozen_string_literal: true

require 'yaml'

cards = YAML.load(File.read('cards.yaml'))

# All the sets should go here
# Thronebreaker included for completeness even though it can't be pulled
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
  },
  throne: {
    name: 'Thronebreaker'
  }
}

# Initialize the sets
sets.each_key do |k|
  sets[k][:value] = 0
  sets[k][:cards] = []
end

# Add each card to the appropriate set
cards.each do |name, stats|
  set = stats[:set]

  sets[set][:value] += stats[:scraps]
  sets[set][:cards] << [name, stats[:scraps]]
end

# Print a neat summary to a txt file
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

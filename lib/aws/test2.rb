#!/usr/bin/env ruby


data = [["Stephanie", "female"], ["Matz", "male"], ["Sandi", "female"], ["David", "male"],
["Aaron", "male"]]

class TransparentRoster
  attr_accessor :participants

  def initialize(data)
    @participants = structify(data)
  end

  def sorted_names
    participants.collect { |person| person.name }.sort
  end

  def participant_list
    puts "This year's participants include:"
    sorted_names.each { |name| puts name }
  end

  # here's where we turn the 2D array of data into struct objects

  Person = Struct.new(:name, :gender)

  def structify(data)
    data.collect { |pair| Person.new(pair[0], pair[1]) }
  end

end

tr = TransparentRoster.new(data)

print tr.sorted_names

require 'unicode'

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # makes a name without diacritics and downcased
  def safe_name
    @safe_name ||= Unicode.normalize_KD(name).unpack('U*').select {|cp| cp < 127}.pack('U*').downcase
  end
end

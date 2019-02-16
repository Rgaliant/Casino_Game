class AppErrors
  def self.errorInvalidChoice
    print "\033[A"
    print "      Invalid Choice \r".colorize(:red)
    print "> "
  end
end
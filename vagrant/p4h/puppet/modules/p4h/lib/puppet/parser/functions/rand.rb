

module Puppet::Parser::Functions
  newfunction(:rand, :type => :rvalue) do |args|
    rand(args.empty? ? 0 : args[0].to_i)
  end
end
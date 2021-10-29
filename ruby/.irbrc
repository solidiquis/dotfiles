require "awesome_print"

AwesomePrint.irb!

def h(*args)
  if args.length > 1
    IO.popen("pbcopy", "w") do |pipe|
      pipe.print Readline::HISTORY.to_a.grep(%r{#{args[0]}})[args[1]]
    end
    puts "Copied to clipboard."
  elsif args.length == 1
    Readline::HISTORY.to_a.grep %r{#{args[0]}}
  else
    Readline::HISTORY.to_a
  end
end

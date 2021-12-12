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

def c(str)
  IO.popen('pbcopy', 'w') { |f| f << str }
end

def dis(code)
  # https://lifegoo.pluskid.org/upload/doc/yarv/yarv_iset.html
  puts RubyVM::InstructionSequence.compile(code).disassemble.split('\n')
end

def parse_money(money)
  re = %r{\$([,0-9]+\.*\d*)$}
  money.match(re).captures.first.gsub(",", "").to_f
end

require "awesome_print"
require 'irb/completion'

puts "Using Ruby version \e[31m#{RUBY_VERSION}\e[0m."

AwesomePrint.irb!

CUSTOM_PROMPT = {
  AUTO_INDENT: true,
  PROMPT_I: "\e[36m>\e[0m ",
  PROMPT_N: "\e[32m>\e[0m ", # wtf does this one do?
  PROMPT_S: "\e[31m>\e[0m ",
  PROMPT_C: "\e[36m>\e[0m ",
  RETURN:   "%s\n"
}

IRB.conf[:PROMPT][:CUSTOM_PROMPT] = CUSTOM_PROMPT

IRB.conf[:PROMPT_MODE] = :CUSTOM_PROMPT

def h(pattern = nil)
  if pattern
    Readline::HISTORY.to_a.grep %r{#{pattern}}
  else
    Readline::HISTORY.to_a
  end
end

def pbcopy(str)
  IO.popen('pbcopy', 'w') { |f| f << str }
end

# https://lifegoo.pluskid.org/upload/doc/yarv/yarv_iset.html
def dis(code)
  puts RubyVM::InstructionSequence.compile(code).disassemble.split('\n')
end

# Evaluate previous command
def epc(index, pattern = nil)
  if pattern
    eval h(pattern)[index]
  else
    eval h[index]
  end
end


def kk
  print "\e[2J"
  print "\e[H"
end

#!/usr/bin/ruby

# frozen_string_literal: true

require "ostruct"

module Terminal
  UP_ARROW = "\e[36m\u{25B2}\e[0m"
  DOWN_ARROW = "\e[36m\u{25BC}\e[0m"

  FOCUSED_UP_ARROW = "\e[31m\u{25B2}\e[0m"
  FOCUSED_DOWN_ARROW = "\e[31m\u{25BC}\e[0m"

  def noncanonical_mode
    `stty -f /dev/tty cbreak min 1`
  end

  def unecho_mode
    `stty -f /dev/tty -echo`
  end

  def cursor_invisible
    print "\e[?25l"
  end

  def carriage_return
    print "\r"
  end

  def cursor_visible
    puts "\e[?25h"
  end

  def del_cursor_to_end
    print "\e[0K"
  end

  def cleanup
    carriage_return
    del_cursor_to_end
    cursor_visible
  end

  def prompt(font_size)
    print "#{DOWN_ARROW} #{font_size} #{UP_ARROW}"
  end

  def prompt_for_increment(font_size)
    print "#{DOWN_ARROW} #{font_size} #{FOCUSED_UP_ARROW}"
  end

  def prompt_for_decrement(font_size)
    print "#{FOCUSED_DOWN_ARROW} #{font_size} #{UP_ARROW}"
  end

  def carriage_return_around_task(&block)
    carriage_return
    block.call
    sleep 0.1
    carriage_return
  end
end

module AlacrittyConfig
  POSSIBLE_PATHS = %w[
    $XDG_CONFIG_HOME/alacritty/alacritty.yml
    $XDG_CONFIG_HOME/alacritty.yml
    $HOME/.config/alacritty/alacritty.yml
    $HOME/.alacritty.yml
  ].freeze

  def alacritty_config
    config_home = ENV["XDG_CONFIG_HOME"]

    if config_home
      path = File.join config_home, "alacritty.yml"

      return path if File.exist?(path)

      path = File.join config_home, "alacritty", "alacritty.yml"

      return path if File.exist?(path)
    end 

    path = File.join(Dir.home, ".alacritty.yml")

    return path if File.exist?(path)
  
    path = File.join(Dir.home, ".config", "alacritty", ".alacritty.yml")

    return path if File.exist?(path)

    raise "Unable to locate alacritty config. Make sure it's at one of the following:\n#{paths}"
  end

  private

  def paths
    POSSIBLE_PATHS.join("\n") 
  end
end

class AlacrittyFontSize
  include Terminal
  include AlacrittyConfig

  PATTERN = %r{size:\s+(\d+)}
  PREFIX = "size: "

  KEY = OpenStruct.new(
    Up: 65,
    Down: 66,
    k: 107,
    j: 106
  ).freeze

  INTERMEDIATE_BYTE = 91

  ESC = 27

  DEFAULT_FONT_SIZE = 12
  MINIMUM_FONT_SIZE = 6
  MAXIMUM_FONT_SIZE = 32

  attr_reader :font_size, :backup, :current_config, :config_path

  def initialize
    @config_path = alacritty_config
    @backup, @font_size = backup_and_current_fontsize
    @current_config = @backup.clone
  end

  def run
    noncanonical_mode
    unecho_mode
    cursor_invisible
    prompt font_size

    while (ch = $stdin.getc)
      first_byte = ch.bytes[0]

      case first_byte
      when ESC
        ch = $stdin.getc
        second_byte = ch.bytes[0]

        if second_byte == INTERMEDIATE_BYTE
          ch = $stdin.getc
          third_byte = ch.bytes[0]

          case third_byte
          when KEY.Up
            increment_font_size
          when KEY.Down
            decrement_font_size
          else
            next
          end
        end
      when KEY.k
        increment_font_size
      when KEY.j
        decrement_font_size
      else
        next
      end

      prompt font_size
    end
  rescue => e
    puts "\nSomething went wrong: #{e}."
    puts "Restoring original..."
    fs.restore_backup
  end

  private

  def increment_font_size
    carriage_return_around_task do
      if font_size + 1 < MAXIMUM_FONT_SIZE
        @font_size += 1
        prompt_for_increment font_size
        write_new_font_size
      end
    end
  end

  def decrement_font_size
    carriage_return_around_task do
      if font_size - 1 > MINIMUM_FONT_SIZE
        @font_size -= 1
        prompt_for_decrement font_size
        write_new_font_size
      end
    end
  end

  def write_new_font_size
    current_config.gsub! PATTERN, "#{PREFIX}#{font_size}"

    File.open(config_path, "w+") { |file| file.write current_config }
  end

  def backup_and_current_fontsize
    config = File.read(config_path)
    current_font_size = config.match(PATTERN).captures.first.to_i

    [config, current_font_size]
  end

  def restore_backup
    File.open(config_path, "w+") { |file| file.write backup }
  end
end

if __FILE__ == $PROGRAM_NAME
  fs = AlacrittyFontSize.new

  Signal.trap("INT") do
    fs.cleanup
    exit
  end

  Signal.trap("TERM") do
    fs.cleanup
    exit
  end
  
  fs.run
end

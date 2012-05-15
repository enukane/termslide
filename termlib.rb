
$term_x = -1
$term_y = -1

def check_term msg=nil
  if $term_x < 0 or $term_y < 0 then
    raise "[ERROR] terminal size not valid : #{msg}"
  end
end

def init_screen
  get_screen_size
end

def get_screen_size
  $term_x, $term_y = `stty size`.split.map!{|s| s.to_i}.reverse
  return [$term_x, $term_y]
rescue
  $term_x, $term_y = [-1, -1]
  return [$term_x, $term_y]
end

# currently wait uses sleep
# not good to mix with Thread or sound playing
def wait sec
  sleep sec
end

def clear_screen
  check_term
  x,y = get_screen_size
  print "\e[#{y-1};#{0}H"
  print "\e[2J"

  $stdout.flush
end

def reset_screen
  check_term
  x, y = get_screen_size
  print "\e[#{y};#{0}H"
end

def scroll_screen interval=0, lines=$term_y
  lines.times do |n|
    print "\n"
    wait interval  
  end
end

def print_center_x str
 print get_center_x_str str
 $stdout.flush
end

def get_center_x_str str
 check_term

  if str.length > $term_x then
    raise "[ERROR] text too long"
  end
  
  x = $term_x
  x = x + 1 if x.even?

  center = x /2 + 1

  str_len = str.length
  str_len = str_len + 1 if str_len.even?
  half_str_len = str_len/2

  str_head = center - half_str_len

  return "\e[#{str_head}C" + str
end


def print_center_y str
  print get_center_y_str str
  $stdout.flush
end

def get_center_y_str str
  check_term

  y = $term_y
  y = y + 1 if y.even?

  center = y/2 + 1

  return "\e[#{center};0H" + str
end


def print_center_y str
  print get_center_y_str str
  $stdout.flush
end


def print_text str
  print str
  $stdout.flush
end

init_screen

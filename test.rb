require 'termlib'


# initialized
x, y = init_screen

clear_screen



## screen 1
str = get_center_x_str "hello"

str = get_center_y_str str

print_text str

reset_screen


## waiting
gets


## screen 2

scroll_screen 0.1, y/2

# this message must be scrolled up but currently not
str = get_center_x_str "my name is @n_kane"
#str = get_center_y_str str

print_text str

scroll_screen 0.1, y/2

reset_screen




## waiting
gets


## screen 3

#transition
clear_screen

#
str = get_center_x_str "Today I will talk about GLENDA"
str = get_center_y_str str

print_text str

reset_screen

## waiting 
gets

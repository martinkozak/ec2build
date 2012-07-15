#!/usr/bin/ruby
# (c) 2012 Martin Kozák (martinkozak@martinkozak.net)

# updates pacman info
`pacman -Sy`

# generates the list
result = `pacman -Sg base`
result = result.gsub!(/(?:^|\n)base/, '').strip!.split(' ');
result.delete('linux')
result.push('openssh', 'zsh', 'linux-ec2', 'ec2-metadata', 'ec2arch')

puts result.sort.join(' ')

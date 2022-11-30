# Very, very jank script, I pity those who debug this someday
# Magic numbers everywhere beware

import readtime as rt
import re
import sys
import datetime

filename = str(sys.argv[1])

with open(filename, 'r') as file:
    data = file.read()

tmp = str(rt.of_markdown(data))

with open(filename, 'r') as file:
    lines = file.readlines()

count = 0
for line in lines:
    if re.search("post-meta", line):
        break
    count += 1

newline = lines[count][-1]
lines[count] = lines[count][:-1]

if re.search("min read", lines[count]):
    lines[count] = lines[count][:-37]

print(lines[count])

lines[count] += datetime.datetime.today().ctime() + " • " + tmp + newline

with open(filename, 'w') as file:
    file.writelines(lines)

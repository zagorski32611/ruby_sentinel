# ruby_sentinel
This program is a translation to Ruby from Python. 
It will start an SSH connection, execute df -h, get the output in bytes.

Then parses the output into multi-dimentional array for each filesystem. 

The it ocmpares the usage percentage to a user-defined threshold, 
if it's over that threshold, it uses my SendText module to send me a text message.

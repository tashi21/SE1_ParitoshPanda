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

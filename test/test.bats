setup() {
    source src/getlines.sh
}

@test "can call getlines function" {
    printf '\n\n\n' | getlines
}

@test "by default, empty line ends input mode" {
    run 'cat test/resources/poem.txt | getlines ; echo $REPLY'
    [ "${lines[0]}" = "Who spilled these stars across the sky?" ]
    [ "${lines[1]}" = "Like sparkling dust, like clouds of light." ]
}

# bash-getlines

A Bash function for reading multi-line user input to a variable.

## Examples

By default, user input is saved to `REPLY` global variable and empty line marks
the end of the input.

```
$ source src/getlines.sh
$ getlines  # 
Who spilled these stars across the stars
like sparkling dust, like clouds of light?

$ echo -n "$REPLY"
Who spilled these stars across the stars
like sparkling dust, like clouds of light?
$
```

You can specify the name of the variable, the text is saved to, and a text
which which marks the end of input.

```
$ source src/getlines.sh
$ getlines user_text '> ' END
>     MICHAEL:
> What's the most inspring thing I've ever said to you?
> 
>     DWIGHT:
> "Don't be an idiot". Changed my life.
> END
$ echo -n "$user_text"
    MICHAEL:
What's the most inspring thing I've ever said to you?

    DWIGHT:
"Don't be an idiot". Changed my life.
$ 
```

## Running Tests

You will need [shunit2](https://github.com/kward/shunit2) script.

```
$ ./test/run
test_user_input_is_saved_to_variable_named_reply_by_default
testResultVariableNameCanBeChanged
test_prompt_can_be_changed
test_sentinel_line_can_be_changed

Ran 4 tests.

OK
$ 
```

If you don't have shunit2, here's how you can install it, assuming you have
`~/.local/bin` in your PATH environment variable:

```
$ git clone https://github.com/kward/shunit2
Cloning into 'shunit2'...
remote: Enumerating objects: 3338, done.
remote: Counting objects: 100% (342/342), done.
remote: Compressing objects: 100% (138/138), done.
remote: Total 3338 (delta 213), reused 310 (delta 204), pack-reused 2996
Receiving objects: 100% (3338/3338), 652.58 KiB | 4.32 MiB/s, done.
Resolving deltas: 100% (1650/1650), done.
$ cd shunit2
$ ln -s "$(realpath shunit2)" ~/.local/bin/shunit2
$ 
```

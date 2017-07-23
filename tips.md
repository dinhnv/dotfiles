# Tips

## Shell

- `sudo !!`: run the latest command by sudo
- `^origin^replace`: run previous command but replacing. Useful for long command
- `sudo !!`: run the latest command by sudo
    i.e:
    ```
    curl https://mywebsitw.com
    ^sitw^site
    ```
- `<ESC> + .` or `ALT + .`: put the most recent argument to the shell. Multiple times for go the previous.
    i.e:
    ```
    ls -la ~/dotfiles/tmux
    cd <ESC> + .
    ```
- `[command] !*<tab>`: reuse all previous cmd arguments
- `curl ifconfig.me`: get external public ip
- `[command] <Ctrl+u> [command] <Ctrl+y>`: typing command, check something, continue to type command
    i.e:
    ```
    cat /var/log/app/application.log | grep 
    Ctrl+u
    grep "uid" application.yml
    Ctrl+y
    # type uid
    ```
- `rm !(*.foo|*.bar|*.baz)` remove files not in the pattern
- `nc -v -l 80 < file.ext` share file through 80 port (?!)
- `ssh-copy-id user@host` equals to `cat ~/.ssh/id_rsa.pub | ssh user@machine "mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys"`
- `mkdir /path/xxx && cd $_`: made dir and cd to

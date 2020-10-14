# My .emacs.d configuration
A clone of my Emacs configuration, set up for Linux. Uses `evil`.
Primarily for backup and redundancy purposes. 

> :warning: Unlike typical configurations: this one literally has
> batteries included, when you clone the repositories, you also clone
> the packages required. This is to prevent dependency hell and TLS
> key issues. As long as you're using Emacs 25+, you should be okay.

```
$ mv .emacs.d .emacs.d.bak
$ git clone https://github.com/nebhrajani-a/.emacs.d
```


## TODO
- Rewrite `init.el` in literate programming style with `org-mode`.
- Test on Windows.
- Add LSP support for most major modes.

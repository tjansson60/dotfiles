## 2025-08-04, Home and End button behavior

Using the https://www.reddit.com/r/MacOS/comments/pz9vnu/behavior_of_the_home_and_end_keys/ I created a
`DefaultKeyBinding.dict` in `~/Library/KeyBindings/` which remaps the buttons to end of line instead of end of file.

## 2025-02-03

Installed stats: https://github.com/exelban/stats
`brew install stats`

## 2024-04-25

* Shortcut - Datagrip - Search and open database objects `Cmd O` or double tab `Shift`
* Shortcut - Datagrip - Execute `Cmd - Enter`
* Shortcut - Datagrip - Open SQL editor `Cmd-Shift-N`

## 2024-04-24
* iterm2: Problem using Ctrl-leftarrow to get back one word. See: https://apple.stackexchange.com/questions/463712/is-there-a-way-to-jump-within-a-word-using-option-with-arrow-keys-in-iterm2
    https://apple.stackexchange.com/questions/173275/delete-key-doesnt-work-in-vim-on-iterm2/351434#351434
    > Go to Preferences > Profiles > Keys and load the default preset Natural Text Editing and delete all entries that are 
    > about delete and delete behaviour. After that it works as expected.
* Shortcut - Ctrl-Space: Change the keyboard language

## 2024-04-23
* Shortcut - Ctrl-Command-Q: Lock screen

## 2024-04-21

* Installed homebrew vim as the builtin vim is not compiled with clipboard capabilities. I also had to updated .vimrc to
include: `set clipboard=unnamed`
* Using the homebrew version of the vim also fixed problems using ale and ultisnips

## 2024-04-19

* Lock screen - `Control Command Q`
* Installed https://rectangleapp.com/ to do tiling. 
    * `Ctrl-Option ->` to left side of screen
    * `Ctrl-Option Enter` to full screen
* Installed flameshot
    * Start with `Command Shift X`

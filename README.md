# vim2browser.vim
DEMO

Vim2browser is a plugin to send texts with a browser in the Vim
 
```
This plugin is available only in Mac.
The reason why is because this plugin uses JXA.
```
 
## Install
#### ex. [NeoBundle](https://github.com/Shougo/neobundle.vim)
.vimrc
```
NeoBundle 'shikato/vim2browser.vim'
```

## Usage
| Command | Action |
|:-----------|------------:|
| :Vim2ChromeReplaseAll |The command replaces a text of a focused text area of Chrome with a all text of Vim.|
| :Vim2ChromeReplaseSelected |The command replaces a text of a focused text area of Chrome with a selected text of Vim.|
| :Vim2ChromeAppendAll |The command appends a text of a focused text area of Chrome with a all text of Vim.|
| :Vim2ChromeAppendSelected |The command appends a text of a focused text area of Chrome with a selected text of Vim.|
| :Chrome2VimReplaseAll |The command replaces a text of Vim with a all text of a focused text area of Chrome.|
| :Chrome2VimReplaseSelected |The command replaces a text of Vim with a selected text of a focused text area of Chrome.|
| :Chrome2VimAppendAll |The command appends a text of Vim with a all text of a focused text area of Chrome.|
| :Chrome2VimAppendSelected |The command appends a text of Vim with a selected text of a focused text area of Chrome.|
| :Vim2BrowserSetVimAppName something |The command sets Vim Application Name. (Default: MacVim)|

## License
MIT

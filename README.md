# vim2browser.vim
Vim2browser is Vim plugin to send texts to a browser from Vim.

![demo1](https://qiita-image-store.s3.amazonaws.com/0/47437/78ab94b7-d387-4866-3cb0-bc3f019a22b6.gif)
 
```
You can use this software only in Mac.
Because this software uses JXA.
This plugin dependes on no style paste with [shift + command + v].
```
 
## Download
#### ex. [NeoBundle](https://github.com/Shougo/neobundle.vim)
.vimrc
```
NeoBundle 'shikato/vim2browser.vim'
```

## Usage
| Command | Action |
|:-----------|------------:|
| :Vim2BrowserSetVimAppName something |The command sets Vim application name. (Default: MacVim)|
| :Vim2ChromeReplaseAll |The command replaces texts of focused textarea of Chrome with all texts of Vim.|
| :Vim2ChromeReplaseSelected |The command replaces texts of focused textarea of Chrome with selected texts of Vim.|
| :Vim2ChromeAppendAll |The command appends all texts of Vim to a focused textarea of Chrome.|
| :Vim2ChromeAppendSelected |The command appends selected texts of Vim to a focused textarea of Chrome.|
| :Vim2ChromeReplaseAllNotActivateVim |The command replaces texts of focused textarea of Chrome with all texts of Vim. The command doesn't activate Vim after replasing.|
| :Vim2ChromeReplaseSelectedNotActivateVim |The command replaces texts of focused textarea of Chrome with selected texts of Vim. The command doesn't activate Vim after replasing.|
| :Vim2ChromeAppendAllNotActivateVim |The command appends all texts of Vim to a focused textarea of Chrome. The command doesn't activate Vim after appending.|
| :Vim2ChromeAppendSelectedNotActivateVim |The command appends selected texts of Vim to a focused textarea of Chrome. The  command doesn't activate Vim after appending.|
| :Chrome2VimReplaseAll |The command replaces texts of Vim with all texts of focused textarea of Chrome.|
| :Chrome2VimReplaseSelected |The command replaces texts of Vim with selected texts of focused textarea of Chrome.|
| :Chrome2VimAppendAll |The command appends all texts of focused textarea of Chrome to Vim.|
| :Chrome2VimAppendSelected |The command appends selected texts of focused textarea of Chrome to Vim.|

## Other documents
[Qiita](http://qiita.com/shikato/items/2e8af1330e3ac8949279)

## License
MIT

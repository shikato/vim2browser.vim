let s:save_cpo = &cpo
set cpo&vim 

let s:TYPE_REPLACE_ALL = "1"
let s:TYPE_REPLACE_SELECTED = "2"
let s:TYPE_APPEND_ALL = "3"
let s:TYPE_APPEND_SELECTED = "4" 

let s:ACTIVATE_VIM = "1"
let s:NOT_ACTIVATE_VIM = "2" 

" Vimが動作しているappを指定する
" DefaultはMacVim
" 変更する場合は以下
" ex.
" Vim2BrowserSetVimAppName Terminal
let s:vimAppName = "MacVim"

let s:shareTextDir = ".vim2browser/"
let s:shareTextName = "share.txt"
let s:scriptsDir = expand('<sfile>:p:h') 

" -----Vim2Chrome-----

function! vim2browser#Vim2ChromeReplaseAll() 
  call s:SaveShareTextList(s:GetAllTextList())
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/vim2chrome.js " . s:TYPE_REPLACE_ALL . " " . s:vimAppName . " " . s:ACTIVATE_VIM . " > /dev/null 2>&1") 
endfunction 

function! vim2browser#Vim2ChromeReplaseSelected() 
  call s:SaveShareTextList(s:GetSelectedTextList())
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/vim2chrome.js " . s:TYPE_REPLACE_SELECTED . " " . s:vimAppName . " " . s:ACTIVATE_VIM . "  > /dev/null 2>&1") 
endfunction 

function! vim2browser#Vim2ChromeAppendAll() 
  call s:SaveShareTextList(s:GetAllTextList())
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/vim2chrome.js " . s:TYPE_APPEND_ALL . " " . s:vimAppName . " " . s:ACTIVATE_VIM . "  > /dev/null 2>&1") 
endfunction 

function! vim2browser#Vim2ChromeAppendSelected() 
  call s:SaveShareTextList(s:GetSelectedTextList())
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/vim2chrome.js " . s:TYPE_APPEND_SELECTED . " " . s:vimAppName ." " . s:ACTIVATE_VIM . "  > /dev/null 2>&1") 
endfunction 


function! vim2browser#Vim2ChromeReplaseAllNotActivateVim() 
  call s:SaveShareTextList(s:GetAllTextList())
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/vim2chrome.js " . s:TYPE_REPLACE_ALL . " " . s:vimAppName . " "  . s:NOT_ACTIVATE_VIM . "  > /dev/null 2>&1") 
endfunction 

function! vim2browser#Vim2ChromeReplaseSelectedNotActivateVim() 
  call s:SaveShareTextList(s:GetSelectedTextList())
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/vim2chrome.js " . s:TYPE_REPLACE_SELECTED . " " . s:vimAppName . " "  . s:NOT_ACTIVATE_VIM . "  > /dev/null 2>&1") 
endfunction 

function! vim2browser#Vim2ChromeAppendAllNotActivateVim() 
  call s:SaveShareTextList(s:GetAllTextList())
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/vim2chrome.js " . s:TYPE_APPEND_ALL . " " . s:vimAppName . " "  . s:NOT_ACTIVATE_VIM . "  > /dev/null 2>&1") 
endfunction 

function! vim2browser#Vim2ChromeAppendSelectedNotActivateVim() 
  call s:SaveShareTextList(s:GetSelectedTextList())
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/vim2chrome.js " . s:TYPE_APPEND_SELECTED . " " . s:vimAppName . " "  . s:NOT_ACTIVATE_VIM . "  > /dev/null 2>&1") 
endfunction 

" -----Chrome2Vim-----

function! vim2browser#Chrome2VimReplaseAll()
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/chrome2vim.js " . s:TYPE_REPLACE_ALL . " " . s:vimAppName . " > /dev/null 2>&1") 
endfunction 

function! vim2browser#Chrome2VimReplaseSelected() 
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/chrome2vim.js " . s:TYPE_REPLACE_SELECTED . " " . s:vimAppName . " > /dev/null 2>&1") 
endfunction 

function! vim2browser#Chrome2VimAppendAll() 
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/chrome2vim.js " . s:TYPE_APPEND_ALL . " " . s:vimAppName . " > /dev/null 2>&1") 
endfunction 

function! vim2browser#Chrome2VimAppendSelected() 
  call system("osascript -l JavaScript " . s:scriptsDir . "/../jxa/chrome2vim.js " . s:TYPE_APPEND_SELECTED . " " . s:vimAppName . " > /dev/null 2>&1") 
endfunction 

" デフォルト: MacVim
function! vim2browser#Vim2BrowserSetVimAppName(name)
  echo a:name
  let s:vimAppName = a:name
endfunction 

function! s:GetAllTextList() 
  let textArray = getline(1,'$') 
  let textList = []
  for i in textArray
    call add(textList, i) 
  endfor
  return textList
endfunction

function! s:GetSelectedTextList() 
  let tmp = @@
  silent normal gvy
  let selected = @@
  let @@ = tmp 
  return split(selected, "\n")
endfunction

function! s:SaveShareTextList(textList)
  let outputFile = s:shareTextDir . s:shareTextName
  if !filereadable(outputFile)
    call mkdir(s:shareTextDir) 
  endif 
  call writefile(a:textList, outputFile) 
endfunction 

let &cpo = s:save_cpo
unlet s:save_cpo

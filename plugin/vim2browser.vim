if exists("g:loaded_vim2browser")
  finish
endif
let g:loaded_vimtask = 1

let s:save_cpo = &cpo
set cpo&vim 


command! -nargs=0 Vim2ChromeReplaseAll call vim2browser#Vim2ChromeReplaseAll() 
command! -nargs=0 Vim2ChromeAppendAll call vim2browser#Vim2ChromeAppendAll() 
command! -nargs=0 Vim2ChromeReplaseSelected call vim2browser#Vim2ChromeReplaseSelected() 
command! -nargs=0 Vim2ChromeAppendSelected call vim2browser#Vim2ChromeAppendSelected() 

command! -nargs=0 Chrome2VimAppendSelected call vim2browser#Chrome2VimAppendSelected() 
command! -nargs=0 Chrome2VimReplaseAll call vim2browser#Chrome2VimReplaseAll() 
command! -nargs=0 Chrome2VimReplaseSelected call vim2browser#Chrome2VimReplaseSelected() 
command! -nargs=0 Chrome2VimAppendAll call vim2browser#Chrome2VimAppendAll() 

command! -nargs=1 Vim2BrowserSetVimAppName call vim2browser#Vim2BrowserSetVimAppName(<f-args>)


let &cpo = s:save_cpo
unlet s:save_cpo

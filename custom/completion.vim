" Helper function. Returns input from user
function GetInput()
    call inputsave()
    let x = input("input: ")
    call inputrestore()
    return x
endfunction

" Inserts string into current line, at cursor position
function PutStr(str)
    let original = getline('.')
    let cursor = getcurpos()[2]
    let one_before_cursor = cursor - 1
    let two_before_cursor = cursor - 2
    let beginning = original[0:one_before_cursor]
    let ending = original[one_before_cursor:-1]
    let final = beginning . a:str . ending
    call setline('.', final)
endfunction

function Grep()
    let str = GetInput()
    let excluded = "deps,node_modules,priv,_build"
    let options = " -rin -l --exclude-dir={" . excluded . "} "
    let location = " *"
    execute "grep" . options . str . location
endfunction

nnoremap <leader>grep :call Grep()<CR>


function HandleDW()
    if getline(".")[col(".")-1] == ','
        :normal dw
    endif
endfunction
nnoremap dw dw:call HandleDW()<CR>

" inserts variable into IO.inspect(VARIABLE, label: "VARIABLE")
function! EchoPRN()
    let name = GetInput()
    let str = "(prn \"" . name .  "\" " . name . ")"
    call PutStr(str)
endfunction


" Handle logging boilerplate in elixir and js
nnoremap <leader>prn :call EchoPRN()<CR>$
inoremap <leader>prn p<ESC>:call EchoPRN()<CR>x$xa
nnoremap <leader>log :call EchoPRN()<CR>$
inoremap <leader>log p<ESC>:call EchoPRN()<CR>x$xa

setlocal iskeyword-=.

" inserts variable into IO.inspect(VARIABLE, label: "VARIABLE")
function! EchoIO()
    let name = GetInput()
    let str = "IO.inspect(" . name . ", label: \"" . name . "\")"
    call PutStr(str)
endfunction

" Handle logging boilerplate in elixir and js
nnoremap <leader>io :call EchoIO()<CR>$
inoremap <leader>io p<ESC>:call EchoIO()<CR>x$xa


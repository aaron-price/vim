" Makes nerdtree open when vim does.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only empty nerdtree window remains
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! ToggleNerdAndNumbers()
    :NERDTreeToggle<CR>
    set invnumber invrelativenumber
endfunction

" Navigate frames with hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-n> :call ToggleNerdAndNumbers()<CR>

":NERDTreeToggle<CR>

" Disable "Press ? for help"
let NERDTreeMinimalUI=1

" Show hidden files
let NERDTreeShowHidden=1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg=none ctermfg='. a:fg .' guibg=none guifg=#151515'
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ex',           "magenta")
call NERDTreeHighlightFile('exs',          "magenta")
call NERDTreeHighlightFile('css',          "green")
call NERDTreeHighlightFile('js',           "blue")
call NERDTreeHighlightFile('cljs',         "cyan")
call NERDTreeHighlightFile('clj',          "cyan")

" Configuration files are red
call NERDTreeHighlightFile('gitignore',    "yellow")
call NERDTreeHighlightFile('yaml',         "yellow")
call NERDTreeHighlightFile('json',         "yellow")
call NERDTreeHighlightFile('edn',          "yellow")
call NERDTreeHighlightFile('conf',         "yellow")

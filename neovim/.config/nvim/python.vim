" Python configuration file for neovim
" Date: 2020/12

" Reminders:
" - gn - command to change current directory in netrw (under the cursor)

" <<------- SHORTCUTS:START ------->>
" Commands:
" - <A-t> - open/close terminal
" - <C-H> | <C-J> | <C-K> | <C-L> - move between windows
" - <leader>e - open/close File Explorer
"
" Note: <leader> is '\' (backslash) by default.

" Built-in shortcuts remapping
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" File explorer sidebar shortcuts (Ntree/netrw)
nnoremap <silent> <leader>e :Lexplore<CR>

" Terminal shortcuts
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <A-t> :call <SID>ToggleTerminal()<CR>
tnoremap <silent> <A-t> <C-\><C-n>:call <SID>ToggleTerminal()<CR>

" <<------- SHORTCUTS:END ------->>

" <<------- CONFIGURATIONS:START ------->>
" Built-in configuration
set ic
set number
set scrolloff=5
set tabstop=4 shiftwidth=4 expandtab

" Autosaving files

"augroup AutoSave
"    autocmd!
"    autocmd BufRead * if &filetype == '' | setlocal ft=text | endif
"    autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
"augroup END

" File explorer sidebar configuration (Ntree/netrw)
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

"augroup FileExplorerOpenOnEnter
"    autocmd!
"    autocmd VimEnter * :Lexplore | wincmd p
"augroup END

augroup FileExplorerCloseOnExit
    autocmd!
    autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), '&filetype') == 'netrw' || &buftype == 'quickfix' | q | endif
augroup END

augroup NetrwMappings
    autocmd!
    autocmd FileType netrw call ApplyNetrwMappings()
augroup END

function! ApplyNetrwMappings()
    nnoremap <buffer> <C-H> <C-W><C-H>
    nnoremap <buffer> <C-J> <C-W><C-J>
    nnoremap <buffer> <C-K> <C-W><C-K>
    nnoremap <buffer> <C-L> <C-W><C-L>
endfunction

" Terminal window configuration
function! s:ToggleTerminal()
    if &buftype == 'terminal'
        quit
    else
        belowright 8split+:terminal
        startinsert
    endif
endfunction

" <<------- CONFIGURATIONS:END ------->>


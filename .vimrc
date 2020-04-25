"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer
"       Walton P. Coutinho
"
" Obs: most plugins come from
"       https://opensource.com/article/19/11/vim-plugins
"
" Version 29/03/2020
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=1500

" Increase the undo limit
set history=1000

" Maximum number of tab pages that can be opened from the 
" command line.
set tabpagemax=10

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Enable mouse for scrolling and resizing
" set mouse=a

" Set the window’s title, reflecting the file currently 
" being edited
set title


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"determines the number of context lines you would like to see 
"above and below the cursor - when moving vertically using j/k
set scrolloff=15

" Turn on the Wild menu
set wildmenu

" Ignore files matching these patterns when opening files based 
" on a glob pattern
set wildignore+=.pyc,.swp,.exe

" New lines inherit the indentation of previous lines.
set autoindent

" Convert tabs to spaces.
set expandtab
set smarttab

" Round indent to multiple of 'shiftwidth'
set shiftround  

" 1 indent == 3 spaces
set shiftwidth=3

" Insert “tabstop” number of spaces when the “tab” 
" key is pressed
set tabstop=3

" The following should not be used if filetype indent is on
" set cindent
" set smartindent

" The following should not be on if smartindent or 
" cindent are set
filetype indent on

" Allow vim wrapping lines
set wrap

" But Avoid wrapping a line in the middle of a word
set linebreak

" Linebreak on 500 characters
set tw=500

" Show line numbers
set number

" Enable syntax highlighting
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git etc. 
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Useful mappings for moving around, saving,  tabs, etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast saving
nmap <leader>w :w!<cr>

" Fast quitting
nmap <leader>q :q<cr>

" Map <Space> to / (search) and 
" Ctrl-<Space> to ? (backwards search)
map <space> /

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Move quickly between tabs
map <S-Right> :tabnext<cr>
map <S-Left> :tabprevious<cr>

" Map a shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" Return to last edit position when opening files 
" (YOU WANT THIS!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle (plugin manager) settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Vundle (plugin manager) settings

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" call VundleBegin
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                             "
"                                                             "
"              Add All of your Plugins bellow                 "
"                           |                                 "
"                          \/                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Nerdcommenter settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'preservim/nerdcommenter'

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. Nerdtree settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'preservim/nerdtree'

" Open a NERDTree automatically when vim starts up?
"autocmd vimenter * NERDTree

" Open a NERDTree automatically when vim starts up if no 
" files were specified

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree automatically when vim starts up on 
" opening a directory

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if the only window left open is a NERDTree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. Rainbow parenthesis settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'frazrepo/vim-rainbow'

" Enable for several file types
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4. fzf (fuzzy finder) settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 5. ack settings (search file containing certain word)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'mileszs/ack.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 6. pack full of colourschemes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'flazz/vim-colorschemes'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7. Python autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python autocompletion
Plugin 'davidhalter/jedi-vim'

" Jedi selects the first line of the completion menu: for a better typing-flow and usually saves one keypress.

let g:jedi#popup_select_first = 0

" Jedi displays function call signatures in insert mode in real-time, 
" highlighting the current argument in Vim's command line aligned 
" with the function call (set to 2), which can improve the integrity 
" of Vim's undo history.
"
let g:jedi#show_call_signatures = "2"

" Try to find the definition of function/class under the cursor
" (follow identifier as far as possible, includes imports and 
" statements) - first tries |jedi#goto_definitions|, and falls back 
" to |jedi#goto_assignments| for builtin modules
let g:jedi#goto_command = "<leader>g"

" Goto definitions 
let g:jedi#goto_definitions_command = "<leader>d"

" This function finds the first definition of the function/class 
" under the cursor
let g:jedi#goto_assignments_command = "<leader>a"

" HELP - Show Documentation/Pydoc (shows a popup with assignments)
let g:jedi#documentation_command = "H"

" Completion from other opened files
Plugin 'Shougo/context_filetype.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 8. Use TAB for autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Supertab is a vim plugin which allows you to use <Tab> for all 
" your insert completion needs (:help ins-completion)
Plugin 'ervandew/supertab'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 9. Automatically close parenthesis, etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'Townk/vim-autoclose'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 10. Syntax highlighting for GAMS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plugin 'zorab47/vim-gams'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           ^                                 "
"                           |                                 "
"        All of your Plugins must be added above              "
"                                                             "
"                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" End Vundle
call vundle#end()            " required

" Turn filetype settings on
filetype on
filetype plugin indent on    " required
filetype plugin on

" Set up colour scheme
colorscheme badwolf


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Delete trailing white space on save, useful for some 
" filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun










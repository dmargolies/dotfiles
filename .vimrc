execute pathogen#infect()
filetype plugin indent on

if has('gui_running')
  set background=light
  colorscheme solarized
endif
let g:solarized_termcolors=256

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git' "https://github.com/kien/ctrlp.vim/issues/58
set splitright "https://stackoverflow.com/questions/29564525/ctrlp-open-selected-file-in-the-left-vertical-split



" https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/settings.vim
""
"" Basic Setup
""

if has('vim_starting') && !has('nvim') && &compatible
  set nocompatible               " Be iMproved
endif
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
" Neovim disallow changing 'enconding' option after initialization
" see https://github.com/neovim/neovim/pull/2929 for more details
if !has('nvim')
  set encoding=utf-8  " Set default encoding to UTF-8
end

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is 4 spaces
set shiftwidth=2                  " an autoindent (with <<) is 4 spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=['eslint']
let g:jsx_ext_required = 0 " dont require jsx extenstion on files (because we have js files with jsx)
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint' " use project eslint instead of global


"set backup/wrap directories so they're not in the same dir, so they don't
"mess up git status
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//


"We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
"https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"https://stackoverflow.com/questions/32019626/how-to-show-the-current-filename-in-each-split-windows-status-line-in-vim
" [buffer number] followed by filename:
"set statusline=[%n]\ %t
" for Syntastic messages:
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" show line#:column# on the right hand side
"set statusline+=%=%l:%c

"good info dotvim/statusline.vim
set statusline=[%n] "[buffer number]
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %t "space fileame tail of file in buffer
set statusline+=\ %#warningmsg# "switch to warningmsg color
set statusline+=%{SyntasticStatuslineFlag()} "show Syntastic flag
set statusline+=%* "back to normal color
set statusline+=%=%l:%c "show line#:column# on the right hand side

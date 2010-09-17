" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.
let mapleader = ","
set nocompatible                  " Must come first because it changes other options.

map <leader>b :FuzzyFinderBuffer<CR>
map <leader>f :FuzzyFinderFile \*\*\/<CR>

set columns=200

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set nostartofline  								" when siwtching buffers and cursor positions dont jump to the start of the line

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
"set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%{getcwd()}\ \ %P

" Or use vividchalk
colorscheme vividchalk

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
imap <Tab> <C-N>
imap <S-Tab> <C-P>
vmap <Tab> >gv
vmap <S-Tab> <gv
nmap <S-Tab> <C-W><C-W>
" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>
" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen
end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F6> :b#<CR>
map <right> :bn<cr>
map <left> :bp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoclosetags
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType xhtml,xml,erb,html.erb ru ftplugin/html/autoclosetag.vim

" for snipmate
au BufRead *.html.erb set ft=html.eruby
au BufNewFile *.html.erb set ft=html.eruby
 

nnoremap <c-f> :FuzzyFinderTextMate<CR>

map <F1> :FuzzyFinderBuffer<CR>

nnoremap map <leader>b :FuzzyFinderBuffer<CR>

map <F2> :FuzzyFinderFile<CR>

map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=files --exclude=public  --exclude=vendor .<CR>


" limit number of results shown for performance
let g:fuzzy_matching_limit=60
" ignore stuff that can't be openned, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

  " increate the number of files scanned for very large projects
let g:fuzzy_ceiling=20000
  " display relative path, instead of abbrevated path (lib/jeweler.rb vs
  " l/jeweler.rb)
let g:fuzzy_path_display = 'relative_path'

" Add RebuildTagsFile function/command
function! s:RebuildTagsFile()
  !ctags -R --exclude=coverage --exclude=files --exclude=public --exclude=log --exclude=tmp --exclude=vendor *
endfunction
command! -nargs=0 RebuildTagsFile call s:RebuildTagsFile()
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=files --exclude=public  --exclude=vendor .<CR>
set tags =./tags;


" vimacs stuff
imap <C-b> <Left>
vmap <C-b> <Left>
omap <C-b> <Left>
imap <C-f> <Right>
vmap <C-f> <Right>
omap <C-f> <Right>
imap <C-p> <Up>
vmap <C-p> <Up>
omap <C-p> <Up>
imap <C-n> <Down>
vmap <C-n> <Down>
omap <C-n> <Down>
inoremap <M-f> <C-o>e<Right>
vnoremap <M-f> e<Right>
onoremap <M-f> e<Right>
inoremap <M-b> <C-Left>
vnoremap <M-b> <C-Left>
onoremap <M-b> <C-Left>
imap <C-a> <Home>
vmap <C-a> <Home>
omap <C-a> <Home>
imap <C-e> <End>
vmap <C-e> <End>
omap <C-e> <End>
inoremap <M-a> <C-o>(
vnoremap <M-a> (
onoremap <M-a> (
inoremap <M-e> <C-o>)
vnoremap <M-e> )
onoremap <M-e> )
inoremap <C-d> <Del>
vnoremap <C-d> <Del>
onoremap <C-d> <Del>
inoremap <M-<> <C-o>1G<C-o>0
vnoremap <M-<> 1G0
onoremap <M-<> 1G0
inoremap <M->> <C-o>G<C-o>$
vnoremap <M->> G$
onoremap <M->> G$
inoremap <C-v> <PageDown>
vnoremap <C-v> <PageDown>
onoremap <C-v> <PageDown>
inoremap <M-v> <PageUp>
vnoremap <M-v> <PageUp>
onoremap <M-v> <PageUp>
inoremap <M-m> <C-o>^
vnoremap <M-m> ^
onoremap <M-m> ^
inoremap <C-x>= <C-g>
vnoremap <C-x>= <C-g>
onoremap <C-x>= <C-g>
inoremap <silent> <M-g> <C-o>:call <SID>GotoLine()<CR>
vnoremap <silent> <M-g> :<C-u>call <SID>GotoLine()<CR>
onoremap <silent> <M-g> :call <SID>GotoLine()<CR>
" Phear, <M-g> works properly even in Visual/Operator-Pending
" modes :)  (It's rather dangerous with the latter, though ...)
inoremap <M-Left> <S-Left>
vnoremap <M-Left> <S-Left>
onoremap <M-Left> <S-Left>
inoremap <M-Right> <S-Right>
vnoremap <M-Right> <S-Right>
onoremap <M-Right> <S-Right>
inoremap <C-Up> <C-o>{
vnoremap <C-Up> {
onoremap <C-Up> {
inoremap <C-Down> <C-o>}
vnoremap <C-Down> }
onoremap <C-Down> }

" autosave if i switch buffers
set autowrite

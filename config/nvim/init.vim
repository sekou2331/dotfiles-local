" SETTINGS: General {{{
  if !has('nvim')
    set nocompatible
  endif

  let g:python_host_prog  = $HOME.'/.pyenvs/nvim-2.7.10/bin/python'
  let g:python3_host_prog  = $HOME.'/.pyenvs/nvim-3.6.4/bin/python'

  let g:ale_emit_conflict_warnings = 0    " Ale conflicts with Syntastic..
  " Install VimPlug if not present
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  let mapleader = ","

  " Load and configure plugins
  source $HOME/.config/nvim/plugins.vim
  source $HOME/.config/nvim/plugins-config.vim

  set number             " Show line numbers
  autocmd BufWritePre * call TrimWhitespace() " zap trailing ws on save
" }}}

" MAPPINGS: General {{{

  nmap <leader>vv :vsplit<CR>   " Vertical split
  nmap <leader>ss :split<CR>    " Vertical split

  nmap <C-h> <C-w>h      " Navigate panes - left
  nmap <C-L> <C-w>l      " Navigate panes - right
  nmap <C-j> <C-w>j      " Navigate panes - down
  nmap <C-k> <C-w>k      " Navigate panes - up
" }}}

" MAPPINGS: PlantUML {{{
nnoremap <F5> :w!<CR> :silent make<CR>
inoremap <F5> <Esc>:w!<CR>:silent make<CR>
vnoremap <F5> :<C-U>:w!<CR>:silent make<CR
" }}}

" SETTINGS: Filetype specific settings {{{
  autocmd FileType *          setlocal tabstop=2 shiftwidth=2 softtabstop=0 noexpandtab
  autocmd FileType javascript,javascript.jsx setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
  autocmd FileType solidity   setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
  autocmd Filetype *commit*,markdown setlocal spell         " Spell Check
  autocmd Filetype *commit*,markdown setlocal textwidth=72  " Looks good
  autocmd Filetype make setlocal noexpandtab                " In Makefiles DO NOT use spaces instead of tabs
  autocmd Filetype html setlocal expandtab
  autocmd Filetype ruby setlocal expandtab
  autocmd Filetype json setlocal expandtab
" }}}

" fUNCTIONS: {{{
" Trims trailing whitespace
  function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
  endfunction
" }}}

" TODOS: {{{
" 1. Need a way to set the fold text for jsdoc comments.
" /** foobar
" should display as: +-n lines: foobar
" but displays   as: +-n lines: *

" pseudo code:
  " if v:foldstart begins with /**:
    " let sub = v:foldstart[3:33]

  " set foldtext=MyFoldText()
  " function MyFoldText()
    " let line = getline(v:foldstart)
    " if strpart(line, 0, 3) ==? "/**"
       " let sub = strpart(line, 3, 33)
    " else
       " let sub = oldFoldText()
    " endif
    " " let sub = substitute(line, '/\*\{1,2}\|\*/\|{{{\d\=', '', 'g')
    " return v:folddashes . sub
  " endfunction

" }}}

echom "migrate syntastic checks to ale"
echom "vale has to be configured. see: https://valelint.github.io/docs/config/"

" vim: foldmethod=marker:sw=2

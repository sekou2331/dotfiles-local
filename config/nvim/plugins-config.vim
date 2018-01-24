" SETTINGS: Statusline {{{
  let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste'  ],
        \             [ 'gitbranch', 'neomake', 'readonly', 'filename', 'modified'  ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head',
        \   'neomake': 'Neomakelightline',
        \   'filetype': 'MyFiletype'
        \ },
        \ }
" }}}

" SETTINGS: Ruby {{{
  let ruby_operators = 1
" }}}

" SETTINGS: JavaScript {{{
  let g:javascript_plugin_jsdoc = 1    " Highlight JSDoc

  augroup javascript_folding
      au!
      au FileType javascript setlocal foldmethod=syntax
  augroup END
" }}}
"
" SETTINGS: Editor {{{
  let g:EditorConfig_core_mode = 'external_command'
  let g:indentLine_char = '┆' " Indent guides
" }}}

" PLUGIN: heavenshell/vim-jsdoc {{{
  let g:jsdoc_enable_es6 = 1            " Allow ES6
  nmap <silent> <C-i> :JsDoc<CR>
" }}}

" PLUGIN: ctrlp {{{
" Notes: Ignores should be handled by .agignore
  let g:ctrlp_map = '<leader>t'
  nmap <leader>f :CtrlPMRUFiles<cr>

  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " Use silver searcher
  let g:ctrlp_working_path_mode = 0
" }}}

" PLUGIN: mshedVesuna/vim-markdown-preview {{{
  let vim_markdown_preview_github=1
  let vim_markdown_preview_hotkey='<C-y>'
  let vim_markdown_preview_browser='Google Chrome'
  let vim_markdown_preview_temp_file=1
  let vim_markdown_preview_pandoc=1
" }}}
"
" PLUGIN: neomake {{{
  nnoremap <leader>e :call LocationNext()<cr> " Use <leader>e to go to the next error
  " Use <leader>e to go to the next error
" }}}

" PLUGIN: deoplete {{{
  let g:deoplete#enable_at_startup = 1

  " Improve ultisnips and deoplete integration
  call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
" }}}

" PLUGIN: NERDTree {{{
  " NERDCommenter
  let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default
  let g:NERDCompactSexyComs = 1   " Use compact syntax for prettified multi-line comments
  let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)

  let NERDTreeIgnore = ['node_modules', 'tmp', 'bower_components']
  let NERDTreeMinimalUI = 1 " Don't want to see the extra text
  autocmd BufReadPre,FileReadPre * :NERDTreeClose " Close NERDTree after reading file
  map <silent> <leader>n :NERDTreeToggle<CR>
  let s:colors = palenight#GetColors() " Get colors from color scheme

  " NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  call NERDTreeHighlightFile('md', 'blue', 'none', s:colors.blue.gui, 'none')
  call NERDTreeHighlightFile('yml', 'magenta', 'none', s:colors.purple.gui, 'none')
  call NERDTreeHighlightFile('json', 'yellow', 'none', s:colors.yellow.gui, 'none')
  call NERDTreeHighlightFile('html', 'blue', 'none', s:colors.blue.gui, 'none')
  call NERDTreeHighlightFile('css', 'cyan', 'none', s:colors.cyan.gui, 'none')
  call NERDTreeHighlightFile('scss', 'cyan', 'none', s:colors.cyan.gui, 'none')
  call NERDTreeHighlightFile('coffee', 'yellow', 'none', s:colors.dark_yellow.gui, 'none')
  call NERDTreeHighlightFile('js', 'yellow', 'none', s:colors.yellow.gui, 'none')
  call NERDTreeHighlightFile('rb', 'red', 'none', s:colors.red.gui, 'none')
" }}}

" PLUGIN: syntastic {{{
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_javascript_eslint_exe = 'eslint '
  let g:syntastic_solidity_checkers = ['solhint']
  let g:syntastic_colidity_solhint_exe = 'solhint'
" }}}

" PLUGIN scrooloose/nerdcommenter {{{
  let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
" }}}

" FUNCTION: NeomakeLightlineStatus {{{
  function! NeomakeLightlineStatus()
      if !exists('*neomake#statusline#LoclistCounts')
          return ''
      endif

      " Count all the errors, warnings
      let total = 0

      for v in values(neomake#statusline#LoclistCounts())
          let total += v
      endfor

      for v in items(neomake#statusline#QflistCounts())
          let total += v
      endfor

      if total == 0
          return ''
      endif

      return 'line '.getloclist(0)[0].lnum. ', 1 of '.total
  endfunction
" }}}

" FUNCTION: LocationNext {{{
function! LocationNext()
  try
    lnext
  catch
    try | lfirst | catch | endtry
  endtry
endfunction
" }}}

" FUNCTION: MyFiletype {{{
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
" }}}

" PLUGIN: ale {{{
  let g:ale_linters = {
  \   'text': ['vale'],
  \}
" }}}

" vim: foldmethod=marker:sw=2

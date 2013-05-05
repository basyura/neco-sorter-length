let s:save_cpo = &cpo
set cpo&vim

function! neocomplcache#filters#sorter_length#define()
  return s:sorter
endfunction"}}}

let s:sorter = {
      \ 'name'        : 'sorter_length',
      \ 'description' : 'length sorter',
      \}

function! s:sorter.filter(context)
  return sort(a:context.candidates, 's:compare')
endfunction

function! s:compare(i1, i2)
  let l:diff = len(a:i1.word) - len(a:i2.word)
  if !l:diff
    let l:diff = (a:i1.word ># a:i2.word) ? 1 : -1
  endif
  return l:diff
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

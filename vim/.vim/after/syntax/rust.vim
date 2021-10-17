unlet b:current_syntax
syn include @GLSL syntax/glsl.vim
syn region GLSL start=/\v\<\<[-~]SQL/ end=/\vSQL/ keepend contains=@GLSL
syn region GLSL start=/_glsl/ end=/\v\#\;/ keepend contains=@GLSL
let b:current_syntax = "rust"

unlet b:current_syntax
syn include @GLSL syntax/glsl.vim
syn region GLSL start=/_glsl\c[: ][^=]*= r#"/ end=/\v"#;/ keepend contains=@GLSL
let b:current_syntax = "rust"

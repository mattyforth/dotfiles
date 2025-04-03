(directive) @tag
(directive_start) @tag
(directive_end) @tag
(comment) @comment @spell
[
 (bracket_start)
 (bracket_end)
] @punctuation.bracket

; (directive) @function
; (directive_start) @function
; (directive_end) @function
; ; Changed the above to @tag instead, as per https://seankegel.com/neovim-for-php-and-laravel#heading-blade-highlights
; ;(directive) @tag
; ;(directive_start) @tag
; ;(directive_end) @tag
;
; (comment) @comment
; ((parameter) @include (#set! "priority" 110)) 
; ((php_only) @include (#set! "priority" 110)) 
; ((bracket_start) @function (#set! "priority" 120)) 
; ((bracket_end) @function (#set! "priority" 120)) 
 (keyword) @function

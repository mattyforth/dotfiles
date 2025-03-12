; New injections from https://github.com/EmranMR/tree-sitter-blade/blob/1c0c868b869acffb9a72f98ac677b8d0b8182605/queries/injections.scm
((text) @injection.content
    (#not-has-ancestor? @injection.content "envoy")
    (#set! injection.combined)
    (#set! injection.language php))

; could be bash or zsh
; or whatever tree-sitter grammar you have.
((text) @injection.content
    (#has-ancestor? @injection.content "envoy")
    (#set! injection.combined)
    (#set! injection.language bash))


((php_only) @injection.content
    (#set! injection.language php_only))
((parameter) @injection.content
    (#set! injection.language php_only))

;((text) @injection.content
;   (#not-has-ancestor? @injection.content "envoy")
;   (#set! injection.combined)
;   (#set! injection.language php))
;
;; tree-sitter-comment injection
;; if available
;((comment) @injection.content
; (#set! injection.language "comment"))
;
;((text) @injection.content
;   (#has-ancestor? @injection.content "envoy")
;   (#set! injection.combined)
;   (#set! injection.language bash))
;
;((php_only) @injection.content
;   (#set! injection.combined)
;   (#set! injection.language php_only))
;
;((parameter) @injection.content
;   (#set! injection.language php_only))

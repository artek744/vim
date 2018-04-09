syn match    cCustomParen    "?=(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*\n*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function

hi CTagsDefinedName ctermfg=37 guifg=#00afaf
hi! link CTagsGlobalVariable normal
hi! link CTagsType normal
hi! link CTagsStructure normal
hi! link CTagsMember normal

syn match    cCustomParen    "?=(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*\n*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function


hi! link  myCTypeColor Type
hi! link cType myCTypeColor

hi CTagsDefinedName ctermfg=48 guifg=#00ff87
hi! link CTagsGlobalVariable normal
hi! link CTagsType normal
hi! link CTagsStructure myCTypeColor
hi! link CTagsType myCTypeColor
hi! link CTagsMember normal

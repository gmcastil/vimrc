" Add support for joining comments and deleting the comment leader
if v:version > 703 || v:version == 703 && has ('patch541')
  setlocal formatoptions+=j
endif

_CC_FLAGS_COMMON.push("-m32 -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast")
_CXX_FLAGS_COMMON.push("-m32 -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast")
_ASM_FLAGS_COMMON.push("-f elf")

if is_windows
    _CC_FLAGS_COMMON.push "-fno-leading-underscore"
    _CXX_FLAGS_COMMON.push "-fno-leading-underscore"
end

if RUBY_PLATFORM =~ /darwin/ #fuck OSX CLANG
    _LINK_FLAGS_COMMON.push("-arch i386")
else 
    if !is_windows  #*nix
        _LINK_FLAGS_COMMON.push("-m elf_i386")
    else 
        _LINK_FLAGS_COMMON.push("-m i386pe")
    end
end
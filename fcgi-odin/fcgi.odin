package fcgi_odin

foreign import fcgi "system:fcgi"

FCGI_FILE :: struct {
    stdio_stream: rawptr,
    fcgx_stream: rawptr,
}

foreign fcgi {
    _fcgi_sF : [3]FCGI_FILE
}

@(default_calling_convention="c", link_prefix="FCGI_")
foreign fcgi {
    Accept :: proc() -> i32 ---
    printf :: proc(format: cstring, #c_vararg args: ..any) ---
    fread :: proc(ptr: rawptr, size: uint, nmemb: int, fp: ^FCGI_FILE) -> uint ---
}

package main

import "core:c/libc"
import "core:fmt"
import "core:bufio"
import "core:os"
import "core:strings"
import fcgi "fcgi-odin"

main :: proc() {
    for fcgi.Accept() >= 0 {
        free_all(context.temp_allocator)

        fmt.eprintln(libc.system("/usr/bin/env >&2"))

        buf: [1024]byte
        fcgi.fread(&buf[0], len(buf), 1, &fcgi._fcgi_sF[0])

        input := strings.clone_from(buf[:], context.temp_allocator)
        fmt.eprintln(input)

        fcgi.printf("Status: 200 OK\r\n")
        fcgi.printf("Content-type: text/html\r\n\r\n")
        fcgi.printf("<!doctype><html><body>Hola mundo from fastcgi with lighttpd!</body></html>\n")
    }
}

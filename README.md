# go-osx-crosscompile-hang

This repo demonstrates a hang when using go HTTP library when cross compiling to an OS X binary.

A simple program which performs a HTTP get, consistently has a 10 second delay in the cross-compiled version versus the natively built version. The delay is demonstratable in Go 1.7.6, 1.8.3, and 1.9.

```
package main

import (
	"log"
	"net/http"
	"time"
)

func main() {
	start := time.Now()
	http.Get("https://google.com")
	log.Printf("Elapsed: %v", time.Since(start))
}
```

# OSX Native Build

```
$ go version
go version go1.8.3 darwin/amd64
$ go build httpgettest.go
$ for i in `seq 1 10`; do ./httpgettest ; done
2017/08/15 14:20:44 Elapsed: 525.989928ms
2017/08/15 14:20:45 Elapsed: 479.785494ms
2017/08/15 14:20:45 Elapsed: 477.800294ms
2017/08/15 14:20:46 Elapsed: 494.060461ms
2017/08/15 14:20:46 Elapsed: 477.368627ms
2017/08/15 14:20:47 Elapsed: 454.152783ms
2017/08/15 14:20:47 Elapsed: 463.760254ms
2017/08/15 14:20:48 Elapsed: 470.52473ms
2017/08/15 14:20:48 Elapsed: 461.632058ms
2017/08/15 14:20:49 Elapsed: 465.769262ms
```

# OSX Cross Compiled Build

```
$ ./build-in-docker.sh
$ for i in `seq 1 10`; do ./httpgettest-xcompiled ; done
2017/08/15 14:19:43 Elapsed: 10.532037349s
2017/08/15 14:19:54 Elapsed: 10.525551121s
2017/08/15 14:20:04 Elapsed: 10.572715005s
2017/08/15 14:20:15 Elapsed: 10.532407157s
2017/08/15 14:20:25 Elapsed: 10.54083169s
2017/08/15 14:20:36 Elapsed: 10.625399239s
2017/08/15 14:20:46 Elapsed: 10.539333467s
2017/08/15 14:20:57 Elapsed: 10.533211943s
2017/08/15 14:21:07 Elapsed: 10.539430574s
2017/08/15 14:21:18 Elapsed: 10.527510134s
```
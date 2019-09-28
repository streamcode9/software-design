```
is_http = (== "http://") . take 7
process_url = \url -> print (url ++ "\n" ++ get_url url)

map(process_url,
    filter(is_http,
           split(read_file(open("urls.txt")))))
```
* p1();p2();p3(); p1 >>= (\ _ -> p2) >>= (\ _ -> p3)
* f3(f2(f1()))    pure f1 >>= (pure . f2) >>= (pure . f3)

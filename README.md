#README

####手順

0. URLを変えよう！(account.rb,auth_create.rb)
1. パスワードを作ろう！下を見てね
2. コードに埋めてみよう！下を見てね

####パスワードを作るには？

```
$ ruby auth_create.rb your_passward
```

####認証するには？

インポート

```
require 'account'
```

ロジック

```
if !login("userid","passward")
    render :json => {"status":"ng"}
    return
end
```
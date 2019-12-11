# gem-lograge

プロダクション環境におけるログ管理の容易化に向けて
コンピュータリーダブルなログを生成する．

## 導入比較
### 標準出力
デフォルトのログ出力

```
$ be rails s -b 0.0.0.0
=> Booting Puma
=> Rails 6.0.1 application starting in development
=> Run `rails server --help` for more startup options
Puma starting in single mode...
* Version 4.3.1 (ruby 2.6.1-p33), codename: Mysterious Traveller
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://0.0.0.0:3000
Use Ctrl-C to stop
Started GET "/" for 192.168.0.11 at 2019-12-10 23:46:15 +0900
Cannot render console from 192.168.0.11! Allowed networks: 127.0.0.0/127.255.255.255, ::1
   (0.2ms)  SELECT sqlite_version(*)
Processing by Rails::WelcomeController#index as HTML
  Rendering /home/thaim/.rbenv/versions/2.6.1/lib/ruby/gems/2.6.0/gems/railties-6.0.1/lib/rails/templates/rails/welcome/index.html.erb
  Rendered /home/thaim/.rbenv/versions/2.6.1/lib/ruby/gems/2.6.0/gems/railties-6.0.1/lib/rails/templates/rails/welcome/index.html.erb (Duration: 4.4ms | Allocations: 546)
Completed 200 OK in 8ms (Views: 5.2ms | ActiveRecord: 0.0ms | Allocations: 1935)
```

lograge適用後のログ出力

```
$ be rails s -b 0.0.0.0
=> Booting Puma
=> Rails 6.0.1 application starting in development
=> Run `rails server --help` for more startup options
Puma starting in single mode...
* Version 4.3.1 (ruby 2.6.1-p33), codename: Mysterious Traveller
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://0.0.0.0:3000
Use Ctrl-C to stop
Cannot render console from 192.168.0.11! Allowed networks: 127.0.0.0/127.255.255.255, ::1
   (0.2ms)  SELECT sqlite_version(*)
method=GET path=/ format=html controller=Rails::WelcomeController action=index status=200 duration=7.42 view=4.49 db=0.00
```

### ログファイル
RAILS_ENV=production時におけるログファイル内容

デフォルト出力

```
$ RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true be rails s -b 0.0.0.0
$ cat log/production.log
I, [2019-12-11T08:18:29.159777 #6594]  INFO -- : [a604f8bd-ecf5-4774-9b8b-37fca712493d] Started GET "/users" for 192.168.0.11 at 2019-12-11 08:18:29 +0900
I, [2019-12-11T08:18:29.161100 #6594]  INFO -- : [a604f8bd-ecf5-4774-9b8b-37fca712493d] Processing by UsersController#index as HTML
I, [2019-12-11T08:18:29.164840 #6594]  INFO -- : [a604f8bd-ecf5-4774-9b8b-37fca712493d]   Rendering users/index.html.erb within layouts/application
D, [2019-12-11T08:18:29.166118 #6594] DEBUG -- : [a604f8bd-ecf5-4774-9b8b-37fca712493d]    (0.1ms)  SELECT sqlite_version(*)
D, [2019-12-11T08:18:29.166366 #6594] DEBUG -- : [a604f8bd-ecf5-4774-9b8b-37fca712493d]   User Load (0.1ms)  SELECT "users".* FROM "users"
I, [2019-12-11T08:18:29.169705 #6594]  INFO -- : [a604f8bd-ecf5-4774-9b8b-37fca712493d]   Rendered users/index.html.erb within layouts/application (Duration: 4.8ms | Allocations: 5246)
I, [2019-12-11T08:18:29.170265 #6594]  INFO -- : [a604f8bd-ecf5-4774-9b8b-37fca712493d] Completed 200 OK in 9ms (Views: 6.0ms | ActiveRecord: 0.6ms | Allocations: 7271)
I, [2019-12-11T08:21:24.463154 #6653]  INFO -- : [b7d1e681-c943-4663-9c2a-a70fbff9d00d] Started GET "/users/2" for 192.168.0.11 at 2019-12-11 08:21:24 +0900
I, [2019-12-11T08:21:24.464117 #6653]  INFO -- : [b7d1e681-c943-4663-9c2a-a70fbff9d00d] Processing by UsersController#show as HTML
I, [2019-12-11T08:21:24.464158 #6653]  INFO -- : [b7d1e681-c943-4663-9c2a-a70fbff9d00d]   Parameters: {"id"=>"2"}
D, [2019-12-11T08:21:24.468198 #6653] DEBUG -- : [b7d1e681-c943-4663-9c2a-a70fbff9d00d]    (0.1ms)  SELECT sqlite_version(*)
D, [2019-12-11T08:21:24.470211 #6653] DEBUG -- : [b7d1e681-c943-4663-9c2a-a70fbff9d00d]   User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
I, [2019-12-11T08:21:24.470395 #6653]  INFO -- : [b7d1e681-c943-4663-9c2a-a70fbff9d00d] Completed 404 Not Found in 6ms (ActiveRecord: 0.7ms | Allocations: 2708)
F, [2019-12-11T08:21:24.470738 #6653] FATAL -- : [b7d1e681-c943-4663-9c2a-a70fbff9d00d]
[b7d1e681-c943-4663-9c2a-a70fbff9d00d] ActiveRecord::RecordNotFound (Couldn't find User with 'id'=2):
[b7d1e681-c943-4663-9c2a-a70fbff9d00d]
[b7d1e681-c943-4663-9c2a-a70fbff9d00d] app/controllers/users_controller.rb:67:in `set_user'
```

lograge適用後のログ出力

```
$ RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true be rails s -b 0.0.0.0
$ cat log/lograge_production.log
# Logfile created on 2019-12-11 08:18:27 +0900 by logger.rb/66358
method=GET path=/users format=html controller=UsersController action=index status=200 duration=9.14 view=5.98 db=0.64 time=2019-12-11 08:18:29 +0900 host= exception= exception_object=
method=GET path=/users/2 format=html controller=UsersController action=show status=404 error='ActiveRecord::RecordNotFound: Couldn't find User with 'id'=2' duration=6.23 view=0.00 db=0.74 time=2019-12-11 08:21:24 +0900 host= exception=["ActiveRecord::RecordNotFound", "Couldn't find User with 'id'=2"] exception_object=Couldn't find User with 'id'=2
```

### ログフォーマッタの適用
`config.lograge.formatter = Lograge::Formatters::Logstash.new`
とすることでデフォルトのキーバリュー形式ではなくLogStash形式で出力できる

```
$ cat log/lograge_production.log
{"method":"GET","path":"/users","format":"html","controller":"UsersController","action":"index","status":200,"duration":11.91,"view":7.76,"db":0.84,"time":"2019-12-11T09:07:06.242+09:00","host":null,"exception":null,"exception_object":null,"@timestamp":"2019-12-11T00:07:06.242Z","@version":"1","message":"[200] GET /users (UsersController#index)"}
{"method":"GET","path":"/users/2","format":"html","controller":"UsersController","action":"show","status":404,"error":"ActiveRecord::RecordNotFound: Couldn't find User with 'id'=2","duration":1.21,"view":0.0,"db":0.11,"time":"2019-12-11T09:07:09.951+09:00","host":null,"exception":["ActiveRecord::RecordNotFound","Couldn't find User with 'id'=2"],"exception_object":"Couldn't find User with 'id'=2","@timestamp":"2019-12-11T00:07:09.951Z","@version":"1","message":"[404] GET /users/2 (UsersController#show)"}
```

`Lograge::Formatters::Json.new` とすれば以下の通り

```
{"method":"GET","path":"/users","format":"html","controller":"UsersController","action":"index","status":200,"duration":9.1,"view":5.96,"db":0.63,"time":"2019-12-11T09:04:51.960+09:00","host":null,"exception":null,"exception_object":null}
{"method":"GET","path":"/users/2","format":"html","controller":"UsersController","action":"show","status":404,"error":"ActiveRecord::RecordNotFound: Couldn't find User with 'id'=2","duration":1.31,"view":0.0,"db":0.12,"time":"2019-12-11T09:04:54.804+09:00","host":null,"exception":["ActiveRecord::RecordNotFound","Couldn't find User with 'id'=2"],"exception_object":"Couldn't find User with 'id'=2"}
```

`Lograge::Formatters::LTSV.new` とすれば以下の通り

```
method:GET	path:/users	format:html	controller:UsersController	action:index	status:200	duration:9.19	view:6.13	db:0.61time:2019-12-11 09:09:45 +0900	host:	exception:	exception_object:
method:GET	path:/users/2	format:html	controller:UsersController	action:show	status:404	error:'ActiveRecord::RecordNotFound: Couldn't find User with 'id'=2'	duration:5.53	view:0.00	db:0.65	time:2019-12-11 09:09:58 +0900	host:	exception:["ActiveRecord::RecordNotFound", "Couldn't find User with 'id'=2"]	exception_object:Couldn't find User with 'id'=2
```

`Lograge::Formatters::Raw.new` とすれば以下の通り


```
{:method=>"GET", :path=>"/users", :format=>:html, :controller=>"UsersController", :action=>"index", :status=>200, :duration=>19.54, :view=>12.64, :db=>1.37, :time=>"2019-12-11T09:11:43.006+09:00", :host=>nil, :exception=>nil, :exception_object=>nil}
{:method=>"GET", :path=>"/users/2", :format=>:html, :controller=>"UsersController", :action=>"show", :status=>404, :error=>"ActiveRecord::RecordNotFound: Couldn't find User with 'id'=2", :duration=>1.37, :view=>0.0, :db=>0.12, :time=>"2019-12-11T09:11:45.121+09:00", :host=>nil, :exception=>["ActiveRecord::RecordNotFound", "Couldn't find User with 'id'=2"], :exception_object=>#<ActiveRecord::RecordNotFound: Couldn't find User with 'id'=2>}
```

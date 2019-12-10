# gem-lograge

プロダクション環境におけるログ管理の容易化に向けて
コンピュータリーダブルなログを生成する．

## 導入比較

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

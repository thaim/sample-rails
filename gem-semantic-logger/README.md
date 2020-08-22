# Semantic Loggerで構造化ロギング

## ログ例

### Rackログ

```
{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.365544Z",
  "level":"debug",
  "level_index":1,
  "pid":171428,
  "thread":"puma 001",
  "name":"Rack",
  "message":"Started",
  "payload":{"method":"GET","path":"/greeting/index","ip":"192.168.0.11"}
}

{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T15:23:08.757966Z",
  "level":"debug",
  "level_index":1,
  "pid":171594,
  "thread":"puma 004",
  "name":"Rack",
  "message":"Started",
  "payload":{"method":"GET","path":"/sidekiq/","ip":"192.168.0.11"}
}
```

### ActiveRecordログ

```
{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.370967Z",
  "level":"debug",
  "level_index":1,
  "pid":171428,
  "thread":"puma 001",
  "duration_ms":0.07973215542733669,
  "duration":"0.080ms",
  "name":"ActiveRecord",
  "payload":{"sql":"SELECT \"schema_migrations\".\"version\" FROM \"schema_migrations\" ORDER BY \"schema_migrations\".\"version\" ASC"}
}
```

### Controllerログ

```
{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.373071Z",
  "level":"debug",
  "level_index":1,
  "pid":171428,
  "thread":"puma 001",
  "name":"GreetingController",
  "message":"Processing #index"
}

{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.614350Z",
  "level":"info",
  "level_index":2,
  "pid":171428,
  "thread":"puma 001",
  "duration_ms":241.235172143206,
  "duration":"241.2ms",
  "name":"GreetingController",
  "message":"Completed #index",
  "payload":{
    "controller":"GreetingController",
    "action":"index",
    "format":"HTML",
    "method":"GET",
    "path":"/greeting/index",
    "status":200,
    "view_runtime":229.55,
    "db_runtime":0.0,
    "status_message":"OK"
  }
}

{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T15:40:25.547013Z",
  "level":"info",
  "level_index":2,
  "pid":172115,
  "thread":"puma 001",
  "duration_ms":0.8064350113272667,
  "duration":"0.806ms",
  "name":"ErrorController",
  "message":"Completed #index",
  "payload":{
    "controller":"ErrorController",
    "action":"index",
    "format":"HTML",
    "method":"GET",
    "path":"/error/index",
    "view_runtime":0.0,
    "db_runtime":0.0,
    "exception_object":"StandardError",
    "status":500,
    "status_message":"Internal Server Error"
  }
}
```

### ActionViewログ

```
{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.386577Z",
  "level":"debug",
  "level_index":1,
  "pid":171428,
  "thread":"puma 001",
  "name":"ActionView",
  "message":"Rendering",
  "payload":{"template":"greeting/index.html.erb"}
}

{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.386962Z",
  "level":"debug",
  "level_index":1,
  "pid":171428,
  "thread":"puma 001",
  "duration_ms":0.33224793151021004,
  "duration":"0.332ms",
  "name":"ActionView",
  "message":"Rendered",
  "payload":{
    "template":"greeting/index.html.erb",
    "within":"layouts/application"
  }
}
```

### 任意のログ

```
{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.375790Z",
  "level":"debug",
  "level_index":1,
  "pid":171428,
  "thread":"puma 001",
  "name":"GreetingController",
  "message":"greeting index"
}

{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.375802Z",
  "level":"debug",
  "level_index":1,
  "pid":171428,
  "thread":"puma 001",
  "name":"GreetingController",
  "payload":{"user":"anonymous"}
}

{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.375816Z",
  "level":"debug",
  "level_index":1,
  "pid":171428,
  "thread":"puma 001",
  "name":"GreetingController",
  "message":"hello message with payload",
  "payload":{"user":"thaim"}
}

{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.375829Z",
  "level":"info",
  "level_index":2,
  "pid":171428,
  "thread":"puma 001",
  "name":"Rails",
  "message":"hello message"
}
```

### Exceptions
```
{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T15:40:25.547102Z",
  "level":"fatal",
  "level_index":5,
  "pid":172115,
  "thread":"puma 001",
  "file":"/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rails_semantic_logger-4.4.4/lib/rails_semantic_logger/extensions/action_dispatch/debug_exceptions.rb",
  "line":9,
  "name":"Rails",
  "exception":{
    "name":"StandardError",
    "message":"StandardError",
    "stack_trace":[
      "/home/thaim/src/github.com/thaim/sample-rails/gem-semantic-logger/app/controllers/error_controller.rb:3:in `index'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_controller/metal/basic_implicit_render.rb:6:in `send_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/abstract_controller/base.rb:194:in `process_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_controller/metal/rendering.rb:30:in `process_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/abstract_controller/callbacks.rb:42:in `block in process_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/activesupport-5.2.4.3/lib/active_support/callbacks.rb:132:in `run_callbacks'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/abstract_controller/callbacks.rb:41:in `process_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_controller/metal/rescue.rb:22:in `process_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_controller/metal/instrumentation.rb:34:in `block in process_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/activesupport-5.2.4.3/lib/active_support/notifications.rb:168:in `block in instrument'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/activesupport-5.2.4.3/lib/active_support/notifications/instrumenter.rb:23:in `instrument'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/activesupport-5.2.4.3/lib/active_support/notifications.rb:168:in `instrument'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_controller/metal/instrumentation.rb:32:in `process_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_controller/metal/params_wrapper.rb:256:in `process_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/activerecord-5.2.4.3/lib/active_record/railties/controller_runtime.rb:24:in `process_action'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/abstract_controller/base.rb:134:in `process'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionview-5.2.4.3/lib/action_view/rendering.rb:32:in `process'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_controller/metal.rb:191:in `dispatch'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_controller/metal.rb:252:in `dispatch'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/routing/route_set.rb:52:in `dispatch'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/routing/route_set.rb:34:in `serve'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/journey/router.rb:52:in `block in serve'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/journey/router.rb:35:in `each'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/journey/router.rb:35:in `serve'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/routing/route_set.rb:840:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rack-2.2.3/lib/rack/tempfile_reaper.rb:15:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rack-2.2.3/lib/rack/etag.rb:27:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rack-2.2.3/lib/rack/conditional_get.rb:27:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rack-2.2.3/lib/rack/head.rb:12:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/http/content_security_policy.rb:18:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:266:in `context'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rack-2.2.3/lib/rack/session/abstract/id.rb:260:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/cookies.rb:670:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/activerecord-5.2.4.3/lib/active_record/migration.rb:559:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/callbacks.rb:28:in `block in call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/activesupport-5.2.4.3/lib/active_support/callbacks.rb:98:in `run_callbacks'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/callbacks.rb:26:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/executor.rb:14:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/debug_exceptions.rb:61:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/web-console-3.7.0/lib/web_console/middleware.rb:135:in `call_app'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/web-console-3.7.0/lib/web_console/middleware.rb:22:in `block in call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/web-console-3.7.0/lib/web_console/middleware.rb:20:in `catch'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/web-console-3.7.0/lib/web_console/middleware.rb:20:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rails_semantic_logger-4.4.4/lib/rails_semantic_logger/rack/logger.rb:43:in `call_app'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rails_semantic_logger-4.4.4/lib/rails_semantic_logger/rack/logger.rb:28:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/remote_ip.rb:81:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/request_id.rb:27:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rack-2.2.3/lib/rack/method_override.rb:24:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rack-2.2.3/lib/rack/runtime.rb:22:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/activesupport-5.2.4.3/lib/active_support/cache/strategy/local_cache_middleware.rb:29:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/executor.rb:14:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/actionpack-5.2.4.3/lib/action_dispatch/middleware/static.rb:127:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/rack-2.2.3/lib/rack/sendfile.rb:110:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/railties-5.2.4.3/lib/rails/engine.rb:524:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/puma-3.12.6/lib/puma/configuration.rb:227:in `call'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/puma-3.12.6/lib/puma/server.rb:706:in `handle_request'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/puma-3.12.6/lib/puma/server.rb:476:in `process_client'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/puma-3.12.6/lib/puma/server.rb:334:in `block in run'",
      "/home/thaim/.rbenv/versions/2.4.2/lib/ruby/gems/2.4.0/gems/puma-3.12.6/lib/puma/thread_pool.rb:135:in `block in spawn_thread'"
    ]
  }
}
```

### Sidekiq

```
{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.380984Z",
  "level":"info",
  "level_index":2,
  "pid":171428,
  "thread":"puma 001",
  "name":"Rails",
  "message":"Enqueued HardWorkerJob (Job ID: 6525d7bc-6d76-4c39-a8d2-62bd0eae2e28) to Async(default)",
  "payload":{
    "event_name":"enqueue.active_job",
    "adapter":"Async",
    "queue":"default",
    "job_class":"HardWorkerJob",
    "job_id":"6525d7bc-6d76-4c39-a8d2-62bd0eae2e28",
    "provider_job_id":"c89e8d13-11d2-4515-b96f-638d1b1a064f",
    "arguments":"[\n\n]"
  }
}

{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.381855Z",
  "level":"info",
  "level_index":2,
  "pid":171428,
  "thread":"worker-1",
  "tags":["HardWorkerJob","6525d7bc-6d76-4c39-a8d2-62bd0eae2e28"],
  "name":"Rails",
  "message":"Performing HardWorkerJob (Job ID: 6525d7bc-6d76-4c39-a8d2-62bd0eae2e28) to Async(default)",
  "payload":{
    "event_name":"perform_start.active_job",
    "adapter":"Async",
    "queue":"default",
    "job_class":"HardWorkerJob",
    "job_id":"6525d7bc-6d76-4c39-a8d2-62bd0eae2e28",
    "provider_job_id":"c89e8d13-11d2-4515-b96f-638d1b1a064f",
    "arguments":"[\n\n]"
  }
}

{
  "host":"wnode03",
  "application":"Semantic Logger",
  "environment":"development",
  "timestamp":"2020-08-22T14:29:03.381901Z",
  "level":"info",
  "level_index":2,
  "pid":171428,
  "thread":"worker-1",
  "tags":["HardWorkerJob","6525d7bc-6d76-4c39-a8d2-62bd0eae2e28"],
  "name":"Rails",
  "message":"performing hard work job"
}
```


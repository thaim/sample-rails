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

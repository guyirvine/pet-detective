# pet-detective
ServiceMonitor version 2.

## Goal
1. Push & Pull interaction with targets
2. Oil light monitoring
3. Metric display

## Observation

### Runtime

    {
      app-key: <uuid>, //Application key
      mon-key: <uuid>, //Monitor key
      sent: <timestamp>,
      payload: <payload> //Were payload is a key,value JS object
    }

### Stored

    observation
      received: <timestamp>
      app-key: <uuid>,
      mon-key: <uuid>,
      sent: <timestamp>,

    observation payload
       observation ref, key, value

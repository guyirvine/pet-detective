# pet-detective
ServiceMonitor version 2.

## Goal
1, Push & Pull interaction with targets
2, Oil light monitoring
3, Metric display

## Payload

    {
      app-key: <uuid>,
      mon-key: <uuid>,
      sent: <timestamp>,
      payload: { <payload> }
    }

## Stored

    received: <timestamp>
    app-key: <uuid>,
    mon-key: <uuid>,
    sent: <timestamp>,
    payload: { <payload> }

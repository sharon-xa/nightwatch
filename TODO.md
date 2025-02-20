# Features

1. A simplified API for monitoring files and directories.
2. Support callbacks so users can register functions that execute on file events.
3. Or instead of callbacks just return the event and let the user handle it.
4. support asynchronous/non-blocking monitoring mode using threads or epoll.
5. Provide error handling and logging for better usability.
6. Watch multiple directories.
7. Configurable event types (allow users to choose which events to monitor).
8. API to remove watchers (kill_watcher()).


# TODO


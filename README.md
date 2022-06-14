## PowerShell Pode Server Example

This repository contains a PowerShell [Pode server](https://github.com/Badgerati/Pode) that can be pushed to a private registry for deployment.
The Pode server has file-based logging enabled, so that a logging agent can pick up the logs and forward them elsewhere.

### HTTP Routes

`GET /random-errors` - simulates HTTP 500 Internal Server Errors for a web application
`GET /` - home page

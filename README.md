## PowerShell Pode Server Example

This repository contains a PowerShell [Pode server](https://github.com/Badgerati/Pode) that can be pushed to a private registry for deployment.
The Pode server has file-based logging enabled, so that a logging agent can pick up the logs and forward them elsewhere.

### HTTP Routes

- `GET /random-errors` - simulates HTTP 500 Internal Server Errors for a web application
- `GET /` - home page with random background color. Also prints the PowerShell runspace ID, so you can determine if load balancing is working correctly


### Kubernetes Deployment

```powershell
@'
kind: Deployment
apiVersion: apps/v1
metadata:
  name: pwsh-pode
spec:
  replicas: 3
  selector:
    matchLabels:
      app: pwsh-pode
  template:
    metadata:
      labels:
        app: pwsh-pode
    spec:
      containers:
      - name: pwsh
        image: trevorsullivan/pwsh-pode
        ports:
        - containerPort: 34003
          protocol: TCP
---
kind: Service
apiVersion: v1
metadata:
  name: pwsh-pode
spec:
  ports:
  - name: pwsh-pode
    port: 80
    targetPort: 34003
    protocol: TCP
  selector:
    app: pwsh-pode
  type: ClusterIP
'@ | kubectl apply --filename -
```

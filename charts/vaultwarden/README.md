## Parameters

### Kubernetes settings

| Name                    | Description                                                                               | Value                |
| ----------------------- | ----------------------------------------------------------------------------------------- | -------------------- |
| `image.registry`        | Vaultwarden image registry                                                                | `docker.io`          |
| `image.repository`      | Vaultwarden image repository                                                              | `vaultwarden/server` |
| `image.tag`             | Vaultwarden image tag                                                                     | `1.30.3-alpine`      |
| `image.pullPolicy`      | Vaultwarden image pull policy                                                             | `IfNotPresent`       |
| `image.pullSecrets`     | Specify docker-registry secret names                                                      | `[]`                 |
| `fullnameOverride`      | String to override the application name.                                                  | `""`                 |
| `resourceType`          | Can be either Deployment or StatefulSet                                                   | `""`                 |
| `commonAnnotations`     | Annotations for the deployment or statefulset                                             | `{}`                 |
| `configMapAnnotations`  | Add extra annotations to the configmap                                                    | `{}`                 |
| `podAnnotations`        | Add extra annotations to the pod                                                          | `{}`                 |
| `commonLabels`          | Additional labels for the deployment or statefulset                                       | `{}`                 |
| `podLabels`             | Add extra labels to the pod                                                               | `{}`                 |
| `initContainers`        | extra init containers for initializing the vaultwarden instance                           | `[]`                 |
| `sidecars`              | extra containers running alongside the vaultwarden instance                               | `[]`                 |
| `nodeSelector`          | Node labels for pod assignment                                                            | `{}`                 |
| `affinity`              | Affinity for pod assignment                                                               | `{}`                 |
| `tolerations`           | Tolerations for pod assignment                                                            | `[]`                 |
| `serviceAccount.create` | Create a service account                                                                  | `true`               |
| `serviceAccount.name`   | Name of the service account to create                                                     | `vaultwarden-svc`    |
| `podSecurityContext`    | Pod security options                                                                      | `{}`                 |
| `securityContext`       | Default security options to run vault as read only container without privilege escalation | `{}`                 |
| `dnsConfig`             | Pod DNS options                                                                           | `{}`                 |

### Reliability configuration

| Name                                 | Description                                                             | Value   |
| ------------------------------------ | ----------------------------------------------------------------------- | ------- |
| `livenessProbe.enabled`              | Enable liveness probe                                                   | `true`  |
| `livenessProbe.initialDelaySeconds`  | Delay before liveness probe is initiated                                | `5`     |
| `livenessProbe.timeoutSeconds`       | How long to wait for the probe to succeed                               | `1`     |
| `livenessProbe.periodSeconds`        | How often to perform the probe                                          | `10`    |
| `livenessProbe.successThreshold`     | Minimum consecutive successes for the probe to be considered successful | `1`     |
| `livenessProbe.failureThreshold`     | Minimum consecutive failures for the probe to be considered failed      | `10`    |
| `readinessProbe.enabled`             | Enable readiness probe                                                  | `true`  |
| `readinessProbe.initialDelaySeconds` | Delay before readiness probe is initiated                               | `5`     |
| `readinessProbe.timeoutSeconds`      | How long to wait for the probe to succeed                               | `1`     |
| `readinessProbe.periodSeconds`       | How often to perform the probe                                          | `10`    |
| `readinessProbe.successThreshold`    | Minimum consecutive successes for the probe to be considered successful | `1`     |
| `readinessProbe.failureThreshold`    | Minimum consecutive failures for the probe to be considered failed      | `3`     |
| `startupProbe.enabled`               | Enable startup probe                                                    | `false` |
| `startupProbe.initialDelaySeconds`   | Delay before startup probe is initiated                                 | `5`     |
| `startupProbe.timeoutSeconds`        | How long to wait for the probe to succeed                               | `1`     |
| `startupProbe.periodSeconds`         | How often to perform the probe                                          | `10`    |
| `startupProbe.successThreshold`      | Minimum consecutive successes for the probe to be considered successful | `1`     |
| `startupProbe.failureThreshold`      | Minimum consecutive failures for the probe to be considered failed      | `10`    |
| `resources`                          | Resource configurations                                                 | `{}`    |
| `strategy`                           | Resource configurations                                                 | `{}`    |
| `podDisruptionBudget.enabled`        | Enable PodDisruptionBudget settings                                     | `false` |
| `podDisruptionBudget.minAvailable`   | Minimum number/percentage of pods that should remain scheduled.         | `1`     |
| `podDisruptionBudget.maxUnavailable` | Maximum number/percentage of pods that may be made unavailable          | `nil`   |

### Persistent data configuration

| Name              | Description                                                               | Value  |
| ----------------- | ------------------------------------------------------------------------- | ------ |
| `data`            | Data directory configuration, refer to values.yaml for parameters.        | `{}`   |
| `attachments`     | Attachments directory configuration, refer to values.yaml for parameters. | `{}`   |
| `webVaultEnabled` | Enable Web Vault                                                          | `true` |

### Database settings

| Name                         | Description                                                                                                                              | Value     |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `database.type`              | Database type, either mysql or postgresql                                                                                                | `default` |
| `database.host`              | Database hostname or IP address                                                                                                          | `""`      |
| `database.port`              | Database port                                                                                                                            | `""`      |
| `database.username`          | Database username                                                                                                                        | `""`      |
| `database.password`          | Database password                                                                                                                        | `""`      |
| `database.dbName`            | Database name                                                                                                                            | `""`      |
| `database.uriOverride`       | Manually specify the DB connection string                                                                                                | `""`      |
| `database.existingSecret`    | Name of an existing secret containing the database URI                                                                                   | `""`      |
| `database.existingSecretKey` | Key in the existing secret                                                                                                               | `""`      |
| `database.connectionRetries` | Number of times to retry the database connection during startup, with 1 second delay between each retry, set to 0 to retry indefinitely. | `15`      |
| `database.maxConnections`    | Define the size of the connection pool used for connecting to the database.                                                              | `10`      |

### Push notifications

| Name                | Description                                                      | Value |
| ------------------- | ---------------------------------------------------------------- | ----- |
| `pushNotifications` | Enable mobile push notifications, see values.yaml for parameters | `{}`  |

### Scheduled jobs

| Name                          | Description                                                                                          | Value          |
| ----------------------------- | ---------------------------------------------------------------------------------------------------- | -------------- |
| `emergencyNotifReminderSched` | Cron schedule of the job that sends expiration reminders to emergency access grantors.               | `0 3 * * * *`  |
| `emergencyRqstTimeoutSched`   | Cron schedule of the job that grants emergency access requests that have met the required wait time. | `0 7 * * * *`  |
| `eventCleanupSched`           | Cron schedule of the job that cleans old events from the event table.                                | `0 10 0 * * *` |
| `eventsDayRetain`             | Number of days to retain events stored in the database.                                              | `""`           |

### General settings

| Name                        | Description                                                                                  | Value         |
| --------------------------- | -------------------------------------------------------------------------------------------- | ------------- |
| `domain`                    | Domain name where the application is accessed                                                | `""`          |
| `sendsAllowed`              | Controls whether users are allowed to create Bitwarden Sends.                                | `true`        |
| `hibpApiKey`                | HaveIBeenPwned API Key                                                                       | `""`          |
| `orgAttachmentLimit`        | Max Kilobytes of attachment storage allowed per organization.                                | `""`          |
| `userAttachmentLimit`       | Max kilobytes of attachment storage allowed per user.                                        | `""`          |
| `userSendLimit`             | Max kilobytes of send storage allowed per user.                                              | `""`          |
| `trashAutoDeleteDays`       | Number of days to wait before auto-deleting a trashed item.                                  | `""`          |
| `signupsAllowed`            | By default, anyone who can access your instance can register for a new account.              | `true`        |
| `signupsVerify`             | Whether to require account verification for newly-registered users.                          | `true`        |
| `signupDomains`             | List of domain names for users allowed to register. For example:                             | `""`          |
| `orgEventsEnabled`          | Controls whether event logging is enabled for organizations                                  | `false`       |
| `orgCreationUsers`          | Controls which users can create new orgs.                                                    | `""`          |
| `invitationsAllowed`        | Even when registration is disabled, organization administrators or owners can                | `true`        |
| `invitationOrgName`         | String Name shown in the invitation emails that don't come from a specific organization      | `Vaultwarden` |
| `invitationExpirationHours` | The number of hours after which an organization invite token, emergency access invite token, | `120`         |
| `emergencyAccessAllowed`    | Controls whether users can enable emergency access to their accounts.                        | `true`        |
| `emailChangeAllowed`        | Controls whether users can change their email.                                               | `true`        |
| `showPassHint`              | Controls whether a password hint should be shown directly in the web page if                 | `false`       |

### Advanced settings

| Name                             | Description                                                                                                                                          | Value                                                                                                                                    |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ipHeader`                       | Client IP Header, used to identify the IP of the client                                                                                              | `X-Real-IP`                                                                                                                              |
| `iconService`                    | The predefined icon services are: internal, bitwarden, duckduckgo, google.                                                                           | `internal`                                                                                                                               |
| `iconRedirectCode`               | Icon redirect code                                                                                                                                   | `302`                                                                                                                                    |
| `iconBlacklistNonGlobalIps`      | Whether block non-global IPs.                                                                                                                        | `true`                                                                                                                                   |
| `experimentalClientFeatureFlags` | Comma separated list of experimental features to enable in clients, make sure to check which features are already enabled by default (.env.template) | `nil`                                                                                                                                    |
| `requireDeviceEmail`             | Require new device emails. When a user logs in an email is required to be sent.                                                                      | `false`                                                                                                                                  |
| `extendedLogging`                | Enable extended logging, which shows timestamps and targets in the logs                                                                              | `true`                                                                                                                                   |
| `logTimestampFormat`             | Timestamp format used in extended logging.                                                                                                           | `%Y-%m-%d %H:%M:%S.%3f`                                                                                                                  |
| `logging.logLevel`               | Specify the log level                                                                                                                                | `""`                                                                                                                                     |
| `logging.logFile`                | Log to a file                                                                                                                                        | `""`                                                                                                                                     |
| `adminToken.existingSecret`      | Specify an existing Kubernetes secret containing the admin token. Also set adminToken.existingSecretKey.                                             | `""`                                                                                                                                     |
| `adminToken.existingSecretKey`   | When using adminToken.existingSecret, specify the key containing the token.                                                                          | `""`                                                                                                                                     |
| `adminToken.value`               | Plain or argon2 string containing the admin token.                                                                                                   | `$argon2id$v=19$m=19456,t=2,p=1$Vkx1VkE4RmhDMUhwNm9YVlhPQkVOZk1Yc1duSDdGRVYzd0Y5ZkgwaVg0Yz0$PK+h1ANCbzzmEKaiQfCjWw+hWFaMKvLhG2PjRanH5Kk` |
| `adminRateLimitSeconds`          | Number of seconds, on average, between admin login requests from the same IP address before rate limiting kicks in.                                  | `300`                                                                                                                                    |
| `adminRateLimitMaxBurst`         | Allow a burst of requests of up to this size, while maintaining the average indicated by adminRateLimitSeconds.                                      | `3`                                                                                                                                      |
| `timeZone`                       | Specify timezone different from the default (UTC).                                                                                                   | `""`                                                                                                                                     |

### BETA Features

| Name               | Description                                                 | Value   |
| ------------------ | ----------------------------------------------------------- | ------- |
| `orgGroupsEnabled` | Controls whether group support is enabled for organizations | `false` |

### MFA/2FA settings

| Name               | Description                                                         | Value |
| ------------------ | ------------------------------------------------------------------- | ----- |
| `yubico.clientId`  | Yubico client ID                                                    | `""`  |
| `yubico.secretKey` | Yubico secret key                                                   | `""`  |
| `yubico.server`    | Specify a Yubico server, otherwise the default servers will be used | `""`  |
| `duo.ikey`         | Duo Integration Key                                                 | `""`  |
| `duo.secretKey`    | Duo Secret Key                                                      | `""`  |
| `duo.hostname`     | Duo API hostname                                                    | `""`  |

### SMTP Configuration

| Name                              | Description                                                                                                                                         | Value      |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| `smtp.existingSecret`             | Name of an existing secret containing the SMTP username and password. Also set smtp.username.existingSecretKey and smtp.password.existingSecretKey. | `""`       |
| `smtp.host`                       | SMTP host                                                                                                                                           | `""`       |
| `smtp.security`                   | SMTP Encryption method                                                                                                                              | `starttls` |
| `smtp.port`                       | SMTP port                                                                                                                                           | `25`       |
| `smtp.from`                       | SMTP sender email address                                                                                                                           | `""`       |
| `smtp.fromName`                   | SMTP sender FROM                                                                                                                                    | `""`       |
| `smtp.username.value`             | Username string for the SMTP authentication.                                                                                                        | `""`       |
| `smtp.username.existingSecretKey` | When using an existing secret, specify the key which contains the username.                                                                         | `""`       |
| `smtp.password.value`             | Password string for the SMTP authentication.                                                                                                        | `""`       |
| `smtp.password.existingSecretKey` | When using an existing secret, specify the key which contains the password.                                                                         | `""`       |
| `smtp.authMechanism`              | SMTP authentication mechanism                                                                                                                       | `Plain`    |
| `smtp.acceptInvalidHostnames`     | Accept Invalid Hostnames                                                                                                                            | `false`    |
| `smtp.acceptInvalidCerts`         | Accept Invalid Certificates                                                                                                                         | `false`    |
| `smtp.debug`                      | SMTP debugging                                                                                                                                      | `false`    |

### Exposure settings

| Name                              | Description                                                                    | Value                |
| --------------------------------- | ------------------------------------------------------------------------------ | -------------------- |
| `websocket.enabled`               | Enable websocket notifications                                                 | `true`               |
| `websocket.address`               | Websocket listen address                                                       | `0.0.0.0`            |
| `websocket.port`                  | Websocket listen port                                                          | `3012`               |
| `rocket.address`                  | Address to bind to                                                             | `0.0.0.0`            |
| `rocket.port`                     | Rocket port                                                                    | `8080`               |
| `rocket.workers`                  | Rocket number of workers                                                       | `10`                 |
| `service.type`                    | Service type                                                                   | `ClusterIP`          |
| `service.annotations`             | Additional annotations for the vaultwarden service                             | `{}`                 |
| `service.labels`                  | Additional labels for the service                                              | `{}`                 |
| `service.ipFamilyPolicy`          | IP family policy for the service                                               | `SingleStack`        |
| `ingress.enabled`                 | Deploy an ingress resource.                                                    | `false`              |
| `ingress.class`                   | Ingress resource class                                                         | `nginx`              |
| `ingress.nginxIngressAnnotations` | Add nginx specific ingress annotations                                         | `true`               |
| `ingress.additionalAnnotations`   | Additional annotations for the ingress resource.                               | `{}`                 |
| `ingress.labels`                  | Additional labels for the ingress resource.                                    | `{}`                 |
| `ingress.tls`                     | Enable TLS on the ingress resource.                                            | `true`               |
| `ingress.hostname`                | Hostname for the ingress.                                                      | `warden.contoso.com` |
| `ingress.additionalHostnames`     | Additional hostnames for the ingress.                                          | `[]`                 |
| `ingress.path`                    | Default application path for the ingress                                       | `/`                  |
| `ingress.pathWs`                  | Path for the websocket ingress                                                 | `/notifications/hub` |
| `ingress.pathType`                | Path type for the ingress                                                      | `Prefix`             |
| `ingress.pathTypeWs`              | Path type for the ingress                                                      | `Exact`              |
| `ingress.tlsSecret`               | Kubernetes secret containing the SSL certificate when using the "nginx" class. | `""`                 |
| `ingress.nginxAllowList`          | Comma-separated list of IP addresses and subnets to allow.                     | `""`                 |

# Taskwarrior for Docker

This is a docker image for the Taskwarrior
[Taskserver](https://github.com/GothenburgBitFactory/taskserver).

## Docker-Compose

```
version: '2.2'

services:
	taskwarrior:
		container_name: taskwarrior
		image: lukd/taskwarrior

		ports:
			- "53589:53589"

		environment:
			- "TASKD_BITS=4096"
			- "TASKD_EXPIRATION=365"
			- "TASKD_ORGANIZATION=My Organization"
			- "TASKD_CN=taskd.example.com"
			- "TASKD_COUNTRY=SE"
			- "TASKD_STATE=Västra Götaland"
			- "TASKD_LOCALITY=Göteborg"

		volumes:
			- "./volumes/data:/data"
```

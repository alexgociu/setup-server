Hostname naming conventions
===========================

Server types:
- dev - servers we use for development
- test - servers we use temporarely to test different applications or environments. Usually these servers simulate the live environment and are used during the staging stage. Usually these servers are not kept online due to resources that these require. They are built on demand using images or scripts to simulate the live environment.
- work - servers which execute queue/background jobs
- web - servers which provide a web interface and deal with customer requests
- slave - servers which run a slave database
- master - servers which run a master database

Cloud service providers:
- digi - digitalocean
- rack - rackspace
- aws - amazon web services

If the server belongs to a specific project, then use that project domain name:
- test.project.com
- slave3.project.com

If the server doesn't belong to a specific project:
- dev-lamp.aws.agency.com
- web1.digi.agency.com


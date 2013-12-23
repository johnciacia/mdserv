# mdserv

mdserv is a micro http server built on NodeJS that preprocesses static markdown files and serves the rendered HTML.

# Setup
Install the necessary dependencies

    > npm install

Build mdserv

    > grunt build

# Usage

    > node mdserv <path> <port> <host>

| Option | Description | Default | Required  |
| ------------- | ------------- | ----- | :-----:|
| path      | The full path to the directory that will serve the markdown files. The path should not have a trailing slash. Note: mdserv will need permission to read files in this directory. | pwd | no |
| port      | Any numeric port. If you are binding to a port smaller than 1024 you will need to run the mdserv as with elevated privileges. | 8888 | no |
| host | This can be a hostname or an IP address | localhost | no |



    > node mdserv /var/www 8080 127.0.0.1

# Release History
* 2013-12-13 v0.1 Initial release
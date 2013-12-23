url = require('url')
path = require('path')
fs = require('fs')
marked = require('marked')
rootDir = process.argv[2] or process.cwd()
port = process.argv[3] or 8888
hostName = process.argv[4] or 'localhost'

require('http').createServer((request, response) ->
  uri = url.parse(request.url).pathname
  fileName = path.join(rootDir, uri)
  
  fs.exists(fileName, (exists) ->
    if not exists
      console.log("404");
      response.writeHead(404, {'Content-Type': 'text/plain'})
      response.write('404 File not found')
      response.end()
      return

    if fs.statSync(fileName).isDirectory()
      fileName += '/README.md'

    fs.readFile(fileName, 'binary', (err, file) ->
      if err
        console.log("500");
        response.writeHead(500, {'Content-Type': 'text/plain'})
        response.write(err)
        response.end();
        return

      
      response.writeHead(200)
      response.write(marked(file), 'binary')
      response.end();
    )
  )
).listen(parseInt(port, 10), hostName)

console.log('Server running at\n  => ' + hostName + ':' + port + '/\nCTRL + C to shutdown')

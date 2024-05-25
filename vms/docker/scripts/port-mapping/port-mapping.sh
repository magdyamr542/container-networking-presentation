# Start a python server on 1234
docker run -it --rm -p 1234:1234 python:3.9.19-alpine python3 -m http.server --bind 0.0.0.0 1234

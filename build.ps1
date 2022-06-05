$version=$args[0]
docker build -t tlintanf/apache-server:$version .
docker run -dit -p 127.0.0.7:80:80 -p 127.0.0.7:22:22 -p 127.0.0.7:443:443 --name apache tlintanf/apache-server:$version

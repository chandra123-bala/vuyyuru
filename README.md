docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.22.0


Part I

# To check the downloaded images
docker images

# To run the container in backgroud
docker run -d  --name csvserver infracloudio/csvserver:latest


# Write script "gencsv.sh". Execute script & wrtie output to inputFile


start_num=$1
end_num=$2
cat /dev/null > inputFile
for ((i=${start_num};i<=${end_num};i++)); do
  rand_num=$RANDOM
  echo "$i, $rand_num" >>inputFile
done

#docker run with volumes
 docker run -d --name csvserver -v $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest

#Find the port application running
docker exec -it csvserver /bin/bash
netstat -anltp
port:9300

#Stop & remove
docker stop csvserver && docker rm csvserver

#To run container by exposing port to 9393
docker run -d --name csvserver -p 9393:9300 -v $(pwd)/inputFile:/csvserver/inputdata  infracloudio/csvserver:latest

#To run container by exposing port to 9393 & add evnironment variable
docker run -d --name csvserver -p 9393:9300 -v $(pwd)/inputFile:/csvserver/inputdata -e CSVSERVER_BORDER=Orange infracloudio/csvserver:latest
 




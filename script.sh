d=$(date +%Y-%m-%d-%hh-%mm-%ss).png

raspistill -o /home/pi/homesecurity/images/$d -w 500 -h 500

git add .
git commit -m "Identified person"
git push

url='"https://raw.githubusercontent.com/CristhianFernandez/homesecurity/master/images/'

body='{"nombre":"1","description":"1", "foto": '
end="${body} ${url}${d}\" }"
	
curl --header "Content-Type: application/json" \
  --request POST \
 --data "$end" \
  http://192.168.1.127:8080/criminal/index

curl http://192.168.1.127:8080/face/verify
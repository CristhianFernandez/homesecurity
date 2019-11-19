d=$(date +%Y-%m-%d-%hh-%mm-%ss).png

raspistill -o /home/pi/homesecurity/images/$d -w 500 -h 500

git add .
git commit -m "Identified criminal"
git push

url='"https://raw.githubusercontent.com/CristhianFernandez/homesecurity/master/images/'

body='{"nombre":"persona en lista negra","description":"peligroso", "foto": '
end="${body} ${url}${d}\" }"
	
curl --header "Content-Type: application/json" \
  --request POST \
 --data "$end" \
  http://goldenseed.ml:8080/criminal/index

sites=("https://google.com" "https://facebook.com" "https://twitter.com")

filename="check.log"

#clean the file
> $filename

for site in "${sites[@]}"
do
    if curl -o /dev/null -s -L --head -w "%{http_code}\n" https://google.com | grep 200 > /dev/null
    then
        echo "$site is UP" >> "$filename"
    else
        echo "$site is DOWN" >> "$filename"
    fi 
done

echo "result written to $filename"



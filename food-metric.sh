#!/bin/zsh 
# enter how much food (in cups) puppy will/has eaten today in terminal 
# using the Datadog API https://docs.datadoghq.com/api/latest/metrics/#submit-metrics 

echo "Good Day! How much will little Goose eat today?" 
read PUPPYFOOD
TIMENOW=`date +%s` 
echo "What brand of food is it?"
read PUPPYFOODBRAND

echo "Wow, he's eaten $PUPPYFOOD cups of food! Goose is a ma-chine! $TIMENOW"

curl -X POST "https://api.datadoghq.com/api/v2/series" \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: $DD_API_KEY" \
-d @- << EOF
{
  "series": [
    {
      "metric": "dog.food_amount",
      "type": 3,
      "points": [
        {
          "timestamp": $TIMENOW,
          "value": $PUPPYFOOD
        }
      ],
      "tags": [
        "dog_name:Goose",
        "food_brand:$PUPPYFOODBRAND"]
    }
  ]
}
EOF
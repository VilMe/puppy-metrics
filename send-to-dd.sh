#!/bin/zsh 
# enter puppyweight in terminal 
# using the Datadog API https://docs.datadoghq.com/api/latest/metrics/#submit-metrics 

echo "Good Day! How much does little Goose weigh today?" 
read PUPPYWEIGHT
TIMENOW=`date +%s` 
echo "What time of day is it? (morning or night)"
read TIMEOFDAY

echo "Nice Goose weighs $PUPPYWEIGHT lbs! He's growing up so fast $TIMENOW"

curl -X POST "https://api.datadoghq.com/api/v2/series" \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: $DD_API_KEY" \
-d @- << EOF
{
  "series": [
    {
      "metric": "testpuppyweight",
      "type": 0,
      "points": [
        {
          "timestamp": $TIMENOW,
          "value": $PUPPYWEIGHT
        }
      ],
      "tags": [
        "dog_name:Goose",
        "part_of_day:$TIMEOFDAY"]
    }
  ]
}
EOF
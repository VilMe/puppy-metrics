#!/bin/zsh 
# enter puppyweight in terminal 
# using the Datadog API https://docs.datadoghq.com/api/latest/metrics/#submit-metrics 

echo "Good Day! How much does little Goose weigh today?" 
read puppyweight
TIMENOW = date +%s 

echo "Nice Goose weighs $puppyweight lbs! He's growing up so fast"

curl -X POST "https://api.datadoghq.com/api/v2/series" \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-d @- << EOF
{
  "series": [
    {
      "metric": "testpuppyweight",
      "type": 3,
      "points": [
        {
          "timestamp": ${TIMENOW}
          "value": ${puppyweight}
        }
      ],
    }
  ]
}
EOF
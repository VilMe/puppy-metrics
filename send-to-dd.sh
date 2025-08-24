#!/bin/zsh 
# enter puppyweight in terminal 
# using the Datadog API https://docs.datadoghq.com/api/latest/metrics/#submit-metrics 

echo "Good Day! How much does little Goose weigh today?" 
read puppyweight
date +%s 

echo "Nice Goose weighs $puppyweight lbs! He's growing up so fast"
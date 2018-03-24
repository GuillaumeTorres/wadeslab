service_number=$( docker ps -q | wc -l )
if [ "$service_number" != "4" ]
then
    echo "a container has unexpectedly shutdown"
    exit 1
fi
for url in {jenkins.,,www.,status.}wadeslab.tk
do
    response=$( curl -k -s -o /dev/null -w "%{http_code}" https://$url )

    if [ "$response" != "200" ]
    then
        if [ "$url" = "jenkins.wadeslab.tk" ]
        then
            if [ "$response" = "403" ]
            then
                continue
            fi
        fi
        echo "a service is not yet accessible"
        exit 1
    fi
done 

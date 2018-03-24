for url in {jenkins.,,www.,test.}wadeslab.tk
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
        exit 1
    fi
done 

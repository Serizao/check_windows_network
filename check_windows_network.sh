 #!/bin/bash
 #definition des variables
 
critical='110000000'
warning='1000000'
adaptateur1='\interface réseau(hp nc326i pcie dual port gigabit server adapter _2)\octets reçus/s'
port='12489'
adaptateur2='\interface réseau(hp nc326i pcie dual port gigabit server adapter _2)\octets envoyés/s'
host='IP_DE VOTRE_SERVER'
mdp='MOT_DE_PASSE'
# execution de check nt avec les paramètre ci dessus pour récupérer les octet envoyés et reçus le tout stocké dans les variable $result1 et $result2
/usr/lib/nagios/plugins/check_nt -H $host -s $mdp -p $port -v COUNTER -l "$adaptateur1" -c $critical -w $warning > sertriskem.tmp
read result1 < result.tmp
/usr/lib/nagios/plugins/check_nt -H $host -s $mdp -p $port -v COUNTER -l "$adaptateur2" -c $critical -w $warning > sertriskem.tmp
read result2 < result.tmp

# verification par rapport aux varibles $warning et $critical
if ([ $result1 -lt  $critical ] && [ $result1 -gt $warning ]) || ([ $result2 -lt  $critical ] && [ $result2 -gt $warning ]); then
  echo "Network WARNING - $result2 octets envoyés/s et $result1 octet reçus/s |bytes_in=$result1  bytes_out=$result2"
fi

if ([ $result1 -gt $warning ]  && [ $result1 -gt $critical ]) || ([ $result2 -gt $warning ]  && [ $result2 -gt $critical ]); then
  echo "Network CRITICAL - $result2 octets envoyés/s et $result1 octet reçus/s  |bytes_in=$result1  bytes_out=$result2"
fi

if [ $result1 -lt $warning ] && [ $result1 -lt $critical ] && [ $result2 -lt $warning ] && [ $result2 -lt $critical ]; then
  echo "Network OK - $result2 octets envoyés/s et $result1 octet reçus/s   |bytes_in=$result1 bytes_out=$result2"
fi


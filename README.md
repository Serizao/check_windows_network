# check_windows_network
Ce programme permet de monitorer et de faire un graphique de l'utilisation d'une interface réseau d'un Windows disposant du SNMP configuré. Le programme et fait pour un windows français. 

Si Windows est dans une autre langue que le français, changez les variables $interface1 et $interface2 pour que cela corresponde à la langue voulue. Vous pouvez vous aider avec get-counter dans PowerShell sur le Windows en question cela vous donnera des indications. Attention cette commande retournera des résultats sous ce format :

\\le_nom_du_serveur\interface réseau( .....)

dans les variables $interface1 et $interface2 il faut enlever le \\le_nom_du_serveur

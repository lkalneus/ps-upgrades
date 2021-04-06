#!/usr/bin/env bash
echo '
 ######                                                                                         ###
 #     # #    #  ####  #    #    ##### #    # ######    #####  #    # ##### #####  ####  #    # ###
 #     # #    # #      #    #      #   #    # #         #    # #    #   #     #   #    # ##   # ###
 ######  #    #  ####  ######      #   ###### #####     #####  #    #   #     #   #    # # #  #  #
 #       #    #      # #    #      #   #    # #         #    # #    #   #     #   #    # #  # #
 #       #    # #    # #    #      #   #    # #         #    # #    #   #     #   #    # #   ## ###
 #        ####   ####  #    #      #   #    # ######    #####   ####    #     #    ####  #    # ###
 '

if [ "$1" = "update" ]; then
   java -Djava.security.egd=file:/dev/./urandom -Dcorda.dataSourceProperties.dataSource.url="jdbc:h2:file:"/opt/corda/persistence"/persistence;DB_CLOSE_ON_EXIT=FALSE;WRITE_DELAY=0;LOCK_TIMEOUT=10000" -jar /opt/corda/bin/corda.jar --base-directory /opt/corda run-migration-scripts --app-schemas --core-schemas --config-file /etc/corda/node.conf
   java -Djava.security.egd=file:/dev/./urandom -Dcorda.dataSourceProperties.dataSource.url="jdbc:h2:file:"/opt/corda/persistence"/persistence;DB_CLOSE_ON_EXIT=FALSE;WRITE_DELAY=0;LOCK_TIMEOUT=10000" -jar /opt/corda/bin/corda.jar --base-directory /opt/corda --config-file /etc/corda/node.conf
else
  java -Djava.security.egd=file:/dev/./urandom  -Dcorda.dataSourceProperties.dataSource.url="jdbc:h2:file:"/opt/corda/persistence"/persistence;DB_CLOSE_ON_EXIT=FALSE;WRITE_DELAY=0;LOCK_TIMEOUT=10000" -jar /opt/corda/bin/corda.jar --base-directory /opt/corda --config-file /etc/corda/node.conf
fi

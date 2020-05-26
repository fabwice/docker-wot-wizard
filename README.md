# WotWizard

You can find the executables here:
	https://github.com/duniter/WotWizard/releases


The version of the associated Duniter node must be 1.7.17 at least.

All included softwares have a GPLv3 license, excepted the BlackBox system which has a FreeBSD license (compatible with GPL).

======

###### docker-compose.yml

```
version: '3'

services:
  duniter:
    image: fabwice/docker-duniter-ts:latest
    restart: unless-stopped
    hostname: duniter.fabwice.com
    ports:
      - 127.0.0.1:9220:9220
      - 127.0.0.1:10901:10901
      - 127.0.0.1:20901:20901
    networks:
      duniter:
        ipv4_address: 175.28.1.1
    volumes:
      - '/home/duniter/scr:/var/lib/duniter'      
  wot-wizard:
    image: fabwice/docker-wot-wizard:latest
    restart: unless-stopped
    hostname: wot-wizard.fabwice.com
    ports:
      - 127.0.0.1:9222:9222
    networks:
      duniter:
        ipv4_address: 175.28.1.2
    volumes:
      - '/home/duniter/scr:/var/lib/duniter'
networks:
  duniter:
    ipam:
      driver: default
      config:
         -  subnet: 175.28.0.0/16
```

======

###### Voir les logs 
```
docker exec -it duniter_wot-wizard_1 tail -f /etc/wotWizard/rsrc/duniter/log.txt
docker exec -it duniter_wot-wizard_1 echo {WotWizardListPerm} > tt.json
```

======

###### En résumé :

```

There are two parts in WotWizard: first a server (wwServer), written in Go (v1.12.5) and which communicates through files containing, on input, GraphQL requests, and on output, JSON answers; second a graphical user interface (WotWizard.exe) written in Component Pascal (BlackBox v1.7.1 under Windows or Wine), which generates GraphQL requests through menus and interactive windows, and display answers with texts or graphics.
This program needs that a Duniter node runs on the same computer.
The version of the associated Duniter node must be 1.7.17 at least.

Les requêtes GraphQL disponibles sont :

{WWServerStart}: Install a subscription to the update of the WotWizard window. Do nothing if the subscription is already installed.

{WWServerStop}: Erase the subscription to the update of the WotWizard window. Do nothing if the subscription is not already installed.

{WotWizardListFile}: Display the WotWizard file.

{WotWizardListPerm}: Display the list of WotWizard permutations.

{IdSearchFind(Hint:"< hint >"){<set of (OldMembers, Members, FutureMembers)>}}: Display the list of identities whose pseudos or public keys begin with < hint > and whose status is old member, active member or newcomer, according to the given set; the list includes pseudos, hashes and status.

{IdSearchFix(Hash:"< hash >"){<set of (Distance, Quality, Centrality)>}}: Display informations for the identity corresponding to < hash > and including, or not, her distance to the wot, her quality and her degree of centrality according to the given set.

{History(Uid:"< uid >")}: Display the history of a member or an old member.

{Parameters}: Display the block 0 parameters of the money.

{IdentitiesRevoked}: Display the list of revoked identities.

{IdentitiesMissing}: Display the list of excluded, but not yet revoked, identities.

{IdentitiesMembers}: Display the list of active identities.

{CertificationsFrom}: Display the list of active certifications, grouped by senders.

{CertificationsTo}: Display the list of active certifications, grouped by receivers.

{Sentries}: Display the list of sentries.

{Sandbox}: Display the content of the sandbox, with different sortings.

{QualitiesDist}: Display the distances to the wot of all active members.

{QualitiesQual}: Display the qualities of all active members.

{CentralitiesAll}: Display the degrees of centrality of all active members.

{MemEnds}: Display the ends of validity of memberships for all active members, sorted by dates.

{MissEnds}: Display the dates of revocation of all excluded, but not yet revoked, identities, sorted by dates.

{CertEnds}: Display the dates of loss of the fifth received certification for all active or excluded, but not revoked, identities.

{MembersCountAll}: Display the number of active members, sorted by dates of events (in or out the wot).

{MembersCountFluxAll(timeUnit:<time unit (s)>)}: Display the flux of active members by < time unit >.

{MembersCountFluxPMAll(timeUnit:<time unit (s)>)}:Display the flux of active members by < time unit > and by member.

{MembersFirstEntryAll}: Display the number of first entries into the wot, sorted by dates of events (entries).

{MembersFEFluxAll(timeUnit:<time unit (s)>)}: Display the flux of first entries by < time unit >.

{MembersFEFluxPMAll(timeUnit:<time unit (s)>)}: Display the flux of first entries by < time unit > and by member.

{MembersLossAll}: Display the number of members exiting the wot, minus the number of reentries (losses), sorted by dates of events (in or out the wot).

{MembersLossFluxAll(timeUnit:<time unit (s)>)}: Display the flux of losses by < time unit >.

{MembersLossFluxPMAll(timeUnit:<time unit (s)>)}: Display the flux of losses by < time unit > and by member.

```


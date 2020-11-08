# humanoid-raw
In this repo is stored all of the material found, created and suggested for our Humanoid ABB IRB120 Project.

Every README file provide informations about the folder contents. 

------------
## Msg di suggerimento da Michele Piffari
Allora l'approccio che mi viene da consigliarvi (nonchè quello che ho seguito nella mia tesi) è quello di utilizzare ROS.
Tramite il controllore del manipolatore (IRC5 Compact) si va a creare una sorta di server che espone una socket
per ricevere i comandi dal mondo esterno: per questa fase è necessario utilizzare il software proprietario di ABB (che è 
Robotstudio). Io e Yamuna avevamo trovato un progetto che strutturava già il codice in RobotStudio in linguaggio RAPID.

Una volta caricato il codice sul controllore del manipolatore, su una macchina Ubuntu tramite la struttura publish-subscriber tipica di ROS,
vai a comunicare sulla socket che il controllore del manipolatore crea, potendo quindi leggere e inviare dati relativi alla posizione e all'orientamento 
del manipolatore stesso.

 
Ti allego la mia tesi: non sarà precisissima e conterrà magari qualche errore/strafalcione (ero ancora un baldo giovane),
però penso possa essere d'aiuto per la parte di comunicazione IRC5 Compact/ROS.


Sinceramente non so se ci sono delle modalità dirette, tipo collegare direttamente l'eventuale Arduino/Raspberry
al controllore IRC5 e struttura direttamente il codice in RobotStudio: magari, negli ultimi anni, hanno aggiunto
alcune nuove funzionalità per rendere questo possibile.


Resto a disposizione,
Michele
m.piffari@studenti.unibg.it

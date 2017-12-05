# ocp
<h2 title="inicio">Manual de Instalaci&oacute;n de OpenShift Container Platform 3.6"</h2>

<h2 title="planning">Planning</h2>
<p>La arquitectura a instalar ser&aacute;n tres VM:</p>

<p>Un master que contendrá el etcd, que ade&aacute;ms ser&acute; servidor NFS para almacenamiento de registry, metrics y logging y que servir&aacute; de Bastion para la instalaci&oacute;n</p>
<p>Dos nodos que har&aacute;n las veces de infra y c&oacute;mputo.</p>

<h2 title="requirement">Requirement</h2>
<p>Las tres m&aacute;quinas deben tener instalado RHEL 7.4 y contar con un disco adicional para el docker-storage. Adicional, el master deberátener un tercer disco para configuraci&oacute;n del NFS</p>
<p>Debe contarse con un wildcard o en su defecto tendr&aacute; que editarse el archivo /etc/hosts de la m&aacute;quina anfitri&oacute;n.</p>
 
<h2 title="host-preparation">Host Preparation</h2>

<h2 title="installation">Installation</h2>

<h2 title="test-enviroement">Test Enviroment</h2>


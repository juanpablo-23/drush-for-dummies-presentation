#!/bin/bash

# Directorio donde se guardara el sitio.
#http_dir="/var/www"
root_dir="drupal-site"

# Nombre del sitio.
site_name="Drupal Site"

# Configuración de la base de datos.
db_host="localhost"
db_name="drupal_db"
db_user="root"
db_password="root"

# Configuración del administrador del sitio.
admin_user_name="admin"
admin_password="123"
admin_email="admin@example.com"

# Descargar el core de Drupal y renombrarlo.
drush dl -y --drupal-project-rename=$root_dir;

# Cambiarnos al directorio que descargamos y renombramos.
cd $root_dir;

drush site-install -y standard --db-url=mysql://$db_user:$db_password@localhost/db_name --site-name=$site_name --account-name=$admin_user_name --account-pass=$admin_password;

# Descargar modulos y temas.
drush -y dl ctools;
drush -y dl views;
drush -y dl ds;
drush -y dl admin_menu;
drush -y dl entity;
drush -y dl eck;
drush -y dl backup_migrate;
drush -y dl pathauto;
drush -y dl webform;
drush -y dl zen;

# Deshabilitar modulos del core.
drush -y dis overlay;
drush -y dis toolbar;

# Habilitar modulos.
drush -y en ctools;
drush -y en views;
drush -y en ds;
drush -y en admin_menu;
drush -y en entity;
drush -y en eck;
drush -y en backup_migrate;
drush -y en pathauto;
drush -y en webform;
drush -y en zen;

# Preconfigurar settings.
# Habilitar tema zen por default.
drush vset theme_default zen;

# Instalación completa.
echo -e "-------------------------------------"
echo -e "                                     "
echo -e "                                     "
echo -e "---    Instalación completa     ---- "
echo -e "                                     "
echo -e "                                     "
echo -e "-------------------------------------"
echo -e "                                     "
echo -e "                                     "
while true; do
    read -p "Presione enter para continuar" yn
    case $yn in
        * ) exit;;
    esac
done

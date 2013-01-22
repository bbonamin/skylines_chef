execute "keep system up to date" do
  command "sudo apt-get update && sudo apt-get upgrade && touch tmp/system_updated_by_chef"
  creates 'tmp/system_updated_by_chef'
end

%w(libxml2-dev libxslt1-dev python-dev python-setuptools postgresql 
  postgresql-9.1-postgis postgresql-contrib-9.1 postgresql-server-dev-9.1 
  g++ git libsdl1.2-dev libsdl-image1.2-dev libsdl-ttf2.0-dev libboost-system-dev 
  make curl libcurl4-openssl-dev python-mapscript python-gdal).each do |pkg|
  package pkg
end

execute "setup python dependencies" do
  cwd "/vagrant"
  command "sudo python setup.py develop"
end

#-- sudo apt-get update && sudo apt-get upgrade
#-- sudo apt-get install libxml2-dev libxslt1-dev python-dev python-setuptools postgresql postgresql-9.1-postgis postgresql-contrib-9.1 postgresql-server-dev-9.1 g++
#-- cd into project folder and sudo python setup.py develop
#-- sudo apt-get install libsdl1.2-dev libsdl-image1.2-dev libsdl-ttf2.0-dev libboost-system-dev make curl libcurl4-openssl-dev python-mapscript python-gdal
# sudo su root
# su - postgres
# createuser vagrant
# createdb skylines --o vagrant
# createlang plpgsql -d skylines
# psql -d skylines -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
# psql -d skylines -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql
# psql skylines
# grant all on geometry_columns to vagrant;
# grant select on spatial_ref_sys to vagrant;
# create extension fuzzystrmatch;
# \q
# exit && exit and cd to project folder
# sudo easy_install tg.devtools
# sudo apt-get install
# paster setup-app development.ini
# python import_airspaces.py development.ini assets/airspace/airspace_list.txt assets/airspace/airspace_blacklist.txt
# sudo ufw disable
# paster serve development.ini
# execute "keep system up to date" do
#   command "sudo apt-get update && sudo apt-get upgrade -y && touch tmp/system_updated_by_chef"
#   creates 'tmp/system_updated_by_chef'
# end

%w(libxml2-dev libxslt1-dev python-dev python-setuptools postgresql 
  postgresql-9.1-postgis postgresql-contrib-9.1 postgresql-server-dev-9.1 
  g++ git libsdl1.2-dev libsdl-image1.2-dev libsdl-ttf2.0-dev libboost-system-dev 
  make curl libcurl4-openssl-dev python-mapscript python-gdal).each do |pkg|
  package pkg
end

# execute "setup python dependencies" do
#   cwd "/vagrant"
#   command "sudo python setup.py develop"
# end

# execute "setup database prerequisites" do
#   user "postgres"
#   command "createuser vagrant && createdb skylines --o vagrant && createlang plpgsql -d skylines"
# end

# execute "setup postgis" do
#   user "postgres"
#   command "psql -d skylines -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql"
# end

# execute "setup spatial reference system" do
#   user "postgres"
#   command "psql -d skylines -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql"
# end

# PENDING
# execute "setup psql grants" do
#   warn 'pending'
#   # grant all on geometry_columns to vagrant;
#   # grant select on spatial_ref_sys to vagrant;
#   # create extension fuzzystrmatch;
#   # \q
# end

# execute "tg.devtools installation" do
#   cwd "/vagrant"
#   command "sudo easy_install tg.devtools"
# end

# execute "setup app development env" do
#   cwd "/vagrant"
#   command "paster setup-app development.ini"
# end

# execute "import assets" do 
#   cwd "/vagrant"
#   command "python import_airspaces.py development.ini assets/airspace/airspace_list.txt assets/airspace/airspace_blacklist.txt"
# end

# service "ufw" do
#   action :disable
# end

# paster serve development.ini
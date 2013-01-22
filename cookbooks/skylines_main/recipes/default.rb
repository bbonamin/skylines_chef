%w(libxml2-dev libxslt1-dev python-dev python-setuptools postgresql 
  postgresql-9.1-postgis postgresql-contrib-9.1 postgresql-server-dev-9.1 
  g++ git libsdl1.2-dev libsdl-image1.2-dev libsdl-ttf2.0-dev libboost-system-dev 
  make curl libcurl4-openssl-dev python-mapscript python-gdal).each do |pkg|
  package pkg
end
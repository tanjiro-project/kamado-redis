if [ ! -d "redis-stable" ]; then
    wget http://download.redis.io/redis-stable.tar.gz
    tar xvzf redis-stable.tar.gz
    rm -rf redis-stable.tar.gz
else 
    cd redis-stable
    if [ -e "src/redis-server" ]; then
         src/redis-server --requirepass "$REDIS_AUTH"
    else 
         make distclean
         make
         src/redis-server --requirepass "$REDIS_AUTH"
    fi
fi

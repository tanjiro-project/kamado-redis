if [ ! -n "$PORT" ] 
   then PORT=3000
fi;

if [ ! -d "redis-stable" ]; then
    wget http://download.redis.io/redis-stable.tar.gz
    tar xvzf redis-stable.tar.gz
    rm -rf redis-stable.tar.gz
    if [ -e "src/redis-server" ]; then
         src/redis-server --port "$PORT" --requirepass "$REDIS_AUTH"
    else 
         make distclean
         make
         src/redis-server --port "$PORT" --requirepass "$REDIS_AUTH"
    fi
else 
    cd redis-stable
    if [ -e "src/redis-server" ]; then
         src/redis-server --port "$PORT" --requirepass "$REDIS_AUTH"
    else 
         make distclean
         make
         src/redis-server --port "$PORT" --requirepass "$REDIS_AUTH"
    fi
fi

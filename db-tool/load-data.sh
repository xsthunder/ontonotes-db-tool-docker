set -e
test_file=/db/onto_py_init

if ! test -s $test_file
then
    cd /tool
    python setup.py install
    cd ./src
    python on/tools/init_db.py --init $my_db $my_server $my_name /data
    python on/tools/init_db.py --frames=english $my_db $my_server $my_name /data
    python on/tools/init_db.py --sense-inventories=english $my_db $my_server $my_name /data
    echo "yes " >$test_file
else
    echo "skip initializing data schema"
fi

# keep container running
tail -f /dev/null

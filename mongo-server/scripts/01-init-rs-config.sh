rs.initiate({
    _id: "rs-config", 
    configsvr: true, 
    version: 1, 
    members: 
    [ 
        { _id: 0, host : 'mongoc-01:27017' }, 
        { _id: 1, host : 'mongoc-02:27017' }, 
        { _id: 2, host : 'mongoc-03:27017' } 
    ] 
})

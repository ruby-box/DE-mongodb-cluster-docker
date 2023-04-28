rs.initiate({
    _id: "sh1", 
    version: 1, 
    members: 
    [ 
        { _id: 0, host : "mongod-01:27017" }, 
        { _id: 1, host : "mongod-02:27017" }, 
        { _id: 2, host : "mongod-03:27017" }, 
    ] 
})

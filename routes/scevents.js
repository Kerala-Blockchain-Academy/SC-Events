var express = require('express');
var router = express.Router();
router.get('/',function(req,res,next){
    MyContract.getPastEvents('allEvents', {
        fromBlock: 0,
        toBlock:'latest',
        filter:{issuerAddress: '0xCbDb9d14a5e74E95a528EdcfCF115Ad980C99aDA'}
    },function(error,event){
        console.log(event);
        res.send(event)});
    });
    
module.exports=router;
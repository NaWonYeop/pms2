pragma solidity ^0.4.19;

contract rewardFnc{

    //기본 구입 및 송금 시 사용할 구조체
    struct myStruct {
            
            //판매자 계정
            address getAc;
            //개개인 출금
            uint amount;
            
            mapping(address => uint) pendingReturns;
    }

    mapping(uint => myStruct) public myMap;

 
    //구매
    function buyAry(uint _cId, address _getAc) public payable{

        if( myMap[_cId].getAc == 0x0000000000000000000000000000000000000000){
            // _cId 고유값 판매자아이디 + yyyymmdd
            myMap[_cId] = myStruct( _getAc, 0);  
        }
        
        myMap[_cId].pendingReturns[msg.sender] +=  msg.value;
       
        myMap[_cId].amount += msg.value;

    }

    //환불
    function refund(uint _cId) public {

        msg.sender.transfer(myMap[_cId].pendingReturns[msg.sender]);

        myMap[_cId].amount -= myMap[_cId].pendingReturns[msg.sender];
    }

    //하루하루정산
    function EndAry(uint _cId) public {

          myMap[_cId].getAc.transfer(myMap[_cId].amount);
         
    }

}
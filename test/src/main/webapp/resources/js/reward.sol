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

          myMap[_cId].amount -= myMap[_cId].pendingReturns[msg.sender];
         
    }

}





   // //하루하루 생성 판매자 별로 생성
    // function insertBuyAry(uint _cId, address getAc ) public {
    //     // _cId 고유값 판매자아이디 + yyyymmdd
    //     myMap[_cId] = myStruct( getAc, 0);

    // }








// contract rewardFnc{

//  //   event buyCoin(uint cId, uint rId, address setAc, address getAc, uint date, uint coin, uint state, bool weekChk);  

//     //기본 구입 및 송금 시 사용할 구조체
//     struct myStruct {
//             //리워드 아이디
//             uint rId;
//             //결제 계정
//             address setAc;
//             //송금 계정
//             address getAc;
//             //거래일 ~ 7일후 자동송금 해보자
//             uint date;
//             //거래이더
//             uint coin;

//             //1주일뒤 판매자 송금 여부확인
//             bool weekChk;
//     }



//     uint amount;

//     uint cId=1;

//     mappint(uint )

//     mapping(uint => myStruct) public myMap;
//    // mapping(uint => uint) public dayAmount;

//     function _buyRewardAry(uint _rId, address _getAc ) public payable {
       

//         uint sysdate = now;



//         myMap[cId] = myStruct(_rId, msg.sender , _getAc, sysdate, msg.value , false);
        
//         cId += 1;

//         amount += msg.value;

//         //저금
//     }

   


    
//      function buyReward(uint _cId) public {
//           myMap[_cId].getAc.transfer( myMap[_cId].coin);
         
//          }

// }





















 //NFT 볼때는 필요
    // function search(uint _cId) view private returns (myStruct) {   
    //     return  myMap[_cId];
    // }
    // function viewMap(uint _cId) view public{
    //     search(_cId);     
    // }







    // 하룻동안 들어온 리워드 모아주는 곳
   
    //날짜 배열로 값 오늘 들어온 이더 저장할것
    //취소할 경우도 생각할것 

    // 7일후 후 리워드 보내줄 곳

    // 보내준 후 결제 취소시 어떻게 할까?

    // 수익은?



//원래 순서
// 리워드 구매 
// 구매자가
// 기록
// 구매주소, 판매자주소, 구매일시, 리워드아이디, 금액 
// dapp 저장

// 매핑 
// 일시


    //getAC(      (ridDATE, amount)        )
   

//  1. 누구한테갈지 getAc = rId + rId + ....
//  2. 언제갈지 sysdate + 7 day
//  3. 얼마갈지 -amount += coin
//  4. 거래코드  - cId

//     {amount, getAc, sysdate, myMap}

//(getAc+sysdate)

    // //하루동안 들어온 금액 
    // struct setCoin{
    //     //들어온날
    //     uint dateEnd;
    //     //보낼금액
    //     uint amount; 
    // }



      // function buyReward(uint _rid, address _setAc, address _getAc, uint _coin, bool _weekChk) public {
        
       
    //     require(_coin <= _setAc.balance, "잔액부족.");

    //     uint = msg.value();
        
    //     bool sent = msg.value();

    //     amount += _coin;

    //     require(sent, "결제안됨");
    // }

    //결제
    // function weeksend(address getAc, uint coin) public{
    //    //결제
        
    //    // msg.sender = getAc;

    //     require(coin <= msg.sender.balance, "잔액부족.");
    //   //balances[msg.sender] -= coin;
    //   //balances[getAc] += coin;      

    //     bool sent = getAc.send(coin);
        
    //     require(sent, "결제안됨");
    // }

    // function weeksendbalance(address getAc) public returns(uint) {
    //     uint balancne;
    //     if(getAc.balance > 0 ){
    //     balancne = getAc.balance;
    //     } else {
    //         balancne = 0;
    //     }
        
    //    return balancne; 

    // }

 
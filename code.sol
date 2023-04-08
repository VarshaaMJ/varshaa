//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
pragma experimental ABIEncoderV2;

contract studentSona{
    uint public count=0;
    struct StudentDetails{
        string name;
        uint256 reg;
        string Dept;
        string yoa;

        string tc; //transfer certificate
        string cc;  // certificate
        string pc;  //provisional certificate
    }
    struct semester{
        uint256 reg;
        uint256 semno;
        string hash;
    }
    function insertStudent(uint256 _reg, string memory _name , string memory _Dept , string memory _yoa) public{
        if((check_empty(_name,_Dept,_yoa))==true){
            incrementCount();
            students[_reg] = StudentDetails(_name,_reg,_Dept,_yoa,'Yet to upload','Yet to upload','Yet to upload');
        }
    }
    function view_cc (uint256 _reg) public view returns(string memory){
        StudentDetails memory s = students[_reg];
        if(s.reg == _reg){
            return (s.cc);
        }  
    }    
    function view_tc (uint256 _reg) public view returns(string memory){
        if(s.reg == _reg){
            return (s.tc);
        }  
    }    
    function view_pc (uint256 _reg) public view returns(string memory){
        if(s.reg == _reg){
            return (s.pc);
        }  
    }    
    function check_empty(string memory _name , string memory _Dept , string memory _yoa) internal pure returns(bool){
        bytes memory l2 = bytes(_name);
        bytes memory l3 = bytes(_Dept);
        bytes memory l4 = bytes(_yoa);
        if((l2.length!=0) && (l3.length!=0) && (l4.length!=0))
        {
            return true;
        }
    }
    function incrementCount() internal{
        count+=1;
    }
    function getDetails(uint256 reg) public view returns(string memory,uint256,string memory,string memory,string memory,string memory,string memory){
        StudentDetails memory s = students[reg];
        return (s.name,s.reg,s.Dept,s.yoa,s.tc,s.pc,s.cc);
    }
}
    function isEqual(string memory _a,string memory _hash)pure returns(bool) {
        if (keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_hash))) {
            return true;
        }
    }

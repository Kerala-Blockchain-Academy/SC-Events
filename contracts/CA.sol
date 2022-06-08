// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;

contract certi {
    
  address admin;
  
  constructor() {
    admin = msg.sender;    
  }
  
  modifier onlyAdmin {
      require(msg.sender == admin, "Insuficient privilage");
      _;
  }
  
  event newCertificateAdded(string,string,string,string,string);
  event newCertificateAddedBy(address indexed issuerAddress, string certificateID);

  struct certificate {
      string courseName;
      string candidateName;
      string grade;
      string date;
  }
  
  mapping (string => certificate) public certificateDetails;
  
  function newCertificate (
      string memory _certificateID,
      string memory _courseName,
      string memory _candidateName,
      string memory _grade,
      string memory _date ) public  {
          certificateDetails[_certificateID] = certificate(
                                                    _courseName,
                                                    _candidateName,
                                                    _grade,
                                                    _date);
          emit newCertificateAdded(_certificateID, _courseName,_candidateName,_grade,_date);
          emit newCertificateAddedBy(msg.sender, _certificateID);
      }
}
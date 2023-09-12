// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonationCampaign {
    struct Donation {
        address donor;
        string fullName;
        uint256 donationAmount;
        string organization;
        string message;
    }

    Donation[] public donations;

    event DonationReceived(
        address indexed donor,
        string fullName,
        uint256 donationAmount,
        string organization,
        string message
    );

    function donate(
        string memory _fullName,
        uint256 _donationAmount,
        string memory _organization,
        string memory _message
    ) public {
        require(_donationAmount > 0, "Donation amount must be greater than 0");
        donations.push(
            Donation(
                msg.sender,
                _fullName,
                _donationAmount,
                _organization,
                _message
            )
        );
        emit DonationReceived(
            msg.sender,
            _fullName,
            _donationAmount,
            _organization,
            _message
        );
    }

    function getTotalDonations() public view returns (uint256) {
        uint256 totalDonations = 0;
        for (uint256 i = 0; i < donations.length; i++) {
            totalDonations += donations[i].donationAmount;
        }
        return totalDonations;
    }
}

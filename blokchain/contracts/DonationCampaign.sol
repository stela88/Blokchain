// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonationCampaign {
    struct Donation {
        address donor;
        string fullName;
        uint256 donationAmount;
        address organizationAddress;
        string message;
    }

    address public udruga1Address = 0x1Fc78A4113F50034Bd4C179993cBC70DC8EF45FB;
    address public udruga2Address = 0x37f05EFd4B303642886a4bB3F16C1816E2B2DC63;
    address public udruga3Address = 0xc6E40510b71806dbf957d154dCF7617A3C584D3e;
    address public udruga4Address = 0x1D8565320289E1a257c7F8dC42e94a1Bf08b4475;
    address public udruga5Address = 0x24805813DDB39ae1154aFe8Fae71F1816E6c74cC;

    Donation[] public donations;

    event DonationReceived(
        address indexed donor,
        string fullName,
        uint256 donationAmount,
        address organizationAddress,
        string message
    );

    address public owner;

    constructor() {
        owner = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    }

    function donate(
        string memory _fullName,
        uint8 _organizationIndex,
        string memory _message
    ) public payable {
        require(msg.value > 0, "Donation amount must be greater than 0");
        require(
            _organizationIndex >= 1 && _organizationIndex <= 5,
            "Invalid organization index"
        );

        address payable selectedOrganization;

        if (_organizationIndex == 1) {
            selectedOrganization = payable(udruga1Address);
        } else if (_organizationIndex == 2) {
            selectedOrganization = payable(udruga2Address);
        } else if (_organizationIndex == 3) {
            selectedOrganization = payable(udruga3Address);
        } else if (_organizationIndex == 4) {
            selectedOrganization = payable(udruga4Address);
        } else if (_organizationIndex == 5) {
            selectedOrganization = payable(udruga5Address);
        }

        require(
            selectedOrganization != address(0),
            "Organization address not set"
        );

        selectedOrganization.transfer(msg.value);

        donations.push(
            Donation(
                msg.sender,
                _fullName,
                msg.value,
                selectedOrganization,
                _message
            )
        );

        emit DonationReceived(
            msg.sender,
            _fullName,
            msg.value,
            selectedOrganization,
            _message
        );
    }

    function sendEthToOrganization(uint8 _organizationIndex) public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        require(
            _organizationIndex >= 1 && _organizationIndex <= 5,
            "Invalid organization index"
        );

        address payable selectedOrganization;

        if (_organizationIndex == 1) {
            selectedOrganization = payable(udruga1Address);
        } else if (_organizationIndex == 2) {
            selectedOrganization = payable(udruga2Address);
        } else if (_organizationIndex == 3) {
            selectedOrganization = payable(udruga3Address);
        } else if (_organizationIndex == 4) {
            selectedOrganization = payable(udruga4Address);
        } else if (_organizationIndex == 5) {
            selectedOrganization = payable(udruga5Address);
        }

        require(
            selectedOrganization != address(0),
            "Organization address not set"
        );

        selectedOrganization.transfer(msg.value);
    }

    function getTotalDonations() public view returns (uint256) {
        uint256 totalDonations = 0;
        for (uint256 i = 0; i < donations.length; i++) {
            totalDonations += donations[i].donationAmount;
        }
        return totalDonations;
    }
}

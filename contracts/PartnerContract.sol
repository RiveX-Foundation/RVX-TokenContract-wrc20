pragma solidity ^ 0.4.24;

library SafeMath {
    /**
     * @dev Multiplies two numbers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns(uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
     * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns(uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns(uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two numbers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns(uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
     * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns(uint256) {
        require(b != 0);
        return a % b;
    }
}
/**
 * @title ERC20
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {

    uint256 public totalSupply;

    function balanceOf(address who) public view returns(uint256);

    function transfer(address to, uint256 value) public returns(bool);

    function allowance(address owner, address spender) public view returns(uint256);

    function transferFrom(address from, address to, uint256 value) public returns(bool);

    function approve(address spender, uint256 value) public returns(bool);

    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract PartnerContract {
    using SafeMath
    for uint256;

    address public creator;
    address public owner;
    uint256[] public unlockDates;
    uint256 public createdAt;
    string public contractName;
    uint public counter = 0;
    uint256 public amountToRelease = 25000000 ether;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier onlyCreator {
        require(msg.sender == creator);
        _;
    }
    
    constructor(
        address _creator,
        address _owner,
        uint256[] _unlockDate,
        string _contractName
    ) public payable {
        creator = _creator;
        owner = _owner;
        unlockDates = _unlockDate;
        createdAt = now;
        contractName = _contractName;
    }

    // keep all the ether sent to this address
    function() payable public {
        emit Received(msg.sender, msg.value);
    }
    
    function changeBeneficiary(address _address) onlyCreator public {
        owner = _address;
        
    }

    // callable by owner only, after specified time
    function withdraw() onlyOwner public {
        require(now >= unlockDates[counter]);
        msg.sender.transfer(address(this).balance);
        counter++;
        emit Withdrew(msg.sender, address(this).balance);

    }

    function emergencyToken(address _tokenContract) onlyCreator public {

        ERC20 token = ERC20(_tokenContract);
        uint256 tokenBalance = token.balanceOf(this);
        token.transfer(creator, tokenBalance);
        emit WithdrewTokens(_tokenContract, msg.sender, tokenBalance);
    }

    function emergency() onlyCreator public {

        msg.sender.transfer(address(this).balance);
        emit Withdrew(msg.sender, address(this).balance);
    }

    // callable by owner only, after specified time, only for Tokens implementing ERC20
    function withdrawTokens(address _tokenContract) onlyCreator public {
        require(now >= unlockDates[counter]);
        ERC20 token = ERC20(_tokenContract);
        token.transfer(owner, amountToRelease);
        counter++;
        emit WithdrewTokens(_tokenContract, msg.sender, amountToRelease);
    }

    function info() public view returns(address, address, uint256[], uint256, uint256) {
        return (creator, owner, unlockDates, createdAt, address(this).balance);
    }

    event Received(address from, uint256 amount);
    event Withdrew(address to, uint256 amount);
    event WithdrewTokens(address tokenContract, address to, uint256 amount);
}
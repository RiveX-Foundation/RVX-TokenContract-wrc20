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

contract PrivateSaleContract {
    using SafeMath
    for uint256;

    address public creator;
    address public owner;
    uint256[] public unlockDates;
    uint256 public createdAt;
    string public contractName;
    address public walletOne;
    address public walletTwo;
    address public walletThree;
    address public walletFour;
    address public walletFive;
    address public walletSix;

    uint256 public firstOne = 5066666 ether;
    uint256 public firstTwo = 22705533 ether;
    uint256 public firstThree = 250000 ether;
    uint256 public firstFour = 250000 ether;
    uint256 public firstFive = 1000000 ether;
    uint256 public firstSix = 8227800 ether;

    uint256 public secondOne = 3040000 ether;
    uint256 public secondTwo = 13623320 ether;
    uint256 public secondThree = 150000 ether;
    uint256 public secondFour = 150000 ether;
    uint256 public secondFive = 600000 ether;
    uint256 public secondSix = 4936680 ether;

    uint public counterOne = 0;
    uint public counterTwo = 0;
    uint public counterThree = 0;
    uint public counterFour = 0;
    uint public counterFive = 0;
    uint public counterSix = 0;




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

    function setWallets(address _walletone, address _wallettwo, address _walletthree, address _walletfour, address _walletfive, address _walletsix) onlyCreator {

        walletOne = _walletone;
        walletTwo = _wallettwo;
        walletThree = _walletthree;
        walletFour = _walletfour;
        walletFive = _walletfive;
        walletSix = _walletsix;

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
    function withdrawTokensWalletOne(address _tokenContract) onlyCreator  public {
        require(now >= unlockDates[counterOne]);
        ERC20 token = ERC20(_tokenContract);
        if (counterOne >= 1) {
            token.transfer(walletOne, secondOne);
            counterOne++;
            emit WithdrewTokens(_tokenContract, msg.sender, secondOne);
        } else {
            token.transfer(walletOne, firstOne);
            counterOne++;
            emit WithdrewTokens(_tokenContract, msg.sender, firstOne);
        }

    }

    function withdrawTokensWalletTwo(address _tokenContract) onlyOwner onlyCreator public {
        require(now >= unlockDates[counterTwo]);
        ERC20 token = ERC20(_tokenContract);
        if (counterTwo >= 1) {
            token.transfer(walletTwo, secondTwo);
            counterTwo++;
            emit WithdrewTokens(_tokenContract, msg.sender, secondTwo);
        } else {
            token.transfer(walletTwo, firstTwo);
            counterTwo++;
            emit WithdrewTokens(_tokenContract, msg.sender, firstTwo);
        }

    }

    function withdrawTokensWalletThree(address _tokenContract) onlyOwner onlyCreator public {
        require(now >= unlockDates[counterThree]);
        ERC20 token = ERC20(_tokenContract);
        if (counterThree >= 1) {
            token.transfer(walletThree, secondThree);
            counterThree++;
            emit WithdrewTokens(_tokenContract, msg.sender, secondThree);
        } else {
            token.transfer(walletThree, firstThree);
            counterThree++;
            emit WithdrewTokens(_tokenContract, msg.sender, firstThree);
        }

    }

    function withdrawTokensWalletFour(address _tokenContract) onlyOwner onlyCreator public {
        require(now >= unlockDates[counterFour]);
        ERC20 token = ERC20(_tokenContract);
        if (counterFour >= 1) {
            token.transfer(walletFour, secondFour);
            counterFour++;
            emit WithdrewTokens(_tokenContract, msg.sender, secondFour);
        } else {
            token.transfer(walletFour, firstFour);
            counterFour++;
            emit WithdrewTokens(_tokenContract, msg.sender, firstFour);
        }

    }

    function withdrawTokensWalletFive(address _tokenContract) onlyOwner onlyCreator public {
        require(now >= unlockDates[counterFive]);
        ERC20 token = ERC20(_tokenContract);
        if (counterFive >= 1) {
            token.transfer(walletFive, secondFive);
            counterFive++;
            emit WithdrewTokens(_tokenContract, msg.sender, secondFive);
        } else {
            token.transfer(walletFive, firstFive);
            counterFive++;
            emit WithdrewTokens(_tokenContract, msg.sender, firstFive);
        }

    }

    function withdrawTokensWalletSix(address _tokenContract) onlyOwner onlyCreator public {
        require(now >= unlockDates[counterSix]);
        ERC20 token = ERC20(_tokenContract);
        if (counterSix >= 1) {
            token.transfer(walletSix, secondSix);
            counterSix++;
            emit WithdrewTokens(_tokenContract, msg.sender, secondSix);
        } else {
            token.transfer(walletSix, firstSix);
            counterSix++;
            emit WithdrewTokens(_tokenContract, msg.sender, firstSix);
        }

    }

    function info() public view returns(address, address, uint256[], uint256, uint256) {
        return (creator, owner, unlockDates, createdAt, address(this).balance);
    }

    event Received(address from, uint256 amount);
    event Withdrew(address to, uint256 amount);
    event WithdrewTokens(address tokenContract, address to, uint256 amount);
}
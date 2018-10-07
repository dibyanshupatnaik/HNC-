pragma solidity ^0.4.24;

//metmask vault 12 pass words : stumble pudding pave around consider huge effort satisfy arm scorpion stamp breeze

/*contract Election {
    // Read/write candidate
    string public candidate;

    // Constructor
    function Election () public {
        candidate = "Candidate 1";
    }
}*/

// app.candidates(1).then(function(c) {candidate = c; })  -> candidate || candidate[0],[1],[2] to access the variables inside the structs

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Read/write Candidates
    mapping(uint => Candidate) public candidates;

    // Store accounts that have voted
    mapping(address => bool) public voters;

    // Store Candidates Count
    uint public candidatesCount;

    // ...
    function addCandidate (string _name) private { //private so getter cant be used and noone can access this
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); //0 as no votes yet
    }

    function Election () public {
        addCandidate("User 1");
        addCandidate("User 2");
    
    }

    event votedEvent (
        uint indexed _candidateId
    );


    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        votedEvent(_candidateId);
    }


}
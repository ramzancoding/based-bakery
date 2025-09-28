/**
 *Submitted for verification at basescan.org on 2025-01-15
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bakery {
    // État de la boulangerie et du four
    bool public isBakeryOpen;
    bool public isOvenOn;
    uint public lastBreadSize;

    event BakeryOpened(bool state);
    event OvenToggled(bool state);
    event BreadSold(uint size);

    constructor() {
        isBakeryOpen = false;
        isOvenOn = false;
        lastBreadSize = 0;
    }

    // Fonction pour ouvrir ou fermer la boulangerie
    function toggleBakery() public {
        isBakeryOpen = !isBakeryOpen;
        emit BakeryOpened(isBakeryOpen);
    }

    // Fonction pour allumer ou éteindre le four
    function toggleOven() public {
        require(isBakeryOpen, "La boulangerie doit etre ouverte pour allumer le four.");
        isOvenOn = !isOvenOn;
        emit OvenToggled(isOvenOn);
    }

    // Fonction pour vendre un pain d'une taille aléatoire
    function sellBread() public {
        require(isBakeryOpen, "La boulangerie doit etre ouverte pour vendre du pain.");
        require(isOvenOn, "Le four doit etre allume pour vendre du pain.");
        uint randomSize = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % 1000 + 1; // Taille entre 1 et 1000 grammes
        lastBreadSize = randomSize;
        emit BreadSold(randomSize);
    }

    // Fonction pour obtenir l'état complet de la boulangerie
    function getBakeryStatus() public view returns (string memory) {
        string memory bakeryStatus = isBakeryOpen ? "ouverte" : "fermee";
        string memory ovenStatus = isOvenOn ? "allume" : "eteint";
        return string(abi.encodePacked(
            "Boulangerie: ", bakeryStatus, ", Four: ", ovenStatus, ", Derniere taille de pain vendue: ", uintToString(lastBreadSize), " g."
        ));
    }

    // Fonction utilitaire pour convertir un uint en string
    function uintToString(uint v) internal pure returns (string memory) {
        if (v == 0) {
            return "0";
        }
        uint maxLen = 100;
        bytes memory reversed = new bytes(maxLen);
        uint i = 0;
        while (v != 0) {
            uint remainder = v % 10;
            v = v / 10;
            reversed[i++] = bytes1(uint8(48 + remainder));
        }
        bytes memory s = new bytes(i);
        for (uint j = 0; j < i; j++) {
            s[j] = reversed[i - 1 - j];
        }
        return string(s);
    }
}/**
 *Submitted for verification at basescan.org on 2025-01-15
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bakery {
    // État de la boulangerie et du four
    bool public isBakeryOpen;
    bool public isOvenOn;
    uint public lastBreadSize;

    // Événements pour signaler les actions
    event BakeryOpened(bool state);
    event OvenToggled(bool state);
    event BreadSold(uint size);

    // Constructeur pour initialiser l'état de la boulangerie
    constructor() {
        isBakeryOpen = false;
        isOvenOn = false;
        lastBreadSize = 0;
    }

    // Fonction pour ouvrir ou fermer la boulangerie
    function toggleBakery() public {
        isBakeryOpen = !isBakeryOpen;
        emit BakeryOpened(isBakeryOpen);
    }

    // Fonction pour allumer ou éteindre le four
    function toggleOven() public {
        require(isBakeryOpen, "La boulangerie doit etre ouverte pour allumer le four.");
        isOvenOn = !isOvenOn;
        emit OvenToggled(isOvenOn);
    }

    // Fonction pour vendre un pain d'une taille aléatoire
    function sellBread() public {
        require(isBakeryOpen, "La boulangerie doit etre ouverte pour vendre du pain.");
        require(isOvenOn, "Le four doit etre allume pour vendre du pain.");
        uint randomSize = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % 1000 + 1; // Taille entre 1 et 1000 grammes
        lastBreadSize = randomSize;
        emit BreadSold(randomSize);
    }

    // Fonction pour obtenir l'état complet de la boulangerie
    function getBakeryStatus() public view returns (string memory) {
        string memory bakeryStatus = isBakeryOpen ? "ouverte" : "fermee";
        string memory ovenStatus = isOvenOn ? "allume" : "eteint";
        return string(abi.encodePacked(
            "Boulangerie: ", bakeryStatus, ", Four: ", ovenStatus, ", Derniere taille de pain vendue: ", uintToString(lastBreadSize), " g."
        ));
    }

    // Fonction utilitaire pour convertir un uint en string
    function uintToString(uint v) internal pure returns (string memory) {
        if (v == 0) {
            return "0";
        }
        uint maxLen = 100;
        bytes memory reversed = new bytes(maxLen);
        uint i = 0;
        while (v != 0) {
            uint remainder = v % 10;
            v = v / 10;
            reversed[i++] = bytes1(uint8(48 + remainder));
        }
        bytes memory s = new bytes(i);
        for (uint j = 0; j < i; j++) {
            s[j] = reversed[i - 1 - j];
        }
        return string(s);
    }
}

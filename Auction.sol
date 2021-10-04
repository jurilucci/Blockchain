pragma solidity ^0.5.9;
contract Auction {
    
    //VARIABILI
    //Struttura degli Oggetti
    struct Item {
        uint itemId;                //id dell'oggetto
        uint[] itemTokens;          //bliglietti puntati in favore di questo oggetto
    }
    
    //Struttura per contenere i dati della persona
    struct Person {
        uint remainingTokens;       //token che rimangono
        uint personId;              //id del partecipante che corrisponde anche agli id dei suoi token
        address addr;               //indirizzo dello scommettitore
    }
 
    mapping(address => Person) tokenDetails; //address to person 
    Person [4] bidders;             //Array contenente 4 oggetti Person
    
    Item [3] public items;          //Array contenente 3 Oggetti
    address[3] public winners;      //Array per l'indirizzo del vincitore (per ogni oggetto)
    address public beneficiary;     //Proprietario dello smart contract
    
    uint bidderCount = 0;           //contatore
    
    //FUNZIONI
    constructor() public payable{   //Costruttore
                
        //PASSO 1. Inizializzare il beneficiario con l'indirizzo del proprietario dello smart contract
        //Aiuto. Nel costruttore,"msg.sender" è l'indirizzo del proprietario.
        // ** Inizio codice qui. 1 riga. **/

        //** Fine codice qui. **/
        uint[] memory emptyArray;
        items[0] = Item({itemId:0, itemTokens:emptyArray});
        
        //PASSO 2. Inizializzare gli altri due oggetti con indice 1 e 2.
        // ** Inizio codice qui. 2 righe. **/

        //** Fine codice qui. **/
    }
    

    function register() public payable{

        bidders[bidderCount].personId = bidderCount;
        
        //PASSO 3. Inizializzare l'indirizzo dello scommettitore
        /*Aiuto. Qui il bidders[bidderCount].addr dovrebbe essere inizializzato con l'indirizzo di chi si sta registrando.*/

        // ** Inizio codice qui. 1 riga. **/

        //** Fine codice qui. **/
        
        bidders[bidderCount].remainingTokens = 5;       //Solo 5 token
        tokenDetails[msg.sender] = bidders[bidderCount];
        bidderCount++;
    }
    
    function bid(uint _itemId, uint _count) public payable {
        /*
            Bids tokens to a particular item.
            Arguments:
            _itemId -- uint, id of the item
            _count -- uint, count of tokens to bid for the item
        */
        
        /*
        PASSO 4. Implementare le 3 condizioni sottostanti.
            4.1 Se il numero di token rimanenti allo scommettitore è < conteggio dei token che vuole puntare, revert.
            4.2 Se lo scommettitore non ha più token, revert.
            4.3 Se l'id dell'oggetto su cui vuole scommettere è > 2, revert.

        Aiuto: "tokenDetails[msg.sender].remainingTokens" indica il numero di token rimanenti allo scommettitore.
        */
        
        // ** Inizio codice qui. 2 righe. **/

        //** Fine codice qui. **/
        
        /*PASSO 5. Diminuire i token rimanenti del numero di token offerti e memorizzaew il nuovo valore nella variabile di saldo.
        Aiuto. "tokenDetails[msg.sender].remainingTokens" dovrebbe essere decrementato di "_count". */
 
        // ** Inizio codice qui. 1 riga. **/

        //** Fine codice qui. **/

        tokenDetails[msg.sender].remainingTokens = balance;
        bidders[tokenDetails[msg.sender].personId].remainingTokens = balance;
        
        Item storage bidItem = items[_itemId];
        for(uint i = 0; i < _count; i++) {
            bidItem.itemTokens.push(tokenDetails[msg.sender].personId);    
        }
    }
    
    //PASSO 6. Creare un modificatore chiamato "onlyOwner" per assicurare che solo il beneficiario possa validare il vincitore
    //Aiuto : Usare require per validare se "msg.sender" è uguale al beneficiario.
    modifier onlyOwner {
        // ** Inizio codice qui. 2 righe. **/

        //** Fine codice qui. **/
    }
    
    //PASSO 7. Usare il modificatore onlyOwner sulla funzione che rivela il vincitore  
    // ** Inizio codice qui. 1 riga da modificare. **/    
    function revealWinners() public {
    //** Fine codice qui. **/
        
        /* 
            Itera su tutti gli oggetti presenti in asta.
            Se almeno una persona ha fatto un'offerta, seleziona in modo random il vincitore */

        for (uint id = 0; id < 3; id++) {
            Item storage currentItem = items[id];
            if (currentItem.itemTokens.length != 0) {
            // generazione di un numero random a partire dall'id del blocco
            uint randomIndex = (block.number / currentItem.itemTokens.length) % currentItem.itemTokens.length; 
            // Ottiene l'id del ticket vincitore

            uint winnerId = currentItem.itemTokens[randomIndex];
                
            /* PASSO 8. Assignazione dei vincitori
            Aiuto." bidders[winnerId] " restituisce la persona corrispondente winnerId.
            è necessario assegnare l'indirizzo di questa persona al winners[id] */

            // ** Inizio codice qui. 1 riga. **/

            //** Fine codice qui. **/
                
            }
        }
    } 

    function getPersonDetails(uint id) public view returns(uint, uint, address){
        return (bidders[id].remainingTokens, bidders[id].personId, bidders[id].addr);
    }

}
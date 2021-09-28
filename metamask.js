const chainIdButton = document.querySelector('.checkChainIdButton');
const showChainId = document.querySelector('.showChainId');
const metamaskButton = document.querySelector('.checkMetamaskButton');
const showMetamaskConnected = document.querySelector('.showMetamaskConnected');
const ethereumButton = document.querySelector('.enableEthereumButton');
const showAccount = document.querySelector('.showAccount');
const transactionButton = document.querySelector('.transactionButton');
const showTxId = document.querySelector('.showTxId');

if(chainIdButton){
  chainIdButton.addEventListener('click', () => {
    getChainId();
  });
}

if(metamaskButton){
  metamaskButton.addEventListener('click', () => {
    getMetamaskConnected();
  });
}

if(ethereumButton){
  ethereumButton.addEventListener('click', () => {
    getAccount();
  });
}

if(transactionButton){
  transactionButton.addEventListener('click', () => {
    doTransaction();
  });
}

function getChainId() {
  /*PASSO 1 - Estrarre l'id della blockchain a cui si è collegati*/
  /* Inizio codice qui - 1 riga*/
  document.querySelector('.showChainId').innerText = ethereum.chainId;
  /*Fine codice qui*/
}

function getMetamaskConnected() {
  //PASSO 2 - Estrarre se Metamask è collegato alla rete o meno
  /** Inizio codice qui - 1 riga*/
  document.querySelector('.showMetamaskConnected').innerText = window.ethereum.isConnected();
  /*Fine codice qui*/  
}

async function getAccount() {
  //PASSO 3 - Estrarre l'account a cui metamask è collegato
  /** Inizio codice qui - 3 righe - Restituisce un array, necessario estrarre il primo valore*/
  ethereum.request({ method: 'eth_requestAccounts' }).then(data => {
  	document.querySelector('.showAccount').innerText = data;
  });
  /*Fine codice qui*/  
}

function doTransaction() {
  //PASSO 4 - Effettuare una transazione impostando un indirizzo desinatario e un valore a piacere.
  //          Stampare esito nel campo se ok, stampare errore se KO
  /* Inizio codice qui - 20 righe circa*/
  const transactionParameters = {
    gasPrice: '0x2710',
    gas: '0x2DC6C0',
    to: '0x4d42Efd22B657B17C8757Ea95f99e597c37039aC',
    from: ethereum.selectedAddress,
    value: '0x180000000000000'
  };

  ethereum.request({
    method: 'eth_sendTransaction',
    params: [transactionParameters],
  })
  .then(data => {
  	document.querySelector('.showTxId').innerText = data;
  });  
  /*Fine codice qui*/
}
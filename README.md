# Init project and install dependencies

Clone the project :
```
git clone git@github.com:Lockev/iim-vue-web3.git
```

Install dependencies :
```
npm i
```

# Start vue in a development environment

Start server :
```
npm run dev 
```

# Start Backend with Truffle / Ganache in development mode

First you must create and then add your credential in the `.env` file  
You can Copy/Paste `.env.example`
Then run :
```
truffle console --network development
```

When you are in the truffle environment, run :
```
migrate
```

Then Copy and Paste the Contract Address to the `VITE_CONTRACT_ADDRESS` variable in the `.env`

# With Mumbai
You can also use the contract using the network Mumbai !
You just need to change the `VITE_CONTRACT_ADDRESS` with this Contract Address: `0x4F73a34E4a9d318532Ef91Ffce5Ec00a746dF4e1`  
Don't forget to change your network in MetaMask !

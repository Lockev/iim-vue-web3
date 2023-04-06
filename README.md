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

# Start Backend with Truffle

First you must create and then add your credential in the `.env` file  
You can Copy/Paste `.env.example`

Then run :
```bash
truffle console --network mumbai
```

You can change the network if you want to use `Goerli` for example.

## With Ganache
If the previous step doesn't work, you can try by using the development mode:
```
truffle console --network development
```

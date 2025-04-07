# Setup Guide

## Prerequisites

- Node.js v14+
- Flow CLI
- MongoDB (for backend)

## Smart Contract Development

1. Install Flow CLI:
   ```bash
   brew install flow-cli
   ```

2. Start the Flow emulator:
   ```bash
   flow emulator
   ```

3. Deploy contracts:
   ```bash
   flow project deploy --network=emulator
   ```

## Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file with the following variables:
   ```
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/flow-bounty
   FLOW_ACCESS_NODE=http://localhost:8080
   FLOW_ACCOUNT_ADDRESS=your-flow-address
   FLOW_ACCOUNT_PRIVATE_KEY=your-private-key
   ```

4. Start the development server:
   ```bash
   npm run dev
   ```

## Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env.local` file with the following variables:
   ```
   NEXT_PUBLIC_API_URL=http://localhost:5000
   NEXT_PUBLIC_FLOW_ACCESS_NODE=http://localhost:8080
   NEXT_PUBLIC_CONTRACT_ADDRESS=your-flow-address
   ```

4. Start the development server:
   ```bash
   npm run dev
   ```
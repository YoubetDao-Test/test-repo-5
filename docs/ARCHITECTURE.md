# Flow Bounty Platform Architecture

## Overview

The Flow Bounty Platform consists of three main components:

1. **Smart Contracts**: Written in Cadence, manage the on-chain state and logic
2. **Backend API**: Node.js/Express server that interacts with the Flow blockchain
3. **Frontend**: Next.js web application for user interaction

## Smart Contracts

### FlowBounty.cdc

Main contract that manages the bounty lifecycle:

- Create bounties with rewards
- Submit work for bounties
- Accept submissions and release funds
- Cancel bounties

## Backend Architecture

- **API Layer**: Express.js REST endpoints
- **Service Layer**: Business logic and Flow interaction
- **Database Layer**: MongoDB for off-chain data storage
- **Blockchain Interface**: FCL for communicating with Flow blockchain

## Frontend Architecture

- **Next.js**: React framework for server-rendered pages
- **FCL Integration**: Flow Client Library for wallet connection
- **State Management**: React Context API
- **Styling**: Tailwind CSS

## Data Flow

1. User connects wallet via FCL
2. Frontend communicates with backend API for data
3. Backend queries on-chain data as needed
4. Transactions are signed by user and submitted to Flow blockchain
5. Events from blockchain are captured and stored in database

## Security Considerations

- Smart contract access control
- Proper transaction signing
- Validation of inputs
- Secure fund handling
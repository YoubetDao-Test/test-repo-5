// Script to get all bounties
// This is a placeholder and will be implemented fully in the smart contract task

import FlowBounty from 0xf8d6e0586b0a20c7

pub struct BountyView {
    pub let id: UInt64
    pub let title: String
    pub let description: String
    pub let reward: UFix64
    pub let creator: Address
    pub let isCompleted: Bool
    
    init(
        id: UInt64,
        title: String,
        description: String,
        reward: UFix64,
        creator: Address,
        isCompleted: Bool
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.reward = reward
        self.creator = creator
        self.isCompleted = isCompleted
    }
}

pub fun main(): [BountyView] {
    // Will return an array of BountyView structs
    // This is a placeholder for now
    return []
}
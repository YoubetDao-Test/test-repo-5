// FlowBounty.cdc
// Main contract for the Flow Bounty Platform

pub contract FlowBounty {
    // Contract events
    pub event ContractInitialized()
    pub event BountyCreated(id: UInt64, creator: Address, reward: UFix64, title: String)
    pub event BountyCompleted(id: UInt64, worker: Address)
    pub event BountyCancelled(id: UInt64)
    pub event AdminAdded(admin: Address)
    pub event AdminRemoved(admin: Address)
    
    // Contract state
    access(self) let admins: {Address: Bool}
    access(self) var bountyCounter: UInt64
    
    // Admin resource interface
    pub resource interface AdminPublic {
        pub fun isAdmin(): Bool
    }
    
    // Admin resource that allows privileged operations
    pub resource Admin: AdminPublic {
        pub fun isAdmin(): Bool {
            return true
        }
        
        pub fun addAdmin(address: Address) {
            pre {
                !FlowBounty.admins.containsKey(address): "Address is already an admin"
            }
            FlowBounty.admins[address] = true
            emit AdminAdded(admin: address)
        }
        
        pub fun removeAdmin(address: Address) {
            pre {
                FlowBounty.admins.containsKey(address): "Address is not an admin"
                FlowBounty.admins.length > 1: "Cannot remove the last admin"
            }
            FlowBounty.admins.remove(key: address)
            emit AdminRemoved(admin: address)
        }
    }
    
    // Check if an address is an admin
    pub fun isAdmin(address: Address): Bool {
        return self.admins[address] ?? false
    }
    
    // Create a new Admin resource
    access(self) fun createNewAdmin(): @Admin {
        return <-create Admin()
    }
    
    init() {
        self.admins = {}
        self.bountyCounter = 0
        
        // Add the contract deployer as the first admin
        self.admins[self.account.address] = true
        
        // Store an Admin resource in the contract account
        self.account.save(<-self.createNewAdmin(), to: /storage/FlowBountyAdmin)
        
        emit ContractInitialized()
    }
}
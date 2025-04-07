import Test
import FlowBounty from "../contracts/FlowBounty.cdc"

// Test suite for FlowBounty contract
pub fun testSuite() {
    // Test admin functionality
    testAdminInitialization()
    testAdminAddition()
    testAdminRemoval()
}

// Test that contract deployer is set as admin
pub fun testAdminInitialization() {
    let deployer = Test.createAccount()
    Test.setDeployer(deployer)
    
    // Deploy the contract
    let err = Test.deployContract("FlowBounty", "../contracts/FlowBounty.cdc")
    Test.expect(err, Test.beNil())
    
    // Check if deployer is admin
    let isAdmin = FlowBounty.isAdmin(address: deployer.address)
    Test.expect(isAdmin, Test.equal(true))
}

// Test adding a new admin
pub fun testAdminAddition() {
    let newAdmin = Test.createAccount()
    let adminRef = Test.borrowAuthAccount(Test.getDeployer()).borrow<&FlowBounty.Admin>(from: /storage/FlowBountyAdmin)
        ?? panic("Could not borrow admin reference")
    
    // Add new admin
    adminRef.addAdmin(address: newAdmin.address)
    
    // Verify new admin was added
    let isAdmin = FlowBounty.isAdmin(address: newAdmin.address)
    Test.expect(isAdmin, Test.equal(true))
}

// Test removing an admin
pub fun testAdminRemoval() {
    let adminToRemove = Test.createAccount()
    let adminRef = Test.borrowAuthAccount(Test.getDeployer()).borrow<&FlowBounty.Admin>(from: /storage/FlowBountyAdmin)
        ?? panic("Could not borrow admin reference")
    
    // First add the admin
    adminRef.addAdmin(address: adminToRemove.address)
    
    // Then remove them
    adminRef.removeAdmin(address: adminToRemove.address)
    
    // Verify admin was removed
    let isAdmin = FlowBounty.isAdmin(address: adminToRemove.address)
    Test.expect(isAdmin, Test.equal(false))
} 
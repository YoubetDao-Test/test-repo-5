import { config } from "@onflow/fcl";

// This configuration is used to connect to Flow blockchain
// We'll use local emulator for development
export const configureFcl = () => {
  config()
    .put("accessNode.api", process.env.NEXT_PUBLIC_FLOW_ACCESS_NODE || "http://localhost:8080") // local Flow emulator
    .put("discovery.wallet", "https://fcl-discovery.onflow.org/testnet/authn") // Wallet discovery endpoint
    .put("app.detail.title", "Flow Bounty Platform") // App title for wallet
    .put("app.detail.icon", "https://placekitten.com/g/200/200") // App icon for wallet
    .put("0xFlowBounty", process.env.NEXT_PUBLIC_CONTRACT_ADDRESS || "0xf8d6e0586b0a20c7"); // Contract address
};

export default configureFcl;
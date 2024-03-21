import "@rainbow-me/rainbowkit/styles.css";
import { connectorsForWallets, getDefaultConfig } from "@rainbow-me/rainbowkit";
import { ritualChain } from "@/util/chain";
import { metaMaskWallet } from "@rainbow-me/rainbowkit/wallets";
import { createConfig, http } from "wagmi";

const connectors = connectorsForWallets(
  [
    {
      groupName: "Recommended",
      wallets: [metaMaskWallet],
    },
  ],
  {
    appName: "My RainbowKit App",
    projectId: "YOUR_PROJECT_ID",
  },
);

export const config = createConfig({
  connectors,
  chains: [ritualChain],
  transports: {
    [ritualChain.id]: http(),
  },
});

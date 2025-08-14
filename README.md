# 🛠️ TokenForge

TokenForge is a minimal ETH-backed token contract built to demonstrate vault mechanics, custom error handling, and internal accounting. It mints tokens 1:1 with ETH deposits and supports direct transfers between users.

This repo is part of my journey to build audit-ready smart contract modules that signal ownership, gas mastery, and professional judgment to protocol engineering recruiters.

---

## ⚙️ Design Philosophy

- **ETH-backed minting**: Users deposit ETH and receive an equal amount of TokenForge tokens.
- **Custom errors**: Implements `ZeroDeposit` and `InsufficientBalance` for gas-efficient reverts.
- **Internal accounting**: Tracks balances and total supply without relying on ERC-20 inheritance.
- **Minimal MVP first**: Core logic is implemented cleanly before layering in advanced features and tests.

---

## 🧪 Testing Strategy

Built with Foundry, the test suite reflects a stepwise, disciplined approach:

- `testDeposit`: Validates ETH-to-token minting
- `testTransfer`: Ensures correct balance updates
- `testZeroDepositReverts`: Covers edge case with custom error
- `testInsufficientTransferReverts`: Defensive programming for balance checks

Tests are structured to signal clarity, coverage, and gas-aware design.

---

## 📂 Repo Structure

- `src/TokenForge.sol`: Core contract
- `test/TokenForgeTest.t.sol`: Foundry test suite
- `.gitignore`: Clean repo hygiene
- `LICENSE`: MIT license for open-source clarity
- `Foundry.toml`: Compiler version and remappings

---

## 🚀 Roadmap

- Add `withdraw()` logic with custom errors
- Fuzz tests for transfer edge cases
- Gas snapshot comparisons
- README examples with `cast` CLI usage
- Layer in auto-compounding vault logic and composable primitives

---

## 🧠 Signals to Recruiters

This repo showcases:

- Ownership and clarity in smart contract design
- Gas optimization and error handling
- Iterative testing and documentation
- Audit-ready structure and repo hygiene

---

## 🧑‍💻 Author

Built by [James](https://github.com/YOUR_USERNAME), focused on transitioning from junior dev to protocol engineer by building hard-to-ignore smart contract modules.


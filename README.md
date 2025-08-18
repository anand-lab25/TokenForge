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
Test cases are design to reflect real world edge case, revert correctness, and provide gas visiblity:
fuzzing and event verification are layered in to simulate composability and audit readiness:

- `testDeposit`: Validates ETH-to-token minting
- `testTransfer`: Ensures correct balance updates
- `testZeroDepositReverts`: Covers edge case with custom error
- `testInsufficientTransferReverts`: Defensive programming for balance checks

Tests are structured to signal clarity, coverage, and gas-aware design.

---

## ⛽ Gas Report Summary and output 

| Function      | Avg Gas | Notes |
|---------------|---------|-------|
| `deposit`     | 69,245  | ETH-backed minting with event emission |
| `transfer`    | 52,112  | Balance updates + event emission |
| `balanceOf`   | 2,802   | Lightweight read |
| `totalSupply` | 2,447   | Minimal internal accounting |
## output
xat2212@LAPTOP-MI26ITHQ:/mnt/c/Users/xat22/Documents/9781593271442/TokenForge$ forge test --gas-report 
[⠰] Compiling...
No files changed, compilation skipped

Ran 8 tests for test/TokenForge.t.sol:TokenForgeTest
[PASS] testDeposit() (gas: 101325)
[PASS] testDepositEmitsEventsCorrectly() (gas: 92267)
[PASS] testFuzzTransfer(address,uint256) (runs: 256, μ: 158845, ~: 158306)
[PASS] testInsufficientTransferReverts() (gas: 114683)
[PASS] testTotalSupplyAfterMultipleDeposits() (gas: 152098)
[PASS] testTransfer() (gas: 154395)
[PASS] testTransferEmitsEvents() (gas: 157535)
[PASS] testZeroDepositReverts() (gas: 29538)
Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 53.81ms (54.46ms CPU time)

╭----------------------------------------+-----------------+-------+--------+-------+---------╮
| src/TokenForge.sol:TokenForge Contract |                 |       |        |       |         |
+=============================================================================================+
| Deployment Cost                        | Deployment Size |       |        |       |         |
|----------------------------------------+-----------------+-------+--------+-------+---------|
| 496215                                 | 2084            |       |        |       |         |
|----------------------------------------+-----------------+-------+--------+-------+---------|
|                                        |                 |       |        |       |         |
|----------------------------------------+-----------------+-------+--------+-------+---------|
| Function Name                          | Min             | Avg   | Median | Max   | # Calls |
|----------------------------------------+-----------------+-------+--------+-------+---------|
| balanceOf                              | 2802            | 2802  | 2802   | 2802  | 518     |
|----------------------------------------+-----------------+-------+--------+-------+---------|
| deposit                                | 21305           | 69245 | 69493  | 69493 | 264     |
|----------------------------------------+-----------------+-------+--------+-------+---------|
| totalSupply                            | 2447            | 2447  | 2447   | 2447  | 2       |
|----------------------------------------+-----------------+-------+--------+-------+---------|
| transfer                               | 24325           | 52112 | 52328  | 52376 | 259     |
╰----------------------------------------+-----------------+-------+--------+-------+---------╯


Ran 1 test suite in 88.11ms (53.81ms CPU time): 8 tests passed, 0 failed, 0 skipped (8 total tests)


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
### 🔜 Short-Term Goals
- Implement `withdraw()` with revert guards
- Add fuzz tests for transfer edge cases
- Snapshot gas before/after new features

### 🌐 Long-Term Vision
- Integrate auto-compounding vault logic
- Build composable primitives for DeFi protocols
- Expand README with usage examples and audit notes


---

## 🧠 Signals to Recruiters

This repo showcases:

- Ownership and clarity in smart contract design
- Gas optimization and error handling
- Iterative testing and documentation
- Audit-ready structure and repo hygiene

---

## 🧑‍💻 Author

Built by [anand]([text](https://github.com/anand-lab25/TokenForge)), focused on .


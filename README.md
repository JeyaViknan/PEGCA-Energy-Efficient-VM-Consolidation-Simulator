# ⚡ PEGCA Simulator

**Proactive Energy-Efficient VM Consolidation in Cloud Data Centers**

The **PEGCA (Proactive Energy-efficient VM Consolidation Algorithm)** simulator is a lightweight Python application that models energy-aware resource management in cloud data centers. It uses **Exponential Moving Average (EMA)** prediction to proactively consolidate underutilized VMs, reduce energy consumption, and maintain SLA performance.

---

## ✨ Features

* 🔮 **Predictive Analytics** — EMA-based workload prediction with configurable smoothing factor
* 📦 **Smart Consolidation** — Greedy fit-first placement targeting configurable host utilization
* ⚡ **Energy Optimization** — Automatic shutdown of empty hosts with energy savings calculation
* 🛡️ **Performance Safety** — High-watermark monitoring and adaptive utilization adjustment
* 🖥️ **Simulation Environment** — Self-contained, synthetic workload generator, no dependencies

---

## 📋 System Requirements

**Minimum**

* OS: Linux, macOS, or Windows
* Python: 3.7+
* Memory: 512 MB RAM
* Storage: 10 MB
* CPU: Any modern processor

**Recommended**

* Python: 3.9+
* Memory: 1 GB RAM
* Storage: 100 MB
* CPU: Multi-core processor

**Dependencies**: ✅ None (uses only Python standard library: `math`, `random`, `statistics`, `typing`)

---

## 🚀 Installation

```bash
# 1. Clone repo
git clone https://github.com/<your-username>/pegca-simulator.git
cd pegca-simulator

# 2. Verify Python installation
python3 --version   # should be >= 3.7

# 3. Run first simulation
python3 pegca_sim.py
```

Expected output (example):

```json
{
  "energy_kwh_total": 15.432,
  "migrations_total": 45,
  "hosts_off_final": 8,
  "util_mean_final": 0.7845,
  "util_p95_final": 0.9234,
  "hi_watermark_breaches": 3,
  "final_target_util": 0.76
}
```

---

## ⚙️ Configuration

You can customize simulation parameters in `pegca_sim.py` by editing the `Config` class:

```python
cfg = Config(
    alpha=0.7,                # EMA smoothing factor
    low_usage_threshold=25.0, # % CPU threshold for consolidation
    target_util=0.75,         # Host utilization target
    hi_watermark=0.85,        # Performance safety threshold
    dt_hours=0.5,             # Time per cycle (0.5 = 30 mins)
    cycles=48,                # Total cycles (e.g., 48 for 1 day)
    n_hosts=50,               # Number of physical hosts
    n_vms=300,                # Number of virtual machines
    seed=42                   # Random seed for reproducibility
)
```

---

## ▶️ Running the Simulator

**Default run**

```bash
python3 pegca_sim.py
```

**Custom config example (inside code or one-liner):**

```bash
python3 -c "from pegca_sim import Config, simulate; print(simulate(Config(n_hosts=10, n_vms=50, cycles=12, target_util=0.70)))"
```

**Batch run**

```bash
chmod +x batch_simulations.sh
./batch_simulations.sh
```

---

## 📊 Output Interpretation

* `energy_kwh_total` → Energy saved (higher = better)
* `migrations_total` → Number of VM migrations
* `hosts_off_final` → Hosts powered down by end of sim
* `util_mean_final` → Mean utilization of active hosts (~0.75–0.85 ideal)
* `util_p95_final` → 95th percentile utilization (must be < 0.9 for safety)
* `hi_watermark_breaches` → Times hosts exceeded safe utilization
* `final_target_util` → Target utilization after auto-adjustments

---

## 🛠️ Deployment Steps

1. Install Python 3.7+ (Linux/macOS/Windows supported).
2. Clone the repository.
3. Place `pegca_sim.py` in project root.
4. (Optional) Adjust configuration inside `pegca_sim.py`.
5. Run simulator with `python3 pegca_sim.py`.
6. Analyze JSON metrics from output.
7. Use batch scripts (`batch_simulations.sh`) for multi-run experiments.

---

## 📈 Advanced Usage

* Export results to CSV/JSON (ready-to-use functions included).
* Modify synthetic workload (`synth_drift`) for custom patterns.
* Define heterogeneous host types in `Host` class.
* Enable logging for debug and monitoring (`pegca_simulation.log`).
* Run `batch_processor.py` to evaluate multiple parameter sets automatically.

---

## 📜 License

MIT License — free for research, teaching, and modification.

---

## 👨‍💻 Author

Developed as part of **green computing and VM consolidation research**. Contributions welcome!

#!/bin/bash
# batch_simulations.sh

echo "Running PEGCA simulations..."

# Simulation 1: Default
echo "=== Default Configuration ==="
python3 pegca_sim.py > results_default.txt

# Simulation 2: Conservative
echo "=== Conservative Configuration ==="
python3 -c "
from pegca_sim import Config, simulate
cfg = Config(target_util=0.70, hi_watermark=0.80)
result = simulate(cfg)
print(result)
" > results_conservative.txt

# Simulation 3: Aggressive
echo "=== Aggressive Configuration ==="
python3 -c "
from pegca_sim import Config, simulate
cfg = Config(target_util=0.90, low_usage_threshold=40.0)
result = simulate(cfg)
print(result)
" > results_aggressive.txt

echo "All simulations completed!"
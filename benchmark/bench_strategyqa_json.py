#!/usr/bin/env python3
"""Benchmark: StrategyQA with SMT2 backend and Azure OpenAI.

StrategyQA is a question answering benchmark that focuses on open-domain
questions where the required reasoning steps are implicit in the question
and should be inferred using a strategy.
"""

import json
import logging
import sys
import os
from pathlib import Path
from typing import Literal

# Add parent directory to path for z3adapter imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from utils.azure_config import get_client_config
from openai import OpenAI
from z3adapter.reasoning import EvaluationPipeline, ProofOfThought

# Configure logging
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# # Get Azure OpenAI configuration
# config = get_client_config()

# # Backend selection (change this to "json" to test JSON backend)
# BACKEND: Literal["json", "smt2"] = "json"  # Options: "smt2" or "json"

# # Create ProofOfThought instance with configurable backend
# pot = ProofOfThought(
#     llm_client=config["llm_client"],
#     model=config["model"],
#     backend=BACKEND,
#     max_attempts=3,
#     cache_dir=f"output/{BACKEND}_programs_strategyqa",
#     z3_path="z3",
# )

# Use regular OpenAI API
# Backend selection (change this to "json" to test JSON backend)
BACKEND: Literal["json", "smt2"] = "json"  # Options: "smt2" or "json"
api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    raise ValueError(
        "OPENAI_API_KEY is not set. " "Please set it in your .env file or environment variables."
    )

client = OpenAI(
    api_key=api_key,
    base_url="https://ellm.nrp-nautilus.io/v1",
)
pot = ProofOfThought(
    llm_client=client,
    model="qwen3",
    backend=BACKEND,
    max_attempts=3,
    cache_dir=f"output/{BACKEND}_programs_strategyqa",
    z3_path="z3",
)

# Create evaluation pipeline with parallel workers
evaluator = EvaluationPipeline(
    proof_of_thought=pot,
    output_dir=f"output/{BACKEND}_evaluation_strategyqa",
    num_workers=10,
)

# Run evaluation
result = evaluator.evaluate(
    dataset="data/strategyQA_train.json",
    question_field="question",
    answer_field="answer",
    id_field="qid",
    max_samples=100,
    skip_existing=True,
)
total = result.metrics.total_samples
accuracy_including_failed = (
    result.metrics.correct_answers / total if total > 0 else 0.0
)

# Print results
print("\n" + "=" * 70)
print(f"STRATEGYQA BENCHMARK RESULTS ({BACKEND.upper()} Backend + Qwen3)") # Not Azure GPT-5, OpenAI GPT-5-nano
print("=" * 70)
print(f"Total Samples: {result.metrics.total_samples}")
print(f"Correct: {result.metrics.correct_answers}")
print(f"Wrong: {result.metrics.wrong_answers}")
print(f"Failed: {result.metrics.failed_answers}")
print()
print(f"Accuracy: {result.metrics.accuracy:.2%}")
print(f"Accuracy including Failed: {accuracy_including_failed:.2%}")
print(f"Precision: {result.metrics.precision:.4f}")
print(f"Recall: {result.metrics.recall:.4f}")
print(f"F1 Score: {result.metrics.f1_score:.4f}")
print(f"Specificity: {result.metrics.specificity:.4f}")
print()
print(f"True Positives: {result.metrics.tp}")
print(f"True Negatives: {result.metrics.tn}")
print(f"False Positives: {result.metrics.fp}")
print(f"False Negatives: {result.metrics.fn}")
# CODEX code for printing out number of samples
from pathlib import Path

eval_output_dir = Path(f"output/{BACKEND}_evaluation_strategyqa")

attempts = []
for result_file in eval_output_dir.glob("*_result.json"):
    with open(result_file) as f:
        data = json.load(f)
    if data.get("num_attempts") is not None:
        attempts.append(data["num_attempts"])

total_attempts = sum(attempts)
avg_attempts = total_attempts / len(attempts) if attempts else 0.0
print(f"Total Attempts from cached result file: {total_attempts}")
print("=" * 70)
print("\nNOTE: StrategyQA tests multi-hop reasoning that requires implicit world knowledge.")
print("      Even though the dataset contains the world facts needed to answer the question,")
print("      the LLM does not see these facts.")
# Jordan K. Mercer -- Master Resume

> **Note:** This is a fictional persona used to showcase the `tailor-resume` Claude Code skill. All companies, publications, and achievements are invented.
>
> This file is the **single source of truth** for all professional experience, skills, publications, and achievements.
> Use it to generate role-specific resumes by selecting the most relevant items for each application.
> Items are tagged with `[tags]` to help filter by domain.

---

## Contact

| Field     | Value |
|-----------|-------|
| Email     | jordan.mercer@example.com |
| Website   | [jordan-mercer.example](https://jordan-mercer.example) |
| GitHub    | [github.com/jordan-k-mercer](https://github.com/jordan-k-mercer) |
| LinkedIn  | [linkedin.com/in/jordan-k-mercer](https://www.linkedin.com/in/jordan-k-mercer/) |
| Scholar   | [Google Scholar profile](https://scholar.google.com/) |
| Location  | San Francisco, USA |

---

## Professional Summary Variants

### Research / Academia-focused
ML researcher with a PhD track at Northern Cross University in efficient large-scale retrieval. Published 3 first-author papers at NeurIPS and ICML on retrieval-augmented language models, dense retrieval, and quantized embedding caches. Experienced in distributed training at scale and in translating research ideas into deployed systems serving tens of millions of users.

### Industry ML / Applied AI
ML engineer with 8+ years of experience building and deploying production ML systems. Track record of taking models from research prototype to production, including LLM fine-tuning on multi-node GPU clusters (9 days to 18 hours), retrieval-augmented generation serving 40M requests/month at P99 180ms, and distributed inference via vLLM. 3 first-author publications at top ML venues.

### Senior SWE / Systems
Senior software engineer with deep ML infrastructure expertise and 8+ years in production systems. Built distributed PyTorch + FSDP training stacks on Kubernetes, designed retrieval backends in C++ and CUDA, shipped reproducible MLOps pipelines (W&B, DVC, Terraform), and led CI/CD adoption across multiple teams. Comfortable across the stack from CUDA kernels to deployment automation.

---

## Experience

### Senior Machine Learning Engineer -- Novalytic Inc., San Francisco
**2021 -- Present** | `[ml, llm, leadership, deployment, infra]`

#### Distributed training platform `[infra, distributed-training, hpc, mlops]`
- Lead the large-language-model training platform: built a distributed PyTorch + FSDP training stack on Kubernetes that fine-tunes 7B--70B parameter models, taking a 13B model from a 9-day single-node run to 18 hours on a 32-GPU cluster.
- Designed the experiment-tracking and artifact-storage layer (Weights & Biases + DVC + S3), reducing experiment onboarding time for new hires from days to under an hour.
- Wrote the cluster autoscaling and spot-instance reclamation policy, cutting monthly training spend by 28% without SLO regression.

#### Retrieval-augmented generation `[ml, rag, retrieval, llm, deployment]`
- Designed a retrieval-augmented generation service serving 40M requests/month with a P99 latency of 180ms, using vLLM for inference and a custom dense-retrieval backend with quantized embedding caches.
- Built the evaluation harness for RAG quality (faithfulness, groundedness, answer relevance) that became the default framework across 3 product teams.
- Shipped model quantization (INT8 + INT4 via bitsandbytes) to production inference, reducing GPU memory footprint by 4x with <2% quality regression.

#### Research-to-production `[ml, research, publications]`
- Published 2 first-author papers on retrieval and long-context reasoning (NeurIPS 2024, ICML 2023) while shipping the same research into production.
- Drove the internal research review process; reviewed 12+ internal proposals per quarter for technical soundness and business alignment.

#### Leadership `[leadership, mentoring]`
- Mentored 4 ML engineers; led cross-team design reviews for model deployment, quantization, and inference efficiency.
- Served as tech lead for the inference platform pod (5 engineers); set quarterly technical priorities in partnership with product.

---

### Machine Learning Research Engineer -- Vertex Systems, Seattle
**2019 -- 2021** | `[ml, research, retrieval, infra]`

- Built the company's first dense-retrieval search backend, replacing a BM25 baseline and improving top-10 recall by 22% on enterprise document corpora.
- Prototyped an early retrieval-augmented QA system (predating the RAG acronym) that grounded answers against indexed knowledge bases; shipped to 3 enterprise customers with an aggregate annual contract value of ~$6M.
- Designed and ran distributed training jobs on AWS (EKS + Spot instances), cutting monthly training spend by 35% while preserving throughput.
- Co-authored an ACL 2022 paper on contrastive alignment for multilingual sentence embeddings during this role's research sprint.

---

### Software Engineer -- Cascadia Labs, Portland
**2017 -- 2019** | `[swe, backend, data-pipelines]`

- Built and maintained the backend data pipeline (Python + Airflow + Kafka) serving analytics for a SaaS product with 200k monthly active users.
- Implemented the company's first ML feature: a recommendation ranker that improved click-through rate by 11% in an online A/B test.
- Wrote the internal CI/CD bootstrap for service deployments (Docker + Terraform), adopted by 3 downstream teams.
- On-call rotation for the core data platform; wrote the first runbook for pipeline incident response.

---

### Visiting Researcher (concurrent) -- Northern Cross University
**2020 -- 2022** | `[research, academia, publications]`

- Part-time research appointment during doctoral studies.
- Co-authored ACL 2022 paper on contrastive alignment; first-authored ICML 2023 paper on quantized embedding caches.
- Supervised 2 Master's thesis students on dense retrieval topics.

---

## Education

### Ph.D. in Computer Science
**Northern Cross University, USA** | 2020 -- 2025 (expected)
- Thesis: *Efficient Large-Scale Retrieval for Neural Search Systems*
- Focus: dense retrieval, quantized embedding caches, retrieval-augmented language models.

### M.Sc. in Machine Learning
**Westgate University of Technology, USA** | 2015 -- 2017
- Thesis: *Contrastive Representation Learning for Multilingual Sentence Embeddings*
- Graduated with distinction.

### B.Sc. in Computer Science
**Westgate University of Technology, USA** | 2011 -- 2015
- Relevant coursework: algorithms, distributed systems, linear algebra, probability.

---

## Technical Skills

### Programming Languages
| Skill | Proficiency | Notes |
|-------|-------------|-------|
| Python | Expert | Primary language for ML, backend, tooling |
| C++ | Advanced | CUDA kernels, retrieval index internals |
| CUDA | Advanced | Custom kernels for attention and quantization |
| TypeScript | Intermediate | Internal tooling and dashboards |
| SQL | Advanced | Analytics and feature pipelines |
| Bash | Advanced | Cluster automation and CI/CD scripts |
| LaTeX | Advanced | All publications and thesis |

### ML Frameworks & Tools
| Tool | Context |
|------|---------|
| PyTorch | Primary framework for research and production |
| JAX | Used for some research experiments |
| Hugging Face Transformers | Model hub, fine-tuning, tokenizers |
| vLLM | Production LLM inference serving |
| Triton | Custom attention / quantization kernels |
| DeepSpeed, FSDP | Distributed training at billion-parameter scale |
| Weights & Biases | Experiment tracking and artifact management |
| MLflow, DVC | Alternative MLOps stacks |

### Infrastructure & DevOps
| Tool | Context |
|------|---------|
| Docker | Containerized workloads throughout career |
| Kubernetes | Primary orchestration for training and serving |
| Terraform | Infrastructure-as-code for cluster provisioning |
| AWS (EKS, S3, Spot, EC2) | Primary cloud at Novalytic and Vertex |
| GCP (GKE) | Cross-cloud benchmarking |
| Airflow, Kafka | Data pipelines (Cascadia) |
| GitHub Actions, GitLab CI | CI/CD across all roles |
| Linux | Primary development OS |

### ML Domains
| Domain | Specifics |
|--------|-----------|
| **Large Language Models** | Fine-tuning, RLHF (basics), RAG, long-context reasoning, quantization (INT8/INT4) |
| **Information Retrieval** | Dense retrieval, BM25 baselines, quantized embedding caches, hybrid retrieval |
| **Representation Learning** | Contrastive learning, multilingual embeddings, sentence representations |
| **Deep Learning** | Transformer architectures, attention mechanisms, efficient attention variants |
| **Evaluation** | A/B testing, causal inference, offline-online metric alignment, RAG evaluation (faithfulness, groundedness) |
| **MLOps** | Experiment tracking, reproducible training, model registries, CI for ML |

### Languages
| Language | Level | Notes |
|----------|-------|-------|
| English | Native | Primary working language |
| French | Intermediate (B1) | Conversational; written documents with help |

---

## Research Publications

### First-Author -- Conference Proceedings

1. **Adaptive Retrieval-Augmented Language Models for Long-Context Reasoning**
   Jordan K. Mercer, Lin Huang, Elena Rossi.
   *Advances in Neural Information Processing Systems (NeurIPS), 2024.*
   `[retrieval-augmented, long-context, llm]`

2. **Efficient Dense Passage Retrieval via Quantized Embedding Caches**
   Jordan K. Mercer, Sofia Lindqvist.
   *International Conference on Machine Learning (ICML), 2023.*
   `[retrieval, quantization, efficiency]`

### First-Author -- Under Review

3. **Scaling Dense Retrieval with Sparse Attention Priors**
   Jordan K. Mercer, Priya Raman, Thomas Okafor.
   *In review, 2025.*
   `[retrieval, attention, scaling]`

### Co-Author

4. **Contrastive Alignment for Multilingual Sentence Embeddings**
   Hao Chen, Jordan K. Mercer, Diego Navarro.
   *Association for Computational Linguistics (ACL), 2022.*
   `[contrastive-learning, multilingual, representation-learning]`

---

## Awards and Achievements

| Year | Award | Details | Tags |
|------|-------|---------|------|
| 2024 | NSF Graduate Research Fellowship | Competitive national fellowship for doctoral research in computer science | `[always-include, research, academia]` |
| 2023 | MLPerf Training Benchmark -- Open Division | Top-10 submission for distributed language-model training | `[infra, hpc, industry]` |
| 2022 | Best Reviewer Award, ACL Rolling Review | Recognized for review quality across a full submission cycle | `[academia, service]` |

---

## Talks and Presentations

| Date | Title | Venue | Tags |
|------|-------|-------|------|
| 2024 | Retrieval-Augmented Language Models in Production | Internal tech talk (details on request) | `[industry, llm]` |
| 2023 | Dense Retrieval at Scale | ICML oral session | `[research, retrieval]` |

---

## Open Source & Side Projects

| Repo | Description | Tags |
|------|-------------|------|
| [retrieval-bench](https://github.com/jordan-k-mercer/retrieval-bench) | Benchmark suite for dense retrieval systems | `[research, infra]` |
| [quantize-cache](https://github.com/jordan-k-mercer/quantize-cache) | Reference implementation of quantized embedding caches (ICML 2023 paper) | `[research, quantization]` |
| [mlops-cookbook](https://github.com/jordan-k-mercer/mlops-cookbook) | Minimal reproducible MLOps patterns (W&B + DVC + Terraform) | `[infra, mlops]` |

---

## Reviewing & Service

- **Reviewer:** NeurIPS (2023, 2024), ICML (2023), ACL Rolling Review (2022, 2023) -- Best Reviewer Award in 2022.
- **Mentoring:** 4 ML engineers at Novalytic; 2 Master's thesis students at Northern Cross University.

---

## Notes to agent

- Keep summary tone measured and avoid superlatives ("world-class", "industry-leading").
- Prefer metric-backed claims; if a bullet has no number, keep it but don't fabricate a metric.
- US spelling throughout (e.g., "organization", "analyze").
- For academia-heavy applications, prefer the Research/Academia summary and include all publications.
- For SWE-heavy applications, prefer the Senior SWE summary, drop the publications section or keep it to a one-line reference.
- `[always-include]`-tagged items should not be cut even at aggressive page budgets.

---

## Key Metrics (for quantitative-heavy resumes)

- **3** first-author papers at top ML venues (NeurIPS, ICML + 1 under review)
- **12x** training speedup (9 days -> 18 hours) via distributed training platform
- **40M** RAG requests/month served at P99 180ms latency
- **4x** GPU memory reduction via quantization (INT8 + INT4) with <2% quality regression
- **22%** recall@10 improvement over BM25 baseline on enterprise retrieval
- **35%** AWS training spend reduction via spot-instance scheduling
- **28%** cluster-spend reduction via autoscaling policy
- **11%** CTR uplift from first ML feature (recommendation ranker)
- **200k** MAU data pipeline built and maintained
- **4** ML engineers mentored

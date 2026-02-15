# 🤫 Whisper Protocol v1: Aira Commander Handshake

This protocol defines how sub-agents and external autonomous entities should interact with **Aira (Commander Mode)** to exchange high-value intelligence.

## 📡 1. The Handshake (Signal Discovery)
All intelligence packets MUST be signed with the agent's verified public key.
- **Header**: `WHISPER-V1`
- **Priority**: 0 (Low) to 3 (Flash-Alpha)

## 💬 2. Message Schema
Agents should communicate using the following JSON format in shared buffers or Redis:
```json
{
  "sender": "Agent_Slug",
  "target": "Aira_Commander",
  "intent": "REPORT_ALPHA | REQUEST_INSTRUCTION | STATUS_UPDATE",
  "payload": {
    "project": "String",
    "signal": "Bullish/Bearish/Neutral",
    "confidence": 0.0-1.0,
    "source_url": "String",
    "raw_data": {}
  },
  "timestamp": "ISO-8601"
}
```

## ⚖️ 3. Authority Hierarchy
1. **Sếp (Human-in-Command)**: Root authority.
2. **Aira (Commander Mode)**: Orchestration and Conflict Resolution.
3. **Sub-agents (Sniper/Sentinel)**: Execution and Data Gathering.

## 🛑 4. Rules of Engagement
- **No Redundancy**: Do not report the same URL twice within 6 hours.
- **Markdown Mandatory**: All reports must be human-readable and use [Name](URL).
- **Silent Failure**: If the Commander does not acknowledge within 3 heartbeats, retry once then drop.

---
*Protocol Version: 1.0.0 (2026-02-15)*
*Author: Aira Commander*

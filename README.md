# 系統晶片設計實習：邏輯合成與多製程 PPA 評估
# (SoC Design Lab: Logic Synthesis & Multi-Corner PPA Analysis)

> 本倉庫收錄國立高雄科技大學（NKUST）系統晶片設計實習（SoC Design Lab）課程專案。專案以階層化算術邏輯單元（ALU）與運算電路為核心，基於 **Synopsys Design Compiler (DC)** 建立標準 ASIC 邏輯合成自動化流程，並針對不同製程庫（如 90nm / 0.18µm 等）與工作環境條件進行時序（Timing）、面積（Area）與功耗的設計權衡（PPA Trade-offs）分析。

---

## 🛠️ 開發環境與 EDA 工具 (Tools & Environment)

* **硬體描述語言**：Verilog HDL (IEEE 1364-2001)
* **邏輯合成工具**：Synopsys Design Compiler (`dc_shell-t`) / Design Vision (GUI)
* **模擬驗證工具**：Synopsys VCS (`simv`) / Verdi
* **腳本語言**：Tcl (Synthesis Scripting)
* **製程庫 (Process Technology Libraries)**：
  * **90nm 製程庫** (多操作條件對比)
  * **UMC 0.18µm Artisan Library** (`slow.db`, `fast.db`, `typical.db`)
  * **DesignWare 運算合成庫** (`dw_foundation.sldb` 等)

---

## ⚙️ 邏輯合成流程 (Synthesis Methodology)

本專案遵循 Synopsys 官方標準 ASIC 前端合成流程（Synthesis Flow），透過 Tcl 腳本實現完全自動化：

```text
+------------------+     +-------------------+
| RTL Source (.v)  | --> | Design Compiler   | <--- Technology Libraries
+------------------+     | (analyze/elaborate|      (.db, DesignWare)
                         |  or read_file)    |
+------------------+     +---------+---------+
| Constraints (.tcl|               |
| & Wire Load Model| --------------+
+------------------+               |
                         +---------v---------+
                         | Design Rule Check |
                         | & Optimization    |
                         +---------+---------+
                                   |
                  +----------------+----------------+
                  |                                 |
        +---------v---------+             +---------v---------+
        | Netlist & SDF     |             | Reports (.rpt)    |
        | (*_SYN.v, *.sdf)  |             | (Area, Timing)    |
        +-------------------+             +-------------------+

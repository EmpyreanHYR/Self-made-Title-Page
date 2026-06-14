# Self-made-Title-Page

期刊投稿用 LaTeX Title Page 模板，兼容 `orcidlink` 宏包，支持中文，面向中国学者。

## 快速开始

**方式一：双击脚本（推荐）**

```
双击 compile.bat
```

自动编译 3 次，清理辅助文件（`.aux`、`.log`、`.out` 等），并打开生成的 PDF。

**方式二：手动编译**

```bash
pdflatex title_page.tex
pdflatex title_page.tex
pdflatex title_page.tex
```

> 需要编译 3 次以正确解析交叉引用和超链接。  
> 依赖宏包：`ctex`、`geometry`、`setspace`、`xcolor`、`hyperref`、`orcidlink`。

---

## 模板结构总览

```
┌─────────────────────────────────┐
│  Title Page                     │  ← 左上角固定标识
│                                 │
│     论文标题（居中、大字号）        │
│                                 │
│   作者 1（左对齐，正文字号）        │
│   作者 2 ...                     │
│   作者 3 ...                     │
├─────────────────────────────────┤
│   ¹ 单位 A 完整地址               │
│   ² 单位 B 完整地址               │
├─────────────────────────────────┤
│   * Corresponding author         │
│     Name: ...                    │
│     Affiliation: ...             │
│     Email: ...                   │
│     Tel: ...                     │
├─────────────────────────────────┤
│   § 现址/永久地址（如有）          │
├─────────────────────────────────┤
│   Declaration of competing       │
│   interests（利益冲突声明）        │
├─────────────────────────────────┤
│   Funding sources（资助来源）      │
└─────────────────────────────────┘
```

---

## 各部分详细说明

### 1. 标题（Title）

通过 `\papertitle` 命令定义论文标题。

```latex
\newcommand{\papertitle}{%
  Your Article Title Here
}
```

**填写要求：**
- 简洁、信息充分，能够准确概括论文核心内容
- 避免缩写和公式（公认缩写如 DNA 除外）
- 首字母大写（Title Case）或句式大写（Sentence case），按目标期刊要求选择

**填写示例：**

```latex
% Title Case 风格
\newcommand{\papertitle}{%
  High-Performance Perovskite Solar Cells via Interface Engineering
}

% Sentence case 风格
\newcommand{\papertitle}{%
  A novel approach to interface engineering for high-performance perovskite solar cells
}
```

---

### 2. 作者（Authors）

使用 `\authoritem` 命令逐行添加作者，每人独占一行（`\\[4pt]` 分隔）。
作者左对齐显示，字号与正文一致（12pt），左上角自动显示 **Title Page** 标识。

```latex
\authoritem[头衔]{姓名全称}{单位字母}{ORCID}{标记}
```

**参数说明：**

| 参数 | 必选 | 说明 | 示例 |
|------|------|------|------|
| `#1` 头衔 | 可选 `[]` | 学术头衔，不需要则留空 `[]` 或省略 | `Prof.`、`Dr.` |
| `#2` 姓名 | 是 | 全称，建议英文拼写后加括号中文 | `Ming Li (李铭)` |
| `#3` 单位字母 | 是 | 与 `\affiliation` 中的字母对应，多个用逗号分隔 | `a`、`a,b` |
| `#4` ORCID | 可选 `{}` | 16 位数字 ID，不需要则留空 `{}` | `0000-0001-2345-6789` |
| `#5` 标记 | 可选 `{}` | 上标标记，不产生脚注 | `*`（通讯作者）、`\S`（已调离） |

**填写示例：**

```latex
% 通讯作者（有头衔、有 ORCID）
\authoritem[Prof.]{Ming Li (李铭)}{a}{0000-0001-2345-6789}{*}
\\[4pt]
% 同单位作者（无头衔、无 ORCID）
\authoritem{Wei Zhang (张伟)}{a}{}{}
\\[4pt]
% 不同单位作者（有头衔、有 ORCID、已调离）
\authoritem[Dr.]{John Smith}{b}{0000-0003-4567-8901}{\S}
\\[4pt]
% 归属两个单位的作者
\authoritem{Xiao Ming (小明)}{a,b}{}{}
```

**渲染效果：**

> **Prof.** **Ming Li (李铭)**<sup>a,\*</sup> [ORCID图标]  
> **Wei Zhang (张伟)**<sup>a</sup>  
> **Dr.** **John Smith**<sup>b,§</sup> [ORCID图标]  
> **Xiao Ming (小明)**<sup>a,b</sup>

---

### 3. 单位（Affiliations）

使用 `\affiliation` 命令定义每个单位的完整地址。

```latex
\affiliation{字母}{完整地址}
```

**填写要求：**
- 字母必须与 `\authoritem` 中的单位字母一致（a、b、c …）
- 必须是完整邮寄地址，包含国家名
- 左对齐显示

**填写示例：**

```latex
\affiliation{a}{%
  School of Materials Science and Engineering,
  Tsinghua University, Beijing 100084, China
}

\affiliation{b}{%
  Department of Engineering Science,
  University of Oxford, Oxford OX1 3PJ, UK
}
```

**渲染效果：**

> <sup>a</sup> School of Materials Science and Engineering, Tsinghua University, Beijing 100084, China  
> <sup>b</sup> Department of Engineering Science, University of Oxford, Oxford OX1 3PJ, UK

---

### 4. 通讯作者（Corresponding Author）

通过 `\corrauthor` 命令在作者列表中声明通讯作者信息，页面下方自动逐行显示。

```latex
\corrauthor{姓名}{单位}{邮箱}{联系电话}
```

**填写要求：**
- 四个参数均为必填，不允许留空
- 邮箱建议使用机构邮箱（避免 QQ/163 等个人邮箱）
- 电话号码需加国际区号

**填写示例：**

```latex
\authoritem[Prof.]{San Zhang (张三)}{a}{0000-0001-2345-6789}{*}
\corrauthor%
  {San Zhang (张三)}%
  {School of Materials Science and Engineering, Tsinghua University, Beijing, China}%
  {san.zhang@tsinghua.edu.cn}%
  {+86-10-62781234}
```

**渲染效果：**

> **\* Corresponding author**  
> Name: San Zhang (张三)  
> Affiliation: School of Materials Science and Engineering, Tsinghua University, Beijing, China  
> Email: `san.zhang@tsinghua.edu.cn`  
> Tel: +86-10-62781234

---

### 5. 现址 / 永久地址（Present/Permanent Address）

当某位作者在研究期间已离开原单位时，使用 `\presentaddress` 声明其现址。

```latex
\presentaddress{完整现地址}
```

**填写要求：**
- 仅在作者已调离、访学或有永久地址变更时使用
- 需配合 `\authoritem` 中的 `\S` 标记使用
- 如果所有作者地址无变更，可删除此命令

**填写示例：**

```latex
\authoritem[Dr.]{Wu Wang (王五)}{b}{0000-0003-4567-8901}{\S}
\presentaddress{Department of Materials Science and Engineering,
                MIT, Cambridge, MA 02139, USA}
```

**渲染效果：**

> § Present/permanent address: Department of Materials Science and Engineering, MIT, Cambridge, MA 02139, USA

---

### 6. 利益冲突声明（Declaration of Competing Interests）

模板已预留注释块，取消注释即可使用，提供两种写法：

**方式一：无利益冲突（大多数期刊适用）**

```latex
\begin{flushleft}
\small
\textbf{Declaration of competing interests}\\[2pt]
The authors declare that they have no known competing financial interests
or personal relationships that could have appeared to influence the work
reported in this paper.
\end{flushleft}
```

渲染效果：

> **Declaration of competing interests**  
> The authors declare that they have no known competing financial interests or personal relationships that could have appeared to influence the work reported in this paper.

**方式二：有具体利益冲突需披露**

```latex
\begin{flushleft}
\small
\textbf{Declaration of competing interests}\\[2pt]
Author A has received research funding from Company X.
Author B serves as a consultant for Company Y.
Author C declares no competing interests.
\end{flushleft}
```

---

### 7. 资助来源（Funding Sources）

模板已预留注释块，取消注释即可使用，提供两种写法：

**方式一：有具体资助信息**

```latex
\begin{flushleft}
\small
\textbf{Funding sources}\\[2pt]
Funding: This work was supported by the National Natural Science Foundation
of China [grant numbers xxxx, yyyy]; the Bill \& Melinda Gates Foundation,
Seattle, WA [grant number zzzz]; and the United States Institutes of Peace
[grant number aaaa].
\end{flushleft}
```

渲染效果：

> **Funding sources**  
> Funding: This work was supported by the National Natural Science Foundation of China [grant numbers xxxx, yyyy]; the Bill & Melinda Gates Foundation, Seattle, WA [grant number zzzz]; and the United States Institutes of Peace [grant number aaaa].

**方式二：无资助**

```latex
\begin{flushleft}
\small
\textbf{Funding sources}\\[2pt]
This research did not receive any specific grant from funding agencies in the
public, commercial, or not-for-profit sectors.
\end{flushleft}
```

---

### 8. 摘要与关键词（可选）

部分期刊要求将摘要和关键词放在标题页，模板已预留注释块，取消注释即可使用。

```latex
\begin{abstract}
Your abstract text here...
\end{abstract}

\noindent\textbf{Keywords:} keyword1; keyword2; keyword3; keyword4
```

---

## 投稿前检查清单

每次投稿前请逐条核对：

- [ ] `Title Page` — 左上角标识自动显示，无需修改
- [ ] `\papertitle` — 标题简洁，无未定义缩写
- [ ] `\authoritem × N` — 作者顺序与投稿系统一致，拼写无误
- [ ] 中文姓名 — 英文拼写后加括号中文，如 `Ming Li (李铭)`
- [ ] 单位字母 a, b, c … — 与 `\affiliation{}` 块一一对应
- [ ] `\affiliation × N` — 完整邮寄地址，含国家名
- [ ] `\corrauthor` — 通讯作者姓名、单位、邮箱、联系电话（逐行显示）
- [ ] `\presentaddress` — 仅作者已调离/访学期间使用，原单位保持为主单位
- [ ] `Competing interests` — 取消对应注释，无冲突选方式一，有冲突选方式二
- [ ] `Funding sources` — 取消对应注释，有资助选方式一，无资助选方式二
- [ ] ORCID — 16 位数字 ID，无则留空 `{}`
- [ ] 编译 — 双击 `compile.bat` 或手动 `pdflatex` × 3

---

## 完整填写示例

```latex
% ---- 标题 ----
\newcommand{\papertitle}{%
  Scalable Fabrication of Perovskite Solar Cells with 25.7\% Efficiency
}

% ---- 作者 ----
\author{%
  \authoritem[Prof.]{Ming Li (李铭)}{a}{0000-0001-2345-6789}{*}
  \corrauthor%
    {Ming Li (李铭)}%
    {School of Materials Science and Engineering, Tsinghua University, Beijing, China}%
    {liming@tsinghua.edu.cn}%
    {+86-10-62781234}
  \\[4pt]
  \authoritem{Wei Zhang (张伟)}{a}{0000-0002-3456-7890}{}
  \\[4pt]
  \authoritem[Dr.]{Anna Schmidt}{b}{0000-0003-4567-8901}{\S}
  \presentaddress{Department of Chemistry, ETH Zurich, Zurich 8093, Switzerland}
  \\[4pt]
  \authoritem{Xiao Hua (小华)}{a,b}{}{}
}

% ---- 单位 ----
\affiliation{a}{%
  School of Materials Science and Engineering,
  Tsinghua University, Beijing 100084, China
}

\affiliation{b}{%
  Department of Physics,
  University of Cambridge, Cambridge CB3 0HE, UK
}
```

---

## License

[MIT](LICENSE)

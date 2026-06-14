# Changelog

本文件记录 Self-made-Title-Page 的主要变更。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)。

## [Unreleased] - 2026-06-15

### Added
- macOS/Linux 编译脚本 `compile.sh`
- `latexmk` 配置文件 `.latexmkrc`
- `CHANGELOG.md`

### Changed
- `.gitignore` 去重，精简配置
- 利益冲突和资助来源区块默认注释，用户按需取消注释
- README 新增 `latexmk` 编译方式和跨平台脚本说明

## [0.2.0] - 2026-06-14

### Added
- 利益冲突声明区块（两种写法）
- 资助来源区块（两种写法）

### Fixed
- 使用 `\gdef` 修复 `\corrauthor` 和 `\presentaddress` 的全局赋值问题
- 论文标题左对齐（原来错误地居中）
- 调整字号层级：Title Page (LARGE) > 论文标题 (large) > 正文 (12pt)

## [0.1.0] - 2026-06-14

### Added
- 初始版本：期刊投稿用 LaTeX Title Page 模板
- `\authoritem` 命令：支持头衔、ORCID、上标标记
- `\affiliation` 命令：单位地址上标字母对应
- `\corrauthor` 命令：通讯作者信息逐行显示
- `\presentaddress` 命令：现址/永久地址
- Windows 编译脚本 `compile.bat`
- 中文支持（ctex 宏包）
- 完整 README 文档与填写示例

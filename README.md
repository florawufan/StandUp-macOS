# StandUp 🪑🧍

<p align="center">
A lightweight macOS menu bar app that helps you build healthier work habits by reminding you to stand up regularly.
</p>

<p align="center">
一个简单、轻量的 macOS 菜单栏久坐提醒工具，帮助你在长时间工作时保持规律站立和休息。
</p>


---

# 中文说明

## 简介

StandUp 是一个运行在 macOS 菜单栏中的轻量级提醒工具。

它通过自定义「工作时间」和「站立时间」，帮助用户减少长时间久坐带来的健康风险，建立更加健康的工作节奏。

设计理念：

> 少打扰，但持续提醒。

StandUp 不会打开复杂的主界面，而是在后台安静运行，在合适的时间通过 macOS 系统通知提醒你站起来休息。


---

## 功能 Features

目前支持：

- 🖥 菜单栏后台运行
- ⏱ 自定义工作时间
- 🧍 自定义站立时间
- ▶️ 开始 / 停止计时
- 🔔 macOS 原生通知提醒
- 🎨 根据当前状态动态切换菜单栏图标
- ⚙️ 设置窗口管理
- 💻 原生 macOS 用户体验


---

## 使用场景

适用于：

- 长时间电脑办公的人群
- 程序员
- 研究人员
- 学生
- 居家办公用户


一个简单的工作循环：

```
工作
 ↓
提醒站立
 ↓
站立休息
 ↓
继续工作
```


---

## 安装方式 Installation

### 方法 1：下载 Release（推荐）

前往 GitHub Releases 页面：

下载：

```
StandUp.zip
```

解压后：

1. 将 `StandUp.app` 拖入 Applications 文件夹
2. 双击打开


首次打开时，macOS 可能提示：

> “无法验证开发者”

这是因为 App 尚未经过 Apple Developer 签名。

解决方法：

1. 右键点击 App
2. 选择「打开」
3. 确认打开


---

### 方法 2：从源码运行

环境要求：

- macOS
- Xcode 15+
- Swift


步骤：

1. Clone 项目：

```bash
git clone https://github.com/yourname/StandUp.git
```

2. 使用 Xcode 打开：

```
StandUp.xcodeproj
```

3. 点击 Run。


---

## 使用方法

1. 打开 StandUp
2. 点击菜单栏图标
3. 设置工作时间和站立时间
4. 点击「开始计时」
5. 到时间后接收系统提醒


---

## 技术栈 Tech Stack

本项目使用：

- Swift
- SwiftUI
- macOS MenuBarExtra
- UserNotifications Framework


核心架构：

```
MenuBarExtra
      |
      ↓
 MenuBarView
      |
      ↓
 TimerManager
      |
      ↓
 NotificationManager
      |
      ↓
 macOS Notification System
```


---

## 项目结构

```
StandUp
│
├── StandUpApp.swift
├── MenuBarView.swift
├── TimerManager.swift
├── NotificationManager.swift
├── SettingsManager.swift
├── SettingsView.swift
│
└── Assets.xcassets
```


---

## 开发背景

StandUp 是一个个人开发项目，用于探索：

- macOS 原生应用开发
- SwiftUI 用户界面设计
- 菜单栏应用架构
- 从产品需求到 MVP 实现的完整流程


---

# English Description 

## Introduction

StandUp is a lightweight macOS menu bar application designed to help users reduce sedentary time and build healthier working habits.

By allowing users to customize working and standing intervals, StandUp provides simple and non-intrusive reminders through native macOS notifications.

The design philosophy is:

> Minimal interruption, consistent reminder.


---

## Features

- 🖥 Runs as a macOS menu bar application
- ⏱ Customizable work intervals
- 🧍 Customizable standing intervals
- ▶️ Start / stop timer
- 🔔 Native macOS notification reminders
- 🎨 Dynamic menu bar status icons
- ⚙️ Settings management
- 💻 Native SwiftUI experience


---

## Use Cases

StandUp is suitable for:

- Developers
- Researchers
- Students
- Remote workers
- Anyone who spends long hours at a computer


---

## Installation

### Download Release

Download the latest release from GitHub Releases:

```
StandUp.zip
```

Then:

1. Extract the zip file
2. Move `StandUp.app` to Applications
3. Launch the application


On the first launch, macOS may show a security warning because the app is not signed with an Apple Developer certificate.

To open:

1. Right-click the app
2. Select "Open"
3. Confirm


---

### Run from Source

Requirements:

- macOS
- Xcode 15+
- Swift


Steps:

Clone the repository:

```bash
git clone https://github.com/yourname/StandUp.git
```

Open:

```
StandUp.xcodeproj
```

with Xcode and run the project.


---

## Usage

1. Launch StandUp
2. Click the menu bar icon
3. Configure work and standing duration
4. Start the timer
5. Receive reminders when it is time to stand


---

## Tech Stack

Built with:

- Swift
- SwiftUI
- macOS MenuBarExtra
- UserNotifications Framework


Architecture:

```
MenuBarExtra
      |
      ↓
 MenuBarView
      |
      ↓
 TimerManager
      |
      ↓
 NotificationManager
      |
      ↓
 macOS Notification System
```


---

## Project Structure

```
StandUp
│
├── StandUpApp.swift
├── MenuBarView.swift
├── TimerManager.swift
├── NotificationManager.swift
├── SettingsManager.swift
├── SettingsView.swift
│
└── Assets.xcassets
```


---

## Development Background

StandUp is a personal project exploring:

- Native macOS application development
- SwiftUI interface design
- Menu bar application architecture
- Building an MVP from product idea to implementation


---

## License

MIT License

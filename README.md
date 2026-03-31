# SwiftUI macOS Hello World

## 简介

这是 macOS SwiftUI 开发的最简单入门示例，展示如何创建一个带窗口的 macOS 应用。

## 快速开始

### 环境要求

- macOS 14.0 (Sonoma) 或更高版本
- Xcode 15.0+
- XcodeGen (`brew install xcodegen`)

### 运行

```bash
cd swiftui-macos-hello-world-demo

# 生成 Xcode 项目
xcodegen generate

# 用 Xcode 打开
open SwiftUIMacOSHelloWorld.xcodeproj

# 在 Xcode 中按 Cmd+R 运行
```

## 概念讲解

### 第一部分：@main 入口点

SwiftUI 使用 `@main` 属性标记应用入口点：

```swift
@main
struct HelloWorldApp: App {
    // ...
}
```

这替代了传统的 `main.swift` 和 `NSApplicationMain`。

### 第二部分：App 协议

每个 SwiftUI 应用都需要一个实现 `App` 协议的结构体：

```swift
@main
struct HelloWorldApp: App {
    var body: some Scene {
        // 返回一个 Scene
    }
}
```

`App` 协议的 `body` 返回 `some Scene`。

### 第三部分：Window 窗口

`Window` 是 Scene 的一种，创建应用窗口：

```swift
Window("Hello World", id: "main") {
    ContentView()
}
```

- 第一个参数 `("Hello World")` 是窗口标题
- `id: "main"` 是窗口的唯一标识符
- 大括号 `{}` 里面放窗口的内容视图

### 第四部分：ContentView 内容视图

`ContentView` 是窗口内显示的主要内容：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

`View` 协议要求返回 `some View`（某种视图类型）。

### 第五部分：Text 显示文字

`Text` 是 SwiftUI 的基础组件，用于显示文字：

```swift
Text("Hello, World!")
    .font(.largeTitle)
    .padding()
```

- `.font(.largeTitle)` 设置大标题字体
- `.padding()` 添加内边距

## 完整示例

```swift
import Cocoa

@main
struct HelloWorldApp: App {
    var body: some Scene {
        Window("Hello World", id: "main") {
            ContentView()
        }
        .defaultSize(width: 400, height: 300)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .padding()
    }
}
```

## 完整讲解（中文）

这是一个最简单的 macOS SwiftUI 应用。

### 运行原理

1. `HelloWorldApp` 结构体用 `@main` 标记为程序入口
2. `App` 协议的 `body` 属性返回一个 `Scene`（场景）
3. `Window` 创建一个窗口，标题是 "Hello World"
4. 窗口内容是 `ContentView`
5. `ContentView` 返回一个 `Text` 显示 "Hello, World!"

### 窗口大小

`.defaultSize(width: 400, height: 300)` 设置窗口默认大小为 400x300 像素。

### 下一步

接下来可以学习：
- 如何在 ContentView 中添加更多视图组件
- 如何使用 HStack、VStack 布局多个组件

<!-- Please put your translation here and with the same style in README.md -->
## 背景与目标

我们将构建一个简单的计算器，能够处理4种基本运算(`+`, `-` , `*`, `/`)。该程序将要求用户输入2个数字和4个运算符之一，以便能够执行简单的计算并将结果显示给用户。

## 指引

这个挑战应该花费你**30分钟 🕒**

1.让我们和老师一起启动挑战（现场编码 💻）并**一起写下伪代码**。
2.然后你自己花10分钟尝试找出解决方案。
3.你将和老师一起更正它（同样是现场编码 💻）。

## 伪代码

我们将总是从`interface.rb`文件开始。这就是你将启动（用`ruby interface.rb`）运行你的程序所用的文件。从界面开始总是很直观的，问问你自己**“当我启动我的程序时，应该发生些什么？”**

经常和老师一起启动挑战并写下*伪代码*。例如：

```ruby
# interface.rb

# Pseudo-code (what are the steps in plain english):
# 1. Say hello to the user
# 2. Ask user for the first number
# 3. Get user answer
# 4. Ask user for second number
# 5. etc.
```

**写出伪代码就是这个任务的80%！**然后将英文翻译为ruby是很容易的部分。重新启动活动中，在**每个**挑战中都采取这个伪代码方法。

## 第一步 - 笨计算器

使用命令行界面，构建一个简易的计算器：
- 首先仅处理加法
- 然后所有其他运算（乘法，减法，除法）。

它应该像这样运行：

```bash
ruby interface.rb

> Enter a first number:
> 6
> Enter a second one:
> 8
> Choose operation [+][-][*][/]
> *
> Result: 48
```

重新启动阶段的的练习都没有测试，但你仍可以运行`rake`去检查你的代码的样式。

## 第二步 - 让它循环

每次程序结束后都要重新启动计算器，这有点痛苦。想象一个真正的计算器，每次运算后都要关机 😊

让它循环！想想什么时候你想要程序停止循环。

```bash
ruby interface.rb

> Enter a first number:
> 6
> Enter a second one:
> 8
> Which operation [+][-][x][/]
> x
> Result: 48
> Do you want to calculate again? [Y/N]
> Y
> Enter a first number:
> 55
> Enter a second one:
> 2
> Which operation [+][-][x][/]
> -
> Result: 53
> Do you want to calculate again? [Y/N]
> N
```

## 第三步 - 重构你的代码

- 真正属于用户界面（`gets`和`puts`）的代码是什么？
- 不属于用户界面的代码是什么？

尝试在老师的帮助下重构代码。例如，你可以创建一个新的`calculator.rb`文件：

```ruby
# calculator.rb
def calculate(first_number, second_number, operator)
  # compute and return result
end
```

并在你的用户界面中使用它：

```ruby
# interface.rb
require_relative "calculator"

# [...]
```



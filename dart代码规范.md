## Flutter代码规范

#### 写在最前面

- 不要写 `new` ，在 Dart 2.x 中已不建议继续使用 `new` 关键字；

- 使用 `flutter format` 、 `dartfmt` 或者 `dart format` 对代码进行格式化；

- 在较长代码和嵌套中使用尾逗号进行拆分，防止超过80字或出现 `))))` ；

- 避免出现任何警告；

- 避免一行超过80个字符。如果超过了，请检查是否有 `))))` ；

- 在项目排期允许的情况下，将所有 packages 保持为可使用的最新版本；

- 推荐使用 Flutter 官方仓库下的 `analysis_options.yaml` 进行基本代码规范约束。

- 在项目排期允许的情况下，将 Flutter SDK 保持为最新的**稳定版本**；

#### 1.使用 `大驼峰` 风格命名类型

- Classes（类名）、 enums（枚举类型）、 typedefs（类型定义）、扩展方法(extension)、以及 type parameters（类型参数）应该把每个单词的首字母都大写（包含第一个单词），不使用分隔符

  ```dart
  class SliderMenu { ... }
  
  class HttpRequest { ... }
  
  typedef Predicate<T> = bool Function(T value);
  
  extension MyFancyList<T> on List<T> { ... }
  ```

#### 2.在`库`，`包`，`文件夹`，`源文件`中使用 `小写+下划线` 方式命名

```dart
good
  library peg_parser.source_scanner;

  import 'file_system.dart';
  import 'slider_menu.dart';
	import 'dart:math' as math;
	import 'package:angular_components/angular_components' as angular_components;
```



```dart
bad
	library pegparser.SourceScanner;

  import 'file-system.dart';
  import 'SliderMenu.dart';
	import 'dart:math' as Math;
	import 'package:angular_components/angular_components' as angularComponents;
```

#### 3.使用`小驼峰`风格命名类型

- `类成员`、`顶级定义`、`变量`、`参数`以及`命名参数`等 *除了*第一个单词，每个单词首字母都应大写，并且不使用分隔符

- 使用`小驼峰`来命名`常量`

```dart
good 
  const pi = 3.14;
  const defaultTimeout = 1000;
  final urlScheme = RegExp('^([a-z]+):');

  class Dice {
    static final numberGenerator = Random();
  }
```

```dart
bad
  const PI = 3.14;
  const DefaultTimeout = 1000;
  final URL_SCHEME = RegExp('^([a-z]+):');

  class Dice {
    static final NUMBER_GENERATOR = Random();
	}
```

#### 4. 把超过两个字母的首字母大写缩略词和缩写词当做一般单词来对待

```dart
good 
  class HttpConnection {}
  class DBIOPort {}
  class TVVcr {}
  class MrRogers {}

  var httpRequest = ...
  var uiHandler = ...
  Id id;
```

```dart
bad
  class HTTPConnection {}
  class DbIoPort {}
  class TvVcr {}
  class MRRogers {}

  var hTTPRequest = ...
  var uIHandler = ...
  ID iD;
```

#### 5.**不要**使用前缀字母

```dart
good 
  defaultTimeout
```

```dart
bad
  kDefaultTimeout
```

#### 6. 顺序

- 把`"dart:"`导入语句放到其他导入语句之前
- 把`"package:"`导入语句放到项目相关导入语句之前
- 把导出`export`语句作为一个单独的部分放到所有导入语句之后
- 按照字母顺序来排序每个部分中的语句

```dart
good 
  import 'dart:async';
  import 'dart:html';

  import 'package:bar/bar.dart';
  import 'package:foo/foo.dart';
	
	import 'util.dart';

	export 'src/error.dart';
```

```dart
bad 
  import 'src/error.dart';
  export 'src/error.dart';
  import 'src/foo_bar.dart';
```

#### 7.格式化

- 使用 `dartfmt`格式化你的代码

#### 8.所有流控制结构，请使用大括号

这样做可以避免悬浮的else问题

```dart
good 
  if (isWeekDay) {
	  print('Bike to work!');
  } else {
    print('Go dancing or read a book!');
  }
```

一个if语句没有else子句，其中整个if语句和then主体都适合一行。在这种情况下，如果你喜欢的话，你可以去掉大括号

```dart
good 
  if (arg == null) return defaultValue;
```

如果流程体超出了一行需要分划请使用大括号

```dart
good
  if (overflowChars != other.overflowChars) {
    return overflowChars < other.overflowChars;
  }
```

```dart
bad 
  if (overflowChars != other.overflowChars)
  	return overflowChars < other.overflowChars;
```

#### 9.注释

- **要**像句子一样来格式化注释

```dart
good
  // Not if there is nothing before it.
	if (_chunks.isEmpty) return false;
```

- **不要**使用块注释作用作解释说明

```dart
good 
  greet(name) {
    // Assume we have a valid name.
    print('Hi, $name!');
  }
```

```dart
bad
  greet(name) {
    /* Assume we have a valid name. */
    print('Hi, $name!');
  }
```

- 使用` ///` 文档注释来注释成员和类型

```dart
good   
	/// The number of characters in this chunk when unsplit.
  int get length => ...
```

```dart
bad 
  // The number of characters in this chunk when unsplit.
	int get length => ...
```

- 使用方括号在文档注释中引用作用域内的标识符

  > 如果给变量，方法，或类型等名称加上方括号，则 dartdoc 会查找名称并链接到相关的 API 文档。括号是可选的，但是当你在引用一个方法或者构造函数时，可以让注释更清晰。

```dart
good 
  /// Throws a [StateError] if ...
	/// similar to [anotherMethod()], but ..
```

- 把注释文档放到注解之前

```dart
good
  /// A button that can be flipped on and off.
  @Component(selector: 'toggle')
  class ToggleComponent {}
```

```dart
bad
  @Component(selector: 'toggle')
  /// A button that can be flipped on and off.
  class ToggleComponent {}
```

#### 10. 字符串

- 使用相邻字符串的方式连接字面量字符串

  > 如果你有两个字面量字符串（不是变量，是放在引号中的字符串），你不需要使用 `+` 来连接它们。应该想 C 和 C++ 一样，只需要将它们挨着在一起就可以了。这种方式非常适合不能放到一行的长字符串的创建

```dart
good 
  raiseAlarm(
    'ERROR: Parts of the spaceship are on fire. Other '
    'parts are overrun by martians. Unclear which are which.');
```

```dart
bad
  raiseAlarm('ERROR: Parts of the spaceship are on fire. Other ' +
    'parts are overrun by martians. Unclear which are which.');
```

- 使用插值的形式来组合字符串和值

```dart
good
  'Hello, $name! You are ${year - birth} years old.';
```

```dart
bad
  'Hello, ' + name + '! You are ' + (year - birth).toString() + ' y...';
```

- 避免在字符串插值中使用不必要的大括号

```dart
good
  var greeting = 'Hi, $name! I love your ${decade}s costume.';
```

```dart
bad 
  var greeting = 'Hi, ${name}! I love your ${decade}s costume.';
```

#### 11.集合

- `List` , `Set` , `Map` 使用字面量构造实例,构造时避免为null

```dart
good 
   var points = <String>[];
   var addresses = <String,String>{};
   var lines = <Lines>[];
```

```dart
bad
  var points = List();
  var addresses = Map();
```

- 使用`.isEmpty`和`.isNotEmpty`而不是`.length`来判断集合是否为空

```dart
good
  if (lunchBox.isEmpty) return 'so hungry...';
	if (words.isNotEmpty) return words.join(' ');
```

```dart
bad
  if (lunchBox.length == 0) return 'so hungry...';
	if (!words.isEmpty) return words.join(' ');
```

- 考虑使用高阶方法转换序列

> 如果有一个集合，并且希望从中生成一个新的修改后的集合，那么使用.map()、.where()和Iterable上的其他方便的方法通常更短，也更具有声明性

```dart
ar aquaticNames = animals
      .where((animal) => animal.isAquatic)
      .map((animal) => animal.name);
```

- 避免使用带有函数字面量的Iterable.forEach()

> 在Dart中，如果你想遍历一个序列，惯用的方法是使用循环

```dart
good 
  for (var person in people) {
    ...
  }

bad 
  people.forEach((person) {
    ...
  });
```

#### 12.变量

- 不要使用 `var` , `Object` ，**在确定变量时必须确定它的类型**
- 不要使用**魔数**。如果它是一种类型表示，直接将它们**定义为枚举**
- 空安全 除了 Model 以外，不要滥用 `?` ，在声明时就确定是否可空
- 在声明时将类型写明，**包括泛型**
  - `Map<String, dynamic> json`
  - `Column(children: <Widget>[])`

- 不要为字段创建不必要的`getter`和`setter`方法

> 在 Java 和 C# 中，通常情况下会将所有的字段隐藏到 getter 和 setter 方法中（在 C# 中被称为属性），即使实现中仅仅是指向这些字段。在这种方式下，即使你在这些成员上做多少的事情，你也不需要直接访问它们。这是因为，在 Java 中，调用 getter 方法和直接访问字段是不同的。在 C# 中，访问属性与访问字段不是二进制兼容的。
>
> Dart 不存在这个限制。字段和 getter/setter 是完全无法区分的。你可以在类中公开一个字段，然后将其包装在 getter 和 setter 中，而不会影响任何使用该字段的代码。

```dart
good
  class Box {
    var contents;
  }
```

```dart
bad
  class Box {
    var _contents;
    get contents => _contents;
    set contents(value) {
      _contents = value;
    }
  }
```

- 考虑多简单的成员使用`=>`

```dart
good
  double get area => (right - left) * (bottom - top);

	String capitalize(String name) =>
   	 '${name[0].toUpperCase()}${name.substring(1)}';
```

> *编写*代码的人似乎很喜欢 `=>` 语法，但是它很容易被滥用，最后导致代码不容易被*阅读*。如果你有很多行声明或包含深层的嵌套表达式（级联和条件运算符就是常见的罪魁祸首），你以及其他人有谁会愿意读这样的代码！你应该换做使用代码块和一些语句来实现。

```dart
good
  Treasure? openChest(Chest chest, Point where) {
    if (_opened.containsKey(chest)) return null;

    var treasure = Treasure(where);
    treasure.addAll(chest.contents);
    _opened[chest] = treasure;
    return treasure;
	}
```

```dart
bad
  Treasure? openChest(Chest chest, Point where) => _opened.containsKey(chest)
    	? null
    	: _opened[chest] = (Treasure(where)..addAll(chest.contents));
```

- 不要显示地将变量初始化为`null`

> 在dart中,未显式初始化的变量或字段自动被初始化为null。不要多余赋值null

```dart
good 
  int _nextId;
  
  class LazyId {
    int _id;
  
    int get id {
      if (_nextId == null) _nextId = 0;
      if (_id == null) _id = _nextId++;
  
      return _id;
    }
  }
```

```dart
bad 
  int _nextId = null;
  
  class LazyId {
    int _id = null;
  
    int get id {
      if (_nextId == null) _nextId = 0;
      if (_id == null) _id = _nextId++;
  
      return _id;
    }
  }
```

#### 13.异步

- 优先使用`async/await`代替原始的`futures`

```dart
good 
  Future<int> countActivePlayers(String teamName) async {
    try {
      var team = await downloadTeam(teamName);
      if (team == null) return 0;

      var players = await team.roster;
      return players.where((player) => player.isActive).length;
    } catch (e) {
      log.error(e);
      return 0;
    }
  }
```

```dart
bad
  Future<int> countActivePlayers(String teamName) {
    return downloadTeam(teamName).then((team) {
      if (team == null) return Future.value(0);

      return team.roster.then((players) {
        return players.where((player) => player.isActive).length;
      });
    }).catchError((e) {
      log.error(e);
      return 0;
    });
	}
```

- 初始化异步方法

  > 很多需要初始化的代码是异步方法,很多情况下的代码是在构造方法中进行初始化的,而构造方法是同步代码,同步代码执行完后异步代码可能并未开始执行,而调用了其他同步方法导致异常,尽量将初始化放在app启动时进行

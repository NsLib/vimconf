
[toc]

## 我的vim配置

```
https://github.com/NsLib/vimconf
```

## 目录结构

```
.
├── 3rd_html                    # 下载下来的HTML文件存储在这里
├── clean.sh                    # 清除所有生成的HTML(需更改路径)
├── diary                       # 请忽略
├── font                        # 请忽略
├── html                        # vimwiki生成的html存放在这里(里面还有用到的css/js/images等)
├── images -> html/images       # wiki中需要引用的图片存储在这里
├── search                      # 这里面是wiki用来关键字搜索的server程序(需要改路径)
├── template                    # 请忽略
```

## 要修改的地方

请grep并将 `<path_to_your_vimwiki_dir>` 替换为你实际的vimwiki路径

## vimwiki内部链接

* [[子页面1]]
* [[子页面2]]

## HTML链接

### 本地静态的HTML

[我的博客](../3rd_html/myblog/一个人的战争 - 博客频道 - CSDN.NET.html)

### 外部HTML

[我的博客链接](http://blog.csdn.net/mdl13412?viewmode=contents)

### 外部资源

同样是 `Markdown` 的链接语法，我平时还用来引用pdf等

## 图片

### 本地图片

![我的头像](../images/myavata/pac-man.png)

### 外部图片

![博客图片](http://img.blog.csdn.net/20140606230410906?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTURMMTM0MTI=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## 我写的代码块扩展

### 代码块

```
def foo():
    return True
```

```line
def bar():
    '''
        params      None
    '''
    return u'带行号'
```

### 流程图

> 语法请参考 [http://adrai.github.io/flowchart.js/](http://adrai.github.io/flowchart.js/)

```flow
st=>start: Start:>http://www.google.com[blank]
e=>end:>http://www.google.com
op1=>operation: My Operation
sub1=>subroutine: My Subroutine
cond=>condition: Yes 
or No?:>http://www.google.com
io=>inputoutput: catch something...

st->op1->cond
cond(yes)->io->e
cond(no)->sub1(right)->op1
```

### 时序图

> 语法请参考 [http://bramp.github.io/js-sequence-diagrams/](http://bramp.github.io/js-sequence-diagrams/)

```seq
Andrew->China: Says Hello
Note right of China: China thinks\nabout it
China-->Andrew: How are you?
Andrew->>China: I am good thanks!
```

## 我写的简单的TODO List扩展

* [ ] 读书
    - [ ] APUE3
    - [ ] TLPI
    - [x] UNP
* [x] 游戏
    - [x] MineCraft
    - [x] 鬼泣
    - [x] 生化危机

# LVAnimator

Swift4.0版本，使用iOS自定义转场动画做的抽屉效果，不再使用VC隐藏背后的方式，节省内存空间，本Demo主要做为例子展示，将一些侧滑筛选浮窗，上拉分享浮窗也都使用转场动画完成，并可自定义转场动画。

### 示例效果

![image](https://raw.githubusercontent.com/grvlv/LVAnimator/master/Example.gif)

# 使用方式
### 1、初始化得到动画对象
```
let animator = LVAnimator()
```

### 2、push转场简单使用
```
animator.setup(vc: self) { (fromVC, toVC, operation) -> ((duration: TimeInterval, delegate: LVTransitionAnimationDelegate)?) in
    //动画时长，自定义动画
    return (1, YourPushAnimation())
}
```

### 3、viewWillAppear注册代理
```
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    animator.registerDelegate(vc: self)
}
```

### 4、present动画需特别处理
```
//present的vc
let vc = LVMineVC()
//present转场比较特殊，需将跳转的vc代理指向当前动画对象
animator.registerDelegate(vc: vc)
present(vc, animated: true)
```


***有问题可以加QQ:1254129365交流学习***

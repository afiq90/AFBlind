# AFBlind
Blinds Animation Using UIKit Dynamics in Swift

#Description
AFBlinds is a simple blinds animation implementing in Swift using the UIKit Dynamics Framework.

#Usage
```
NSArray *optionsArray = @[@"aisya umairah",@"aisya sofea",@"what a lovely kids",@"kambing"];
    AFBlinds *afBlind = [[AFBlinds alloc] initWithOptions:optionsArray];
    afBlind.tag = 100;
    afBlind.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    [self.view addSubview:afBlind];
}
```

#Demo
![alt tag](https://camo.githubusercontent.com/182efa2c6f5b362d7d4e56cab9e6487ffdeb10ce/68747470733a2f2f646c2e64726f70626f7875736572636f6e74656e742e636f6d2f752f32303131363433342f415a426c696e64732e676966)


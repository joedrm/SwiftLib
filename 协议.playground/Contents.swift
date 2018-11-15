//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


protocol LXFProtocol {
    func eat()
}



protocol Eatable {
    
}

extension Eatable {
    func eat() {
        //
    }
}

// 约束
//extension Eatable where Self : UIViewController {
//    func eat() {
//        //
//        view.backgroundColor = UIColor.red
//    }
//}

class Person: NSObject, LXFProtocol {
    func eat() {
        //
    }
}

class Dog: NSObject, Eatable {
    
    func eat() {
        print("dog eat")
    }
}

class Robot: NSObject {
    
}

class MyViewController : UIViewController {
    
    override func viewDidLoad() {
        let dog = Dog()
        dog.eat()
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


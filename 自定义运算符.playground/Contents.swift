import UIKit


/**
 
 操作符类型
 中置运算符(infix operator) e.g. +、-、/、*
 前置运算符(prefix operator) e.g. --、++
 后置运算符(postfix operator) e.g. --、++
 
 */


/// 自定义操作符

/// ---------------- 中置运算符

/// 定义优先级组
precedencegroup MyPrecedence {
    
    // higherThan: AdditionPrecedence   // 优先级,比加法运算高
    lowerThan: AdditionPrecedence       // 优先级, 比加法运算低
    associativity: none                 // 结合方向:left, right or none
    assignment: false                   // true=赋值运算符,false=非赋值运算符
}

infix operator +++: MyPrecedence        // 继承 MyPrecedence 优先级组
// infix operator +++: AdditionPrecedence // 也可以直接继承加法优先级组(AdditionPrecedence)或其他优先级组
func +++(left: Int, right: Int) -> Int {
    
    return left+right*2
}

print(2+++3)



/// ---------------- 前置运算符

prefix operator ==+
prefix func ==+(left: Int) -> Int {
    
    return left*2
}


print(==+10)



/// ---------------- 后置运算符
postfix operator +==
postfix func +==(right: Int) -> Int {
    
    return right*3
}

print(20+==)

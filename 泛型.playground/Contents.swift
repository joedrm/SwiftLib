import UIKit

var str = "SE-0148使用泛型下标操作符"

struct JSON {
    
    private var data: [String: Any]
    
    init(data: [String: Any]) {
        self.data = data
    }
    
    //    // in swift 3
    //    subscript(key: String) -> Any? {
    //
    //        return data[key]
    //    }
    
    // in swift 4
    subscript<T>(key: String) -> T? {
        return data[key] as? T
    }
    
}

let json = JSON(data: [
    "title": "Generic subscript",
    "duration": 300
    ])


//// in swift 3
//let title: String? = json["title"] as? String
//let duration: Int? = json["duration"] as? Int


// in swift 4
let title: String? = json["title"]
let duration: Int? = json["duration"]

print(title ?? "0")
print(duration ?? 0)
   

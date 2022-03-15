//
//  VM.swift
//  AnneGoeKitExample
//
//  Created by Littlefox iOS Developer on 2022/03/04.
//

import Foundation
import UIKit

struct AlertData {
    var btnTitle: String
    var action: ((UIAlertAction)->Void)?
}

enum AlertKind{
    case one(desc: String, btnText: String,action: ((UIAlertAction)->Void)? = nil)
    case two(desc: String, btnText: String, actionBtnText: String, action1: ((UIAlertAction)->Void)? = nil, action2: ((UIAlertAction)->Void)?)
    case two_with_text(desc: String, btnText: String, actionBtnText: String, action1: ((UIAlertAction)->Void)? = nil, action2: ((UIAlertAction)->Void)?)
    case no
    case twoWithTextField(desc: String, btnText: String, actionBtnText: String, placeHolder: String?, isSecureTextEntry: Bool?, action1: ((UIAlertAction)->Void)? = nil, action2: ((UIAlertAction)->Void)? = nil)
}

class VM: NSObject{
    var isClearAlerts: Box<Bool> = Box(false)
    var showAlerts: Box<AlertKind> = Box(.no)
    var isSpinner: Box<(show: Bool, isCanTouched: Bool)> = Box((false, false))
    
    public func sum(a: Int, b: Int) -> Int{
        return a + b
    }
}

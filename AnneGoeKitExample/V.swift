//
//  V.swift
//  AnneGoeKitExample
//
//  Created by Littlefox iOS Developer on 2022/03/04.
//

import Foundation
import UIKit



protocol V: UIView {
    var navigatiionBarEndPosY: CGFloat {get}
    var navigatiionBarHeight: CGFloat {get}
}

extension V{
    var navigatiionBarEndPosY: CGFloat {
        if #available(iOS 13.0, *) {
            return (UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (UINavigationController().navigationBar.frame.height)
        } else {
            return UIApplication.shared.statusBarFrame.size.height + (UINavigationController().navigationBar.frame.height)
        }
    }
    
    var navigatiionBarHeight: CGFloat {
        UINavigationController().navigationBar.frame.height
    }
}



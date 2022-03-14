//
//  AKGDI.swift
//  AnneGeoKit
//
//  Created by Littlefox iOS Developer on 2022/03/04.
//

import Foundation
import UIKit

//MARK: -- AKGDI
public protocol AGKDI: Any{
    
    associatedtype T: AGKView
    
    var view: T {get set}
    var endx: CGFloat {get}
    var endy: CGFloat {get}
    var origin: CGPoint {get}
    var size: CGSize {get}
    var center: CGPoint {get}
    
    init(view: T)
    
}

public extension AGKDI{
    
    var endy: CGFloat {
        self.view.frame.size.height + self.view.frame.origin.y
    }
    
    var endx: CGFloat {
        self.view.frame.size.width + self.view.frame.origin.x
    }
    
    var origin: CGPoint {
        self.view.frame.origin
    }
    
    var size: CGSize {
        self.view.frame.size
    }
    
    var center: CGPoint {
        self.view.center
    }

    func make(by closure: (_ maker: AGKFrameMaker) -> Void) {
        AGKFrameMaker.make(item: self.view, closure: closure)
    }
}








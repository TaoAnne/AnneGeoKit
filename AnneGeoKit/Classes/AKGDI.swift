//
//  AKGDI.swift
//  AnneGeoKit
//
//  Created by Littlefox iOS Developer on 2022/03/04.
//

import Foundation
import UIKit
//

public extension AGKView{
    var agk: AKG{
        AKG(view: self)
    }
}

//MARK: -- AKGDI
public protocol AKGDI: Any{
    
    associatedtype T: AGKView
    
    var view: T {get set}
    var endx: CGFloat {get}
    var endy: CGFloat {get}
    var origin: CGPoint {get}
    var size: CGSize {get}
    var center: CGPoint {get}
    
    init(view: T)
    
}

public extension AKGDI{
    
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

    func makeFrame(by closure: (_ maker: AKGFrameMaker) -> Void) {
        AKGFrameMaker.makeFrame(item: self.view, closure: closure)
    }
    
    func animFrame(option: AKGAniOption, by closure: @escaping (_ make: AKGFrameMaker) -> Void, completed: (() -> Void)? = nil) {
        AKGFrameMaker.animFrame(item: self.view, option: option, closure: closure, completed: completed)
    }
}

public struct AKG: AKGDI{
    public var view: AGKView
    public init(view: AGKView){
        self.view = view
    }
}


//MARK: -- AKGFrameMakerDI
public protocol AKGFrameMakerDI: Any{
    
    
    var w: CGFloat {get set}
    var h: CGFloat {get set}
    var x: CGFloat {get set}
    var y: CGFloat {get set}
    var cx: CGFloat {get set}
    var cy: CGFloat {get set}
    
    var backColor: UIColor {get set}
//    var image: 
    
    var item: AGKView {get set}
    
    init(item: AGKView)
}

public extension AKGFrameMakerDI{
    var w: CGFloat {
        get {
            return self.item.frame.size.width
        }
        nonmutating set {
            self.item.frame.size.width = newValue
        }
    }
    
    var h: CGFloat {
        get {
            return self.item.frame.size.height
        }
        nonmutating set {
            self.item.frame.size.height = newValue
        }
    }
    
    var x: CGFloat {
        get {
            return self.item.frame.origin.x
        }
        nonmutating set {
            self.item.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.item.frame.origin.y
        }
        nonmutating set {
            self.item.frame.origin.y = newValue
        }
    }
    
    var cx: CGFloat {
        get {
            return self.item.center.x
        }
        nonmutating set {
            self.item.center.x = newValue
        }
    }
    
    
    var cy: CGFloat {
        get {
            return self.item.center.y
        }
        nonmutating set {
            self.item.center.y = newValue
        }
    }
    
    var backColor: UIColor{
        get{
            self.item.backgroundColor ?? .clear
        }
        nonmutating set{
            self.item.backgroundColor = newValue
        }
    }

    static func makeFrame(item: AGKView, closure: (_ make: AKGFrameMaker) -> Void) {
        let maker = AKGFrameMaker(item: item)
        closure(maker)
    }
    
    static func animFrame(item: AGKView, option: AKGAniOption, closure: @escaping (_ make: AKGFrameMaker) -> Void, completed: (() -> Void)? = nil) {
        let maker = AKGFrameMaker(item: item)
        UIView.animate(withDuration: option.duration, delay: option.delay, options: option.acts) {
            closure(maker)
        } completion: { _ in
            completed?()
        }
    }
    
}

public struct AKGFrameMaker: AKGFrameMakerDI{
    public var item: AGKView
    public init(item: AGKView){
        self.item = item
    }
}

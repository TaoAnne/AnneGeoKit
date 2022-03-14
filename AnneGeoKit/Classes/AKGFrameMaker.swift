//
//  AKGFrameMaker.swift
//  AnneGeoKit
//
//  Created by Littlefox iOS Developer on 2022/03/08.
//

import Foundation

public struct AGKFrameMaker{
    
    public var w: AGKFrameMakerEdit {
        self.makeActionWithAttributes(.width)
    }
    
    public var h: AGKFrameMakerEdit {
        self.makeActionWithAttributes(.height)
    }
    
    public var x: AGKFrameMakerEdit {
        self.makeActionWithAttributes(.x)
    }
    
    public var y: AGKFrameMakerEdit {
        self.makeActionWithAttributes(.y)
    }
    
    public var cx: AGKFrameMakerEdit {
        self.makeActionWithAttributes(.centerX)
    }
    
    public var cy: AGKFrameMakerEdit {
        self.makeActionWithAttributes(.centerY)
    }
    
    public var backColor: AGKFrameMakerEdit {
        self.makeActionWithAttributes(.backColor)
    }
    
    public var fontData: AGKFrameMakerEdit {
        self.makeActionWithAttributes(.fontData)
    }
    
    @discardableResult
    func makeActionWithAttributes(_ attributes: AGKAttribute) -> AGKFrameMakerEdit {
        return AGKFrameMakerEdit(item: self.item, attribute: attributes)
    }

    public var item: AGKView
    public init(item: AGKView){
        self.item = item
    }
}

extension AGKFrameMaker{
    static func make(item: AGKView, closure: (_ maker: AGKFrameMaker) -> Void) {
        let maker = AGKFrameMaker(item: item)
        closure(maker)
    }
}

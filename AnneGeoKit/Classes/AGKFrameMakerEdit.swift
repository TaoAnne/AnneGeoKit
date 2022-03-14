//
//  AGKFrameMakerActions.swift
//  AnneGeoKit
//
//  Created by Littlefox iOS Developer on 2022/03/08.
//

import Foundation
import UIKit


public class AGKFrameMakerEdit {
    
//    internal let description: AGKFrameDescription
    
    let attribute: AGKAttribute
    let item: AGKView
    
    internal init(item: AGKView,  attribute: AGKAttribute) {
        self.attribute = attribute
        self.item = item
    }
    
    @discardableResult
    public func equalTo(start: CGFloat = 0, amount: CGFloat, rate: (n: CGFloat, d: CGFloat) = (1,1)){

        switch attribute{
        case .x:
            self.item.frame.origin.x = start + amount*(rate.n/rate.d)
            break
        case .y:
            self.item.frame.origin.y = start + amount*(rate.n/rate.d)
            break
        case .width:
            self.item.frame.size.width = start + amount*(rate.n/rate.d)
            break
        case .height:
            self.item.frame.size.height = start + amount*(rate.n/rate.d)
            break
        default:
            break
        }
    }
    
//    public func setText(text: String?, isBold: Bool, fontSize: CGFloat, rate: (n: CGFloat, d: CGFloat) = (1,1)) -> AGKFrameMakerActions{
//        self.description.fontData = AGKDescription.FontData(isBold: isBold, size: fontSize*(rate.n/rate.d), text: text)
//        self.description.updateLabel()
//        return self
//    }
 
}

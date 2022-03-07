//
//  V.swift
//  AnneGoeKitExample
//
//  Created by Littlefox iOS Developer on 2022/03/04.
//

import Foundation
import UIKit

class VTN: UIButton{
    deinit{
        print("deiti \(self)")
    }
}

protocol V: UIView {
    
}

class Child_V: UIView, V{
    init(){
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .red
        
        
        let btn = VTN()
        btn.akg.makeFrame { maker in
            maker.x = 100
            maker.y = 100
            maker.w = 100
            maker.h = 100
            maker.backColor = .yellow
//            maker.item.setImage(<#T##CIImage#>)
        }
        self.addSubview(btn)
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            btn.removeFromSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

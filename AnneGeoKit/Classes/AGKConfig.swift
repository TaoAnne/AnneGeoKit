//
//  AGKConfig.swift
//  LittleFox
//
//  Created by Littlefox iOS Developer on 2022/02/11.
//

import Foundation
#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif


#if os(iOS) || os(tvOS)
    public typealias AGKView = UIView
#else
    public typealias AGKView = NSView
#endif


class AGKConfig: NSObject{
    
    let standardSize: StandardSize
    
    init(standardSize: StandardSize) {
        self.standardSize = standardSize
    }
}

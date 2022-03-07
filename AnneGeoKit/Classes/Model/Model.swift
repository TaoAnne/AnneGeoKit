//
//  Model.swift
//  LittleFox
//
//  Created by Littlefox iOS Developer on 2022/02/11.
//

import Foundation
import UIKit

public struct StandardSize{
    let pad: CGSize
    let phone: CGSize
}

public struct AKGAniOption{
    let duration: TimeInterval
    let delay: TimeInterval
    let acts: UIView.AnimationOptions
    
    init(duration: TimeInterval, delay: TimeInterval = 0, acts: UIView.AnimationOptions = []){
        self.duration = duration
        self.delay = delay
        self.acts = acts
    }
}

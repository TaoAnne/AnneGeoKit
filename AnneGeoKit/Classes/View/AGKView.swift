//
//  AGKView.swift
//  LittleFox
//
//  Created by Littlefox iOS Developer on 2022/02/11.
//

import Foundation
import UIKit

public extension AGKView {
    var agk: AGK {
        return AGK(view: self)
    }
}

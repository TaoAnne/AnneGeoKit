//
//  AKG.swift
//  AnneGeoKit
//
//  Created by Littlefox iOS Developer on 2022/03/08.
//

import Foundation
import UIKit

public struct AGK: AGKDI{
    public var view: AGKView
    public init(view: AGKView){
        self.view = view
    }
}

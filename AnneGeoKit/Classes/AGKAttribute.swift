//
//  AGKAttribute.swift
//  AnneGeoKit
//
//  Created by Littlefox iOS Developer on 2022/03/08.
//

import Foundation

public struct AGKAttribute : OptionSet, ExpressibleByIntegerLiteral {
        
    public typealias IntegerLiteralType = UInt
    
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    public init(_ rawValue: UInt) {
        self.init(rawValue: rawValue)
    }
    public init(nilLiteral: ()) {
        self.rawValue = 0
    }
    public init(integerLiteral rawValue: IntegerLiteralType) {
        self.init(rawValue: rawValue)
    }
    
    public private(set) var rawValue: UInt
    public static var allZeros: AGKAttribute { return 0 }
    public static func convertFromNilLiteral() -> AGKAttribute { return 0 }
    public var boolValue: Bool { return self.rawValue != 0 }
    
    public func toRaw() -> UInt { return self.rawValue }
    public static func fromRaw(_ raw: UInt) -> AGKAttribute? { return self.init(raw) }
    public static func fromMask(_ raw: UInt) -> AGKAttribute { return self.init(raw) }
    
    // normal
    
    public static let none: AGKAttribute = 0
    public static let x: AGKAttribute = AGKAttribute(UInt(1) << 0)
    public static let y: AGKAttribute = AGKAttribute(UInt(1) << 1)
    public static let centerX: AGKAttribute = AGKAttribute(UInt(1) << 2)
    public static let centerY: AGKAttribute = AGKAttribute(UInt(1) << 3)
    public static let width: AGKAttribute = AGKAttribute(UInt(1) << 4)
    public static let height: AGKAttribute = AGKAttribute(UInt(1) << 5)
    public static let insectTop: AGKAttribute = AGKAttribute(UInt(1) << 6)
    public static let insectBottom: AGKAttribute = AGKAttribute(UInt(1) << 7)
    public static let insectLeft: AGKAttribute = AGKAttribute(UInt(1) << 8)
    public static let insectRight: AGKAttribute = AGKAttribute(UInt(1) << 9)
    public static let backColor: AGKAttribute = AGKAttribute(UInt(1) << 10)
    public static let fontData: AGKAttribute = AGKAttribute(UInt(1) << 11)

    
    static public func + (left: AGKAttribute, right: AGKAttribute) -> AGKAttribute {
        return left.union(right)
    }

    static public func += (left: inout AGKAttribute, right: AGKAttribute) {
        left.formUnion(right)
    }

    static public func -= (left: inout AGKAttribute, right: AGKAttribute) {
        left.subtract(right)
    }

    static public func == (left: AGKAttribute, right: AGKAttribute) -> Bool {
        return left.rawValue == right.rawValue
    }

}



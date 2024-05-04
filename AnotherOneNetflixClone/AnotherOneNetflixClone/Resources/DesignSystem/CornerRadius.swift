//
//  CornerRadius.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 04.05.2024.
//

import Foundation

public enum CornerRadius {
    /// 2
    public static var xs: CGFloat { 2 * DeviceType.multiplier }
    /// 8
    public static var s: CGFloat { 8 * DeviceType.multiplier }
    /// 14
    public static var m: CGFloat { 14 * DeviceType.multiplier }
    /// 16
    public static var l: CGFloat { 16 * DeviceType.multiplier }
    /// 20
    public static var xl: CGFloat { 20 * DeviceType.multiplier }
}

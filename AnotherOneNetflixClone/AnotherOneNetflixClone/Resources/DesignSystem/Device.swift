//
//  Device.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 04.05.2024.
//

import Foundation
import DeviceKit

public enum DeviceType {
    
    public static var isSmallPhone: Bool {
        Device.current.diagonal <= 4.7
    }
    
    public static var isPhone: Bool {
        Device.current.isPhone
    }
    
    public static var isPadMini: Bool {
        Device.current.isOneOf(Device.allMiniDevices) || Device.current.isOneOf(Device.allSimulatorMiniDevices)
    }
    
    public static var isPad: Bool {
        Device.current.isPad
    }
    
    public static var multiplier: CGFloat {
        if DeviceType.isSmallPhone {
            return 0.8
        } else if DeviceType.isPhone {
            return 1
        } else if DeviceType.isPadMini {
            return 1.2
        } else {
            return 1.5
        }
    }
}

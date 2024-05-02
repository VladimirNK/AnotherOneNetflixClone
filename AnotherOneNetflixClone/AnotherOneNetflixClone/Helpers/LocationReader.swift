//
//  LocationReader.swift
//  AnotherOneNetflixClone
//
//  Created by Vladimir Kozlov on 02.05.2024.
//

import SwiftUI

@available(iOS 14, *)
/// Adds a transparent View and read it's center point.
///
/// Adds a GeometryReader with 0px by 0px frame.
public struct LocationReader: View {
    
    let coordinateSpace: CoordinateSpace
    let onChange: (_ location: CGPoint) -> Void

    public init(coordinateSpace: CoordinateSpace, onChange: @escaping (_ location: CGPoint) -> Void) {
        self.coordinateSpace = coordinateSpace
        self.onChange = onChange
    }
    
    public var body: some View {
        FrameReader(coordinateSpace: coordinateSpace) { frame in
            onChange(CGPoint(x: frame.midX, y: frame.midY))
        }
        .frame(width: 0, height: 0, alignment: .center)
    }
}

@available(iOS 14, *)
public extension View {
    
    /// Get the center point of the View
    ///
    /// Adds a 0px GeometryReader to the background of a View.
    func readingLocation(coordinateSpace: CoordinateSpace = .global, onChange: @escaping (_ location: CGPoint) -> ()) -> some View {
        background(LocationReader(coordinateSpace: coordinateSpace, onChange: onChange))
    }
    
}

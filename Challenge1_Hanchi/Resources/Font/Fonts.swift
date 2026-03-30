//
//  Fonts.swift
//  SJ-Seed
//
//  Created by 김나영 on 9/16/25.
//

import Foundation
import SwiftUI

extension Font {
    // 온글잎 밑미 (Regular만 존재)
    enum OwnglyphMeetme: String {
        case regular = "Ownglyph_meetme-Rg"
        
        func font(size: CGFloat) -> Font {
            return .custom(self.rawValue, size: size)
        }
    }
}

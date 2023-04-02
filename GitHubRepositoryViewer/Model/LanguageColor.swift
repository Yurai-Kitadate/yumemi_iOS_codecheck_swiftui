
import Foundation
import SwiftUI

struct Language{
    let name: String
    let color: Color
}

struct LanguageColor {
    var languagesMap : [String:Color] = [:]
    
    
    init() {
        guard let url = Bundle.main.url(forResource: "language", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let jsons = try? JSONSerialization.jsonObject(with: data) as? [String: [String: String?]]
        else {
            fatalError("json parse error")
        }
        for (name,color) in jsons{
            var colorcode = color["color"]!
            if colorcode != nil{
                colorcode!.removeFirst(1)
            }
            if let colorcode = colorcode{
                languagesMap[name] = Color(hex: colorcode)
                print(name,color)
            }
        }
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

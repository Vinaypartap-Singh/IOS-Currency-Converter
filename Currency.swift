import SwiftUI


// To turn enum into array use CaseIterbale

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }
    
    
    var image:ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    
    func convert(amountString: String, currency: Currency) -> String {
        // guard is keyword like If / Else
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        
        
        let convertAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        
        return String(format: "%.2f", convertAmount)
    }
    
    
    
}

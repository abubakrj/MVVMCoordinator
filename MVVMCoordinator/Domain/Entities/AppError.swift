import Foundation

struct AppError {
    let message: String
}

extension AppError: LocalizedError {
    
    var errorDescription: String? {
        return message
    }
}

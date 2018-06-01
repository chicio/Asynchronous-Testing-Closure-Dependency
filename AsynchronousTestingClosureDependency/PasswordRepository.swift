import Foundation

public protocol PasswordRepository {
    func save(password: String)
}

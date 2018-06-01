import Foundation

public protocol PasswordService {
    func update(password: String, completion: @escaping (Bool, Error) -> ())
}

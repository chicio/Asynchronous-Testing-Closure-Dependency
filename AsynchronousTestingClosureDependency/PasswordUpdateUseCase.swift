import Foundation

public class PasswordUpdateUseCase {
    private let passwordService: PasswordService
    private let passwordRepository: PasswordRepository
    
    public init(passwordService: PasswordService, passwordRepository: PasswordRepository) {
        self.passwordService = passwordService
        self.passwordRepository = passwordRepository
    }
    
    public func update(password: String) {
        passwordService.update(password: password) { success, error in
            if success {
                self.passwordRepository.save(password: password)
            }
        }
    }
}

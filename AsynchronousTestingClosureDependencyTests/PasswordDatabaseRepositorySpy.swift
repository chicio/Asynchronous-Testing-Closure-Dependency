import Foundation

class PasswordDatabaseRepositorySpy: PasswordRepository {
    private(set) var savePasswordHasBeenCalled = false
    
    func save(password: String) {
        savePasswordHasBeenCalled = true
    }
}

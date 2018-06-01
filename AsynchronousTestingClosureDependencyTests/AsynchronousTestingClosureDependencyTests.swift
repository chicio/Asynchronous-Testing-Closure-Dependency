import XCTest

class AsynchronousTestingClosureDependencyTests: XCTestCase {
    
    func testUseCaseUpdatePasswordSuccessful() {
        let updateExpectation = expectation(description: "updateExpectation")
        let service = PasswordNetworkServiceSpy(expectation: updateExpectation, successful: true)
        let repository = PasswordDatabaseRepositorySpy()
        let passwordUseCase = PasswordUpdateUseCase(passwordService: service,
                                                    passwordRepository: repository)
        passwordUseCase.update(password: "::password::")
        wait(for: [updateExpectation], timeout: 300)
        XCTAssertTrue(service.updatePasswordHasBeenCalled)
        XCTAssertTrue(repository.savePasswordHasBeenCalled)
    }
    
    func testUseCaseUpdatePasswordFail() {
        let updateExpectation = expectation(description: "updateExpectation")
        let service = PasswordNetworkServiceSpy(expectation: updateExpectation, successful: false)
        let repository = PasswordDatabaseRepositorySpy()
        let passwordUseCase = PasswordUpdateUseCase(passwordService: service,
                                                    passwordRepository: repository)
        passwordUseCase.update(password: "::password::")
        wait(for: [updateExpectation], timeout: 300)
        XCTAssertTrue(service.updatePasswordHasBeenCalled)
        XCTAssertFalse(repository.savePasswordHasBeenCalled)
    }
}

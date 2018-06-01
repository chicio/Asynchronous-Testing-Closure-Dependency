import Foundation
import XCTest

class PasswordNetworkServiceSpy: PasswordService {
    private(set) var updatePasswordHasBeenCalled = false
    private let expectation: XCTestExpectation
    private let successful: Bool

    init(expectation: XCTestExpectation, successful: Bool) {
        self.expectation = expectation
        self.successful = successful
    }
    
    func update(password: String, completion: @escaping (Bool, Error) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            self.updatePasswordHasBeenCalled = true
            completion(self.successful, NSError(domain: "error", code: -1, userInfo: nil))
            self.expectation.fulfill()
        }
    }
}

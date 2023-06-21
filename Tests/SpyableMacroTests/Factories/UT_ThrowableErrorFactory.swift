import XCTest
@testable import SpyableMacro
import SwiftSyntax

final class UT_ThrowableErrorFactory: XCTestCase {
    func testVariableDeclaration() {
        let variablePrefix = "functionName"

        let result = ThrowableErrorFactory().variableDeclaration(variablePrefix: variablePrefix)

        assertBuildResult(
            result,
            """
            var functionNameThrowableError: Error?
            """
        )
    }

    func testThrowErrorExpression() {
        let variablePrefix = "function_name"

        let result = ThrowableErrorFactory().throwErrorExpression(variablePrefix: variablePrefix)

        assertBuildResult(
            result,
            """
            if let function_nameThrowableError {
                throw function_nameThrowableError
            }
            """
        )
    }

}

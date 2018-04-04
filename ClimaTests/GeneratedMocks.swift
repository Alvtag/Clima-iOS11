// MARK: - Mocks generated from file: Clima/SomeClassWithFunction.swift at 2018-04-04 20:12:06 +0000

//
//  SomeClassWithFunction.swift
//  Clima
//
//  Created by Alvin Fong on 2018-04-03.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Cuckoo
@testable import Clima

import Foundation

class MockSomeClassWithFunction: SomeClassWithFunction, Cuckoo.ClassMock {
    typealias MocksType = SomeClassWithFunction
    typealias Stubbing = __StubbingProxy_SomeClassWithFunction
    typealias Verification = __VerificationProxy_SomeClassWithFunction
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "thisMethodShouldBeMocked", "returnSignature": "", "fullyQualifiedName": "thisMethodShouldBeMocked()", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func thisMethodShouldBeMocked()  {
        
            return cuckoo_manager.call("thisMethodShouldBeMocked()",
                parameters: (),
                superclassCall:
                    
                    super.thisMethodShouldBeMocked()
                    )
        
    }
    

	struct __StubbingProxy_SomeClassWithFunction: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func thisMethodShouldBeMocked() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockSomeClassWithFunction.self, method: "thisMethodShouldBeMocked()", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_SomeClassWithFunction: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func thisMethodShouldBeMocked() -> Cuckoo.__DoNotUse<Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("thisMethodShouldBeMocked()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class SomeClassWithFunctionStub: SomeClassWithFunction {
    

    

    
     override func thisMethodShouldBeMocked()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}


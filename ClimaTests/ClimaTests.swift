import XCTest
@testable import Clima    // import the module under test

/*
 ALVTAG testing notes
 - Swift default mocking is to... create a subclass, override methods (init; methods) as empty!
 - cuckoo verify might be done by the above override method + adding a counter every time it's called
 - cuckoo is rather limited- no finals, no global const/functions. but it's nice for regular mockito-like function.

 - singltons: wrap it in a extension
     protocol NetworkEngine {
        typealias Handler = (Data?, URLResponse?, Error?) -> Void
        func performRequest(for url: URL, completionHandler: @escaping Handler)
     }
 - URL Session has been extended to conform to the above protocol
     extension URLSession: NetworkEngine {
        typealias Handler = NetworkEngine.Handler
        func performRequest(for url: URL, completionHandler: @escaping Handler) {
            let task = dataTask(with: url, completionHandler: completionHandler)
            task.resume()
        }
     }
 
 - use the protocol (dependency inject) with a default value
 class DataLoader {
    private let engine: NetworkEngine
    init(engine: NetworkEngine = URLSession.shared) { // prod code can use DataLoader() for backwards compat
    self.engine = engine                              // test code can inject using DataLoader(mockOfProtocol)
    }
 }
 */
class ClimaTests: XCTestCase {
    let modelUnderTest = WeatherDataModel()
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    //ALVTAG: tests must begin with the charsequence "test"
    func testIconForTStorm() {
        print ("begin test")
        
        let mockFoo = MockSomeClassWithFunction()
        
        var result = modelUnderTest.updateWeatherIcon(condition: 111, betterFoo:mockFoo)
        XCTAssertEqual("tstorm1", result)
    
        result = modelUnderTest.updateWeatherIcon(condition: 302, betterFoo: mockFoo)
        XCTAssertEqual("light_rain", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 551, betterFoo: mockFoo)
        XCTAssertEqual("shower3", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 667, betterFoo: mockFoo)
        XCTAssertEqual("snow4", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 742, betterFoo: mockFoo)
        XCTAssertEqual("fog", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 777, betterFoo: mockFoo)
        XCTAssertEqual("tstorm3", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 800, betterFoo: mockFoo)
        XCTAssertEqual("sunny", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 901, betterFoo: mockFoo)
        XCTAssertEqual("tstorm3", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 802, betterFoo: mockFoo)
        XCTAssertEqual("cloudy2", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 933, betterFoo: mockFoo)
        XCTAssertEqual("tstorm3", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 903, betterFoo: mockFoo)
        XCTAssertEqual("snow5", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 904, betterFoo: mockFoo)
        XCTAssertEqual("sunny", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 905, betterFoo: mockFoo)
        XCTAssertEqual("tstorm3", result)
        
        result = modelUnderTest.updateWeatherIcon(condition: 1001, betterFoo: mockFoo)
        XCTAssertEqual("dunno", result)
    }
}

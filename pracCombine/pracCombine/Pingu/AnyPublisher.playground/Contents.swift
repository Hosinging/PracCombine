import Cocoa
import Combine

let originalPublisher = [1, nil, 3].publisher

let anyPublisher = originalPublisher.eraseToAnyPublisher() //AnyPublisher로 래핑
anyPublisher.sink { value in
    print(value)
}

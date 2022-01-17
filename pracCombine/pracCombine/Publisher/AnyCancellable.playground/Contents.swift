import Cocoa
import Combine

//MARK: AnyCancellable예제
let subject = PassthroughSubject<Int, Never>()
let anyCancellable = subject
    .sink { completion in
        print("received completion: \(completion)")
    } receiveValue: { value in
        print("received value: \(value)")
    }

subject.send(1)
anyCancellable.cancel()
subject.send(2)

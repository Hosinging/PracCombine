import Cocoa
import Combine

struct HoPublisher: Publisher {
    typealias Output = String
    typealias Failure = Never
    
    func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, String == S.Input {
        subscriber.receive("안녕 나는 퍼블리셔")
        subscriber.receive(completion: .finished)
    }
}

print("deferred publisher가 만들어짐")
let deferred = Deferred { () -> HoPublisher in
    print("퍼블리셔가 만들어짐\n")
    return HoPublisher()
}

deferred
    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

/*
 deferred publisher가 만들어짐
 퍼블리셔가 만들어짐

 안녕 나는 퍼블리셔
 finished
 */

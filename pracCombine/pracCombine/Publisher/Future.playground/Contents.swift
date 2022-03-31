import Cocoa
import Combine

var subscriptions = Set<AnyCancellable>()
var emitValue = "내보낸 값"
var delay: TimeInterval = 3

let future = Future<String, Never> { promise in
    delay -= 1
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        promise(.success(emitValue))
    }
}

future.sink {
    print("첫번째 Subscriber completion: \($0)")
} receiveValue: {
    print("첫번째 Subscriber Value: \($0)")
}
.store(in: &subscriptions)

future.sink {
    print("두번째 Subscriber completion: \($0)")
} receiveValue: {
    print("두번째 Subscriber Value: \($0)")
}
.store(in: &subscriptions)

/*
 첫번째 Subscriber Value: 내보낸 값
 첫번째 Subscriber completion: finished
 두번째 Subscriber Value: 내보낸 값
 두번째 Subscriber completion: finished
 */

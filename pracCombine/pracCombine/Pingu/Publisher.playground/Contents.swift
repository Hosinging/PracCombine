import Cocoa
import Combine

class IntSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
    
    //Publisher가 Subscription주면 호출됨
    func receive(subscription: Subscription) {
        //5. Subscriber는 Subscription을 받으면 Publisher에게 request(_:)를 통해 값을 달라고 한다.
        subscription.request(.max(1))
    }
    //Publisher가 주는 값을 처리
    func receive(_ input: Int) -> Subscribers.Demand {
        print("Received value: \(input)")
        //Publisher에게 한번 더 달라고 요청
        return .max(1)
    }
    //6. Publisher는 값을 Subscriber에게 주다가 더 이상 줄게 없으면 completion event를 전달한다.
    func receive(completion: Subscribers.Completion<Never>) {
        print("Received completion: \(completion)")
    }
}
//1. publisher
let intArray: [Int] = [1, 2, 3, 4, 5]
//2. subscriber
let intSubscriber = IntSubscriber()

//Int Array Publisher를 Subscribe.
intArray.publisher
//3. intSubscriber가 intArray.publisher에게 값을 요청하면 달라고 말한다.
    .subscribe(intSubscriber) //
//4. Publisher가 subscription을 만들어서 receive(subscription:)을 통해 Subscriber에게 준다.

/*
 Received value: 1
 Received value: 2
 Received value: 3
 Received value: 4
 Received value: 5
 Received completion: finished
 */


